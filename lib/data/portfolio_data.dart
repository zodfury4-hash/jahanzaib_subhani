import '../models/project.dart';

// ───────── Jahanzaib Subhani - Flutter Developer ─────────
const myName = 'Jahanzaib Subhani';
const myRole = 'Flutter Developer';
const headline = 'Building fast, beautiful & scalable mobile apps.';
const myIntro =
    'Specialized in crafting pixel-perfect, high-performance Flutter apps for Android, iOS & Web. '
    'State management, REST APIs, Firebase & modern UI/UX.';

const email = 'jahanzaibsubhani@example.com';
const github = 'https://github.com/jahanzaibsubhani';
const linkedin = 'https://linkedin.com/in/jahanzaibsubhani';
const resumeUrl = 'https://example.com/jahanzaib-resume.pdf';

const aboutText =
    'Main Jahanzaib Subhani hoon, ek dedicated Flutter Developer jo scalable code aur '
    'smooth user experience ke saath Android aur iOS applications design aur develop karta hoon. '
    'Clean architecture, robust state management (Bloc/Provider), aur fluid animations mere daily tools hain.';

const stats = {'Projects': '6+', 'Experience': '1+ yr', 'Platforms': 'Android, iOS, Web'};

const skillGroups = {
  'Framework & Core': ['Flutter', 'Dart', 'State Management'],
  'Cloud, Realtime & APIs': ['Firebase', 'Zegocloud', 'Cloudinary', 'Api integration', 'MongoDB'],
  'Storage & Machine Learning': ['Local Storage', 'SharedPreferences', 'Google MlKit'],
};

const experiences = [
  Experience(
    'Flutter Developer',
    'Clixade',
    'August 2026 – Present',
    [
      'Work closely with UI/UX designers, backend teams, and stakeholders to deliver scalable Flutter applications and implement new features efficiently.',
      'Maintain consistent design patterns, responsive layouts, and clean code practices across all Flutter app components.',
    ],
  ),
  Experience(
    'Beginner Flutter Developer',
    'Edify College of IT',
    '2026 - August',
    [
      'Collaborate with UI/UX designers and backend developers to build, test, and ship responsive Flutter app screens and features based on provided wireframes and API specifications.',
      'Write clean, maintainable Flutter code following established design patterns, state management practices, and responsive layout guidelines across all application components.',
    ],
  ),
];

const projects = [
  Project(
    'Ai Expense Tracker',
    'AI-powered financial expense manager with receipt scanning & automated budget analytics.',
    ['Flutter', 'Google MlKit', 'Local Storage', 'Charts'],
    github,
    imageUrl:
        'https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?auto=format&fit=crop&w=1200&q=80',
    fullDescription:
        'Ai Expense Tracker ek intelligent personal finance application hai jo AI-driven OCR (Google MLKit) ke zariye manual data entry ko khatam karti hai. Receipts scan kar ke kharchon ko categorize karti hai aur visual spending charts provide karti hai. Fast local storage ke sath offline-first architecture par mabni hai.',
    features: [
      'Google MLKit camera receipt & invoice OCR auto-scanner',
      'Smart automated expense categorization & monthly budgets',
      'Interactive visual charts (FL Chart) spending breakdown',
      'Fast offline-first Local Storage (SQLite / Hive)',
      'Multi-currency support aur monthly overspending alerts',
    ],
  ),
  Project(
    'Stitch&Witch',
    'Bespoke tailoring platform with dedicated Tailor, Client & Admin portals and real-time live order tracking.',
    ['Flutter', 'Provider', 'Firebase', 'Cloudinary', 'FCM'],
    github,
    imageUrl:
        'https://images.unsplash.com/photo-1558769132-cb1aea458c5e?auto=format&fit=crop&w=1200&q=80',
    fullDescription:
        'Stitch&Witch is an end-to-end bespoke fashion and tailoring platform featuring 3 dedicated role portals: Tailor, Client, and Admin. Tailors upload product catalogs with high-res photos to Cloudinary CDN, categorized in the Client app. Clients place custom measurement orders, tailors accept requests in real-time, and clients receive live interactive order tracking powered by Firebase Firestore and FCM notifications.',
    features: [
      'Dedicated 3-role portals: Tailor, Client, and Admin control dashboard',
      'Tailor catalog upload with Cloudinary CDN high-resolution image optimization',
      'Category-based client browsing and custom body measurement order placement',
      'Real-time order acceptance workflow with instant FCM push notifications',
      'Live interactive order lifecycle progress tracking for clients',
      'Comprehensive Admin management panel for all users, tailors, and orders',
    ],
  ),
  Project(
    'ChatFlow',
    'Real-time communication app with connection-gated messaging, stories/status updates, and ZegoCloud calling.',
    ['Flutter', 'Provider', 'Firebase', 'ZegoCloud', 'FCM'],
    github,
    imageUrl:
        'https://images.unsplash.com/photo-1611746872915-64382b5c76da?auto=format&fit=crop&w=1200&q=80',
    fullDescription:
        'ChatFlow features a complete onboarding and communication pipeline: Splash ➔ Firebase Auth ➔ Home dashboard. Users search other users by name and send connection requests. Direct messaging is strictly locked until the recipient accepts the request. Friends can view and share ephemeral status stories, chat in real-time, and launch crystal-clear HD audio and video calls powered by ZegoCloud with Provider state management and FCM push notifications.',
    features: [
      'Screen flow: Splash screen ➔ Firebase Auth ➔ Home communication dashboard',
      'User discovery with name search and permission-gated friend request flow',
      'Anti-spam connection lock: Messaging unlocks only when friend request is accepted',
      'Ephemeral Status & Stories system visible exclusively to accepted friends',
      'High-Definition voice and video calling powered by ZegoCloud RTC SDK',
      'Architected with Provider state management, Firebase Firestore, and FCM push notifications',
    ],
  ),
  Project(
    'Locki',
    'Real-time GPS location tracking and route navigation application powered by OpenStreetMap, Provider, and Firebase.',
    ['Flutter', 'Provider', 'Firebase', 'OpenStreetMap', 'Live Tracking'],
    github,
    imageUrl: 'assets/images/locki_showcase.jpg',
    fullDescription:
        'Locki is a real-time GPS location tracking and navigation app that features a clean flow from Splash screen to the interactive Home map. It enables continuous point-to-point live tracking from one place to another using OpenStreetMap (OSM) for open-source vector mapping, Provider for battery-optimized GPS updates, and Firebase Firestore for real-time live coordinate synchronization.',
    features: [
      'Seamless user flow from Splash screen directly to Home map screen',
      'One-place-to-another real-time live GPS route movement tracking',
      'High-performance OpenStreetMap (OSM) vector rendering with custom markers',
      'Dynamic route polylines with speed, heading, and distance metrics',
      'Architected with Provider state management and Firebase real-time data sync',
      'Battery-optimized location streams with smart distance thresholds',
    ],
  ),
  Project(
    'NoteZilla',
    'Multimedia productivity suite for text, audio & video notes with Cloudinary storage, Firebase Auth, and real-time editing.',
    ['Flutter', 'Provider', 'Firebase', 'Cloudinary', 'Audio & Video Notes'],
    github,
    imageUrl:
        'https://images.unsplash.com/photo-1517842645767-c639042777db?auto=format&fit=crop&w=1200&q=80',
    fullDescription:
        'NoteZilla is a multimedia notes application allowing users to capture Text notes, Voice/Audio notes, and recorded Video notes. Built with Firebase Authentication and Cloud Firestore for real-time note storage, heavy video and audio files are uploaded directly to Cloudinary CDN for instant playback. Users can create, organize, and edit existing notes at any time.',
    features: [
      'Triple-format note engine: Text notes, Audio voice memos, and Video notes',
      'Direct Cloudinary CDN upload and adaptive streaming for audio and video media',
      'Firebase Authentication for secure individual user account access',
      'Firebase Cloud Firestore for real-time note metadata, tags, and timestamps',
      'Full in-app editability allowing users to revise note text and media attachments',
      'Built with Provider state management for smooth reactive note manipulation',
    ],
  ),
  Project(
    'Matrix POS',
    'Point-of-Sale & retail management system with dual Admin and Cashier portals, local storage, bill printing, and auth.',
    ['Flutter', 'Provider', 'Local Storage', 'Thermal Printing', 'Dual Portals'],
    github,
    imageUrl:
        'https://images.unsplash.com/photo-1556742049-0a67e557224f?auto=format&fit=crop&w=1200&q=80',
    fullDescription:
        'Matrix POS is an offline-first retail Point-of-Sale system built with Role-Based Authentication and 2 dedicated portals: Admin and Cashier. The Admin portal allows store owners to register inventory items and onboard cashier staff. The Cashier portal enables fast retail checkout, automatic cart totals, and physical receipt printing via Bluetooth/USB thermal printers. Powered by high-speed Local Storage, it operates without internet delays.',
    features: [
      'Dual portal architecture: Dedicated Admin and Cashier terminals',
      'Admin portal: Product/item registration, barcode cataloging, and cashier management',
      'Cashier terminal: Lightning-fast billing, cart discount calculation, and checkout',
      'Thermal receipt printing: Integrated ESC/POS Bluetooth and USB printer support',
      'Offline-First Local Storage (SQLite / Hive) ensuring zero-delay retail transactions',
      'Role-based authentication securing administrative store configuration',
    ],
  ),
];

