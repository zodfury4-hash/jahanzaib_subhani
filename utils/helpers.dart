import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(String url) =>
    launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);

Future<void> sendMail(String to, {String subject = '', String body = ''}) =>
    openUrl('mailto:$to?subject=${Uri.encodeComponent(subject)}'
        '&body=${Uri.encodeComponent(body)}');

bool isWide(BuildContext context) => MediaQuery.of(context).size.width > 800;

void scrollTo(GlobalKey key) => Scrollable.ensureVisible(key.currentContext!,
    duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
