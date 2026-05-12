import 'package:url_launcher/url_launcher.dart';

import 'ui_utils.dart';

class UrlUtils {
  static Future<void> launchCustomUrl(context, String? url) async {
    if (url != null) {
      Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        UiUtils.showSnackBar(context, 'Cannot launch $url');
      }
    }
  }
}
