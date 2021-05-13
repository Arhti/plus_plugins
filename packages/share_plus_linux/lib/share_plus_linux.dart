/// The Linux implementation of `share_plus`.
library share_plus_linux;

import 'dart:ui';

import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus_platform_interface/share_plus_platform_interface.dart';

/// The Linux implementation of SharePlatform.
class ShareLinux extends SharePlatform {
  /// Share text.
  @override
  Future<void> share(
    String text, {
    String? subject,
    Rect? sharePositionOrigin,
  }) {
    final uri = 'mailto:?'
        'subject=${Uri.encodeComponent(subject ?? '')}'
        '&body=${Uri.encodeComponent(text)}';
    return launch(uri);
  }

  /// Share files.
  @override
  Future<void> shareFiles(
    List<String> paths, {
    List<String>? mimeTypes,
    String? subject,
    String? text,
    Rect? sharePositionOrigin,
  }) {
    throw UnimplementedError('shareFiles() has not been implemented on Linux.');
  }
}
