/// The Windows implementation of `device_info_plus`.
library device_info_plus_windows;

import 'dart:ffi';
import 'dart:typed_data';

import 'package:device_info_plus_platform_interface/device_info_plus_platform_interface.dart';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';
import 'package:win32/win32.dart';
import 'package:win32_registry/win32_registry.dart';

import 'model/windows_device_info.dart';

/// The Windows implementation of [DeviceInfoPlatform].
class DeviceInfoPlusWindowsPlugin extends DeviceInfoPlatform {
  /// Register this dart class as the platform implementation for windows
  static void registerWith() {
    DeviceInfoPlatform.instance = DeviceInfoPlusWindowsPlugin();
  }

  WindowsDeviceInfo? _cache;

  /// Returns Windows information like major version, minor version, build number & platform ID.
  void Function(Pointer<OSVERSIONINFOEX>)? _rtlGetVersion;

  /// Returns a [WindowsDeviceInfo] with information about the device.
  @override
  Future<BaseDeviceInfo> deviceInfo() {
    return Future.value(_cache ??= getInfo());
  }

  @visibleForTesting
  WindowsDeviceInfo getInfo() {
    _rtlGetVersion ??= DynamicLibrary.open('ntdll.dll').lookupFunction<
        Void Function(Pointer<OSVERSIONINFOEX>),
        void Function(Pointer<OSVERSIONINFOEX>)>('RtlGetVersion');

    final systemInfo = calloc<SYSTEM_INFO>();
    final osVersionInfo = calloc<OSVERSIONINFOEX>();

    try {
      final currentVersionKey = Registry.openPath(RegistryHive.localMachine,
          path: r'SOFTWARE\Microsoft\Windows NT\CurrentVersion');
      final buildLab = currentVersionKey.getValueAsString('BuildLab') ?? '';
      final buildLabEx = currentVersionKey.getValueAsString('BuildLabEx') ?? '';
      final digitalProductIdValue =
          currentVersionKey.getValue('DigitalProductId');
      final digitalProductId = digitalProductIdValue != null
          ? digitalProductIdValue.data as Uint8List
          : [] as Uint8List;
      final displayVersion =
          currentVersionKey.getValueAsString('DisplayVersion') ?? '';
      final editionId = currentVersionKey.getValueAsString('EditionID') ?? '';
      final installDate = DateTime.fromMillisecondsSinceEpoch(
          1000 * (currentVersionKey.getValueAsInt('InstallDate') ?? 0));
      final productId = currentVersionKey.getValueAsString('ProductID') ?? '';
      var productName = currentVersionKey.getValueAsString('ProductName') ?? '';
      final registeredOwner =
          currentVersionKey.getValueAsString('RegisteredOwner') ?? '';
      final releaseId = currentVersionKey.getValueAsString('ReleaseId') ?? '';

      final sqmClientKey = Registry.openPath(RegistryHive.localMachine,
          path: r'SOFTWARE\Microsoft\SQMClient');
      final machineId = sqmClientKey.getValueAsString('MachineId') ?? '';

      GetSystemInfo(systemInfo);
      // Use `RtlGetVersion` from `ntdll.dll` to get the Windows version.
      _rtlGetVersion!(osVersionInfo);
      // Handle [productName] for Windows 11 separately (as per Raymond Chen's comment).
      // https://stackoverflow.com/questions/69460588/how-can-i-find-the-windows-product-name-in-windows-11
      if (osVersionInfo.ref.dwBuildNumber >= 22000) {
        productName = productName.replaceAll('10', '11');
      }
      final data = WindowsDeviceInfo(
        numberOfCores: systemInfo.ref.dwNumberOfProcessors,
        computerName: getComputerName(),
        systemMemoryInMegabytes: getSystemMemoryInMegabytes(),
        userName: getUserName(),
        majorVersion: osVersionInfo.ref.dwMajorVersion,
        minorVersion: osVersionInfo.ref.dwMinorVersion,
        buildNumber: osVersionInfo.ref.dwBuildNumber,
        platformId: osVersionInfo.ref.dwPlatformId,
        csdVersion: osVersionInfo.ref.szCSDVersion,
        servicePackMajor: osVersionInfo.ref.wServicePackMajor,
        servicePackMinor: osVersionInfo.ref.wServicePackMinor,
        suitMask: osVersionInfo.ref.wSuiteMask,
        productType: osVersionInfo.ref.wProductType,
        reserved: osVersionInfo.ref.wReserved,
        buildLab: buildLab,
        buildLabEx: buildLabEx,
        digitalProductId: digitalProductId,
        displayVersion: displayVersion,
        editionId: editionId,
        installDate: installDate,
        productId: productId,
        productName: productName,
        registeredOwner: registeredOwner,
        releaseId: releaseId,
        deviceId: machineId,
      );
      return data;
    } finally {
      free(systemInfo);
      free(osVersionInfo);
    }
  }

  @visibleForTesting
  int getSystemMemoryInMegabytes() {
    final memory = calloc<Uint64>();
    try {
      final result = GetPhysicallyInstalledSystemMemory(memory);
      if (result != 0) {
        return memory.value ~/ 1024;
      } else {
        final error = GetLastError();
        throw WindowsException(HRESULT_FROM_WIN32(error));
      }
    } finally {
      calloc.free(memory);
    }
  }

  @visibleForTesting
  String getComputerName() {
    final nameLength = calloc<Uint32>();
    String name;

    GetComputerNameEx(
      COMPUTER_NAME_FORMAT.ComputerNameDnsFullyQualified,
      nullptr,
      nameLength,
    );
    final namePtr = calloc<Uint16>(nameLength.value).cast<Utf16>();
    try {
      final result = GetComputerNameEx(
          COMPUTER_NAME_FORMAT.ComputerNameDnsFullyQualified,
          namePtr,
          nameLength);

      if (result != 0) {
        name = namePtr.toDartString();
      } else {
        throw WindowsException(HRESULT_FROM_WIN32(GetLastError()));
      }
    } finally {
      calloc.free(namePtr);
      calloc.free(nameLength);
    }
    return name;
  }

  @visibleForTesting
  String getUserName() {
    const unLen = 256;
    final pcbBuffer = calloc<DWORD>()..value = unLen + 1;
    final lpBuffer = wsalloc(unLen + 1);
    try {
      final result = GetUserName(lpBuffer, pcbBuffer);
      if (result != 0) {
        return lpBuffer.toDartString();
      } else {
        throw WindowsException(HRESULT_FROM_WIN32(GetLastError()));
      }
    } finally {
      free(pcbBuffer);
      free(lpBuffer);
    }
  }
}
