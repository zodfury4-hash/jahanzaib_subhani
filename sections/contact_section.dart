import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/helpers.dart';
import '../widgets/section_wrapper.dart';
class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _name = TextEditingController();
  final _message = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      title: 'Contact',
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: line)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Project ya job ke liye message bhejo, main jaldi reply karta hoon.'),
          const SizedBox(height: 18),
          TextField(
            controller: _name,
            decoration: const InputDecoration(
                labelText: 'Your name', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 14),
          TextField(
            controller: _message,
            maxLines: 4,
            decoration: const InputDecoration(
                labelText: 'Message', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 16),
          Wrap(spacing: 12, runSpacing: 12, children: [
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: blue),
              onPressed: () => sendMail(email,
                  subject: 'Portfolio message from ${_name.text}',
                  body: _message.text),
              child: const Text('Send message'),
            ),
            OutlinedButton(
                onPressed: () => openUrl(github), child: const Text('GitHub')),
            OutlinedButton(
                onPressed: () => openUrl(linkedin), child: const Text('LinkedIn')),
          ]),
        ]),
      ),
    );
  }
}
