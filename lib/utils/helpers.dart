import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(String url) async {
  // If mailto URL, handle web and mobile smoothly with Gmail support
  if (url.startsWith('mailto:')) {
    final emailAddress = url.replaceFirst('mailto:', '').split('?').first;
    await sendMail(emailAddress);
    return;
  }

  final uri = Uri.parse(url);
  try {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } catch (_) {
    await launchUrl(uri);
  }
}

Future<void> sendMail(String to, {String subject = '', String body = ''}) async {
  // Direct Gmail web compose URL which works 100% on all browsers without asking for Windows mail client setup
  final gmailWeb = Uri.parse(
    'https://mail.google.com/mail/?view=cm&fs=1&to=$to'
    '&su=${Uri.encodeComponent(subject)}'
    '&body=${Uri.encodeComponent(body)}',
  );

  final mailtoUri = Uri(
    scheme: 'mailto',
    path: to,
    queryParameters: {
      if (subject.isNotEmpty) 'subject': subject,
      if (body.isNotEmpty) 'body': body,
    },
  );

  if (kIsWeb) {
    // In web browsers, opening Gmail Web compose directly in new tab is instant and never fails
    try {
      final launched = await launchUrl(gmailWeb, mode: LaunchMode.externalApplication);
      if (!launched) {
        await launchUrl(mailtoUri, mode: LaunchMode.externalApplication);
      }
    } catch (_) {
      await launchUrl(mailtoUri);
    }
  } else {
    // In mobile apps, open system email client / Gmail app
    try {
      final launched = await launchUrl(mailtoUri, mode: LaunchMode.externalApplication);
      if (!launched) {
        await launchUrl(gmailWeb, mode: LaunchMode.externalApplication);
      }
    } catch (_) {
      await launchUrl(gmailWeb, mode: LaunchMode.externalApplication);
    }
  }
}

bool isWide(BuildContext context) => MediaQuery.of(context).size.width > 800;

void scrollTo(GlobalKey key) => Scrollable.ensureVisible(key.currentContext!,
    duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
