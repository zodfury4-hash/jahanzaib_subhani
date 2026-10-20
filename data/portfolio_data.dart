import '../models/project.dart';

// ───────── EDIT THIS: apni info yahan badlo ─────────
const myName = 'Your Name';
const myRole = 'Flutter Developer';
const headline = 'Main apps banata hoon jo log roz use karein.';
const myIntro =
    'Main Flutter mein clean, fast aur easy-to-use mobile apps banata hoon. '
    'State management, Firebase aur REST APIs mere daily tools hain.';

const email = 'you@example.com';
const github = 'https://github.com/your-username';
const linkedin = 'https://linkedin.com/in/your-username';
const resumeUrl = 'https://drive.google.com/file/d/1nCF485fhTsXwV5gh9-myhCV9ip18Pstf/view?usp=sharing';

const aboutText =
    'Main ek Flutter developer hoon jise ek hi codebase se Android aur iOS apps '
    'banana pasand hai. Mujhe user ke liye simple UI aur maintainable code '
    'dono pasand hain. Naye ideas ko kaam karti hui app mein badalna meri khaas pasand hai.';

const stats = {'Projects': '5+', 'Experience': '1+ yr', 'Platforms': 'Android, iOS, Web'};

const skillGroups = {
  'Language & Framework': ['Dart', 'Flutter'],
  'State management': ['Provider', 'Bloc', 'Riverpod', 'GetX'],
  'Backend & Data': ['Firebase', 'REST API', 'SQLite', 'Hive'],
  'Tools': ['Git & GitHub', 'Figma', 'VS Code', 'Android Studio'],
};

const experiences = [
  Experience('Flutter Developer', 'Company / Freelance', '2024 - Present', [
    'Android aur iOS apps banayi aur Play Store par publish ki.',
    'REST APIs aur Firebase integrate kiye.',
    'Clean architecture aur reusable widgets use kiye.',
  ]),
  Experience('Flutter Intern', 'Company Name', '2023 - 2024', [
    'Senior developers ke saath features par kaam kiya.',
    'Bugs fix kiye aur UI screens implement ki.',
  ]),
];

const projects = [
  Project('Expense Tracker',
      'Daily kharchay, budgets, investments aur loans ek hi app mein track karo.',
      ['Flutter', 'SQLite', 'Provider'], github),
  Project('Weather App', 'Live weather aur 7-din forecast, city search ke saath.',
      ['Flutter', 'REST API'], github),
  Project('Chat App', 'Real-time messaging with login, Firebase Auth aur Firestore.',
      ['Flutter', 'Firebase'], github),
  Project('E-commerce App', 'Products, cart, checkout aur order history.',
      ['Flutter', 'Bloc', 'REST API'], github),
];
