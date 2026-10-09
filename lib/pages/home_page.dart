import 'package:flutter/material.dart';

import '../sections/about_section.dart';
import '../sections/contact_section.dart';
import '../sections/experience_section.dart';
import '../sections/footer.dart';
import '../sections/hero_section.dart';
import '../sections/projects_section.dart';
import '../sections/skills_section.dart';
import '../theme/app_theme.dart';
import '../utils/helpers.dart';
import '../widgets/anim_effects.dart';
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
  final _scrollController = ScrollController();
  bool _precached = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_precached) {
      _precached = true;
      precacheImage(const AssetImage('assets/images/my.png'), context);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          NavBar(items: {
            'Works': () => scrollTo(_projects),
            'About': () => scrollTo(_about),
            'Skills': () => scrollTo(_skills),
            'Contact': () => scrollTo(_contact),
          }),
          ScrollProgressBar(scrollController: _scrollController),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
      ),
    );
  }
}
