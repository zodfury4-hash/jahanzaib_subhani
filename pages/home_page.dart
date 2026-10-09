import 'package:flutter/material.dart';

import '../sections/about_section.dart';
import '../sections/contact_section.dart';
import '../sections/experience_section.dart';
import '../sections/footer.dart';
import '../sections/hero_section.dart';
import '../sections/projects_section.dart';
import '../sections/skills_section.dart';
import '../utils/helpers.dart';
import '../widgets/nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _about = GlobalKey();
  final _skills = GlobalKey();
  final _experience = GlobalKey();
  final _projects = GlobalKey();
  final _contact = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        NavBar(items: {
          'About': () => scrollTo(_about),
          'Skills': () => scrollTo(_skills),
          'Experience': () => scrollTo(_experience),
          'Projects': () => scrollTo(_projects),
          'Contact': () => scrollTo(_contact),
        }),
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              HeroSection(onProjects: () => scrollTo(_projects)),
              AboutSection(key: _about),
              SkillsSection(key: _skills),
              ExperienceSection(key: _experience),
              ProjectsSection(key: _projects),
              ContactSection(key: _contact),
              const Footer(),
            ]),
          ),
        ),
      ]),
    );
  }
}
