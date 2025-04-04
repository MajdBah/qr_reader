import 'dart:io' show Platform;
import 'package:url_launcher/url_launcher.dart';

class UrlUtils {
  static bool isUrl(String text) {
    final urlPattern = RegExp(
      r'^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$',
      caseSensitive: false,
    );

    return urlPattern.hasMatch(text);
  }

  static Future<LaunchResult> launchURL(String url) async {
    String finalUrl = url;
    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      finalUrl = 'https://$url';
    }

    final Uri uri = Uri.parse(finalUrl);
    try {
      // Skip canLaunchUrl check on macOS as it's often unreliable
      bool canLaunch = true;

      if (!Platform.isMacOS) {
        canLaunch = await canLaunchUrl(uri);
      }

      if (canLaunch) {
        LaunchMode mode;

        // Use externalApplication on Android to ensure it opens in browser
        if (Platform.isAndroid) {
          mode = LaunchMode.externalApplication;
        } else {
          mode = LaunchMode.platformDefault;
        }

        final bool launched = await launchUrl(
          uri,
          mode: mode,
        );

        if (launched) {
          return LaunchResult(success: true);
        } else {
          return LaunchResult(
              success: false, errorMessage: 'Could not open the URL');
        }
      } else {
        return LaunchResult(
            success: false,
            errorMessage: 'No app available to handle this URL');
      }
    } catch (e) {
      print('Error launching URL: $e');
      return LaunchResult(
          success: false, errorMessage: 'Error: ${e.toString()}');
    }
  }
}

class LaunchResult {
  final bool success;
  final String? errorMessage;

  LaunchResult({required this.success, this.errorMessage});
}
