import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/helpers.dart';
import '../widgets/anim_effects.dart';
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
      title: 'Get In Touch',
      child: InViewReveal(
        delay: const Duration(milliseconds: 100),
        offset: const Offset(0, 30),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: line),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Have a project in mind or want to discuss a Flutter development opportunity? Feel free to reach out!',
                style: TextStyle(fontSize: 16, color: Color(0xFFC7CBD6), height: 1.5),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _name,
                decoration: InputDecoration(
                  labelText: 'Your Name',
                  filled: true,
                  fillColor: const Color(0xFF060709),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: line),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: emeraldAccent),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _message,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Your Message',
                  filled: true,
                  fillColor: const Color(0xFF060709),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: line),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: emeraldAccent),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 14,
                runSpacing: 12,
                children: [
                  HoverElevate(
                    translateY: -3,
                    glowColor: emeraldAccent,
                    child: FilledButton.icon(
                      style: FilledButton.styleFrom(
                        backgroundColor: emerald,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      icon: const Icon(Icons.send_rounded, size: 18),
                      label: const Text('Send Message', style: TextStyle(fontWeight: FontWeight.w700)),
                      onPressed: () => sendMail(
                        email,
                        subject: 'Portfolio message from ${_name.text}',
                        body: _message.text,
                      ),
                    ),
                  ),
                  HoverElevate(
                    translateY: -3,
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: line),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      icon: const Icon(Icons.code, size: 18, color: emeraldAccent),
                      label: const Text('GitHub'),
                      onPressed: () => openUrl(github),
                    ),
                  ),
                  HoverElevate(
                    translateY: -3,
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: line),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      icon: const Icon(Icons.link, size: 18, color: emeraldAccent),
                      label: const Text('LinkedIn'),
                      onPressed: () => openUrl(linkedin),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
