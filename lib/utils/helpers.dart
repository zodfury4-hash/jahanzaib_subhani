import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(String url) =>
    launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);

Future<void> sendMail(String to, {String subject = '', String body = ''}) async {
  final mailtoUri = Uri(
    scheme: 'mailto',
    path: to,
    queryParameters: {
      if (subject.isNotEmpty) 'subject': subject,
      if (body.isNotEmpty) 'body': body,
    },
  );

  try {
    final launched = await launchUrl(
      mailtoUri,
      mode: LaunchMode.externalApplication,
    );
    if (!launched) {
      // Fallback directly to Gmail web compose
      final gmailWeb = Uri.parse(
        'https://mail.google.com/mail/?view=cm&fs=1&to=$to'
        '&su=${Uri.encodeComponent(subject)}'
        '&body=${Uri.encodeComponent(body)}',
      );
      await launchUrl(gmailWeb, mode: LaunchMode.externalApplication);
    }
  } catch (_) {
    final gmailWeb = Uri.parse(
      'https://mail.google.com/mail/?view=cm&fs=1&to=$to'
      '&su=${Uri.encodeComponent(subject)}'
      '&body=${Uri.encodeComponent(body)}',
    );
    await launchUrl(gmailWeb, mode: LaunchMode.externalApplication);
  }
}

bool isWide(BuildContext context) => MediaQuery.of(context).size.width > 800;

void scrollTo(GlobalKey key) => Scrollable.ensureVisible(key.currentContext!,
    duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
