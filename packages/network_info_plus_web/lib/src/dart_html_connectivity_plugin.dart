import 'dart:async';
import 'dart:html' as html show window;

import 'package:network_info_plus_platform_interface/network_info_plus_platform_interface.dart';
import 'package:network_info_plus_web/network_info_plus_web.dart';

/// The web implementation of the ConnectivityPlatform of the Connectivity plugin.
class DartHtmlConnectivityPlugin extends ConnectivityPlugin {
  /// Checks the connection status of the device.
  @override
  Future<ConnectivityResult> checkConnectivity() async {
    return html.window.navigator.onLine
        ? ConnectivityResult.wifi
        : ConnectivityResult.none;
  }

  StreamController<ConnectivityResult> _connectivityResult;

  /// Returns a Stream of ConnectivityResults changes.
  @override
  Stream<ConnectivityResult> get onConnectivityChanged {
    if (_connectivityResult == null) {
      _connectivityResult = StreamController<ConnectivityResult>();
      // Fallback to dart:html window.onOnline / window.onOffline
      html.window.onOnline.listen((event) {
        _connectivityResult.add(ConnectivityResult.wifi);
      });
      html.window.onOffline.listen((event) {
        _connectivityResult.add(ConnectivityResult.none);
      });
    }
    return _connectivityResult.stream;
  }
}
