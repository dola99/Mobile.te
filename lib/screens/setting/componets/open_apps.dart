import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenApps with ChangeNotifier {
  Future<void>? launched;

  Future<void> launchSocial(String url, String fallbackUrl) async {
    // Don't use canLaunch because of fbProtocolUrl (fb://)
    try {
      final launched = await launch(url, forceSafariVC: false);
      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false);
    }
  }
}
