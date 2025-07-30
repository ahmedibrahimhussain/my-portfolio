import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

void openWhatsApp(String localNumber) async {
  String cleaned = localNumber.trim();
  if (cleaned.startsWith('0')) {
    cleaned = cleaned.substring(1);
  }

  final fullNumber = '20$cleaned';
  final Uri url = Uri.parse("https://wa.me/$fullNumber");

  try {
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: kIsWeb ? LaunchMode.platformDefault : LaunchMode.externalApplication,
      );
    } else {
      throw 'Cannot launch $url';
    }
  } catch (e) {
    debugPrint('Error opening WhatsApp: $e');
  }
}
