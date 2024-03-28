package dev.fluttercommunity.plus.device_info

import android.content.Context
import android.content.pm.PackageManager
import android.view.WindowManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel

/** DeviceInfoPlusPlugin  */
class DeviceInfoPlusPlugin : FlutterPlugin {

    private lateinit var methodChannel: MethodChannel

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        setupMethodChannel(binding.binaryMessenger, binding.applicationContext)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        methodChannel.setMethodCallHandler(null)
    }

    private fun setupMethodChannel(messenger: BinaryMessenger, context: Context) {
        methodChannel = MethodChannel(messenger, "dev.fluttercommunity.plus/device_info")
        val packageManager: PackageManager = context.packageManager
        val handler = MethodCallHandlerImpl(packageManager, context)
        methodChannel.setMethodCallHandler(handler)
    }
}
