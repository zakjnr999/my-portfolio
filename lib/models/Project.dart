class Project {
  final String? title, description;
  final List<String>? images;
  final List<String>? technologies;
  final String? githubUrl;
  final String? liveUrl;
  final List<String>? features;
  final String? challenge;
  final String? solution;

  Project({
    this.title,
    this.description,
    this.images,
    this.technologies,
    this.githubUrl,
    this.liveUrl,
    this.features,
    this.challenge,
    this.solution,
  });
}

List<Project> demo_projects = [
  Project(
    title: "GrabGo Foods - Food Delivery Platform",
    description:
        "A comprehensive food delivery ecosystem featuring dual applications for customers and riders. The customer app offers seamless food ordering, real-time order tracking, and secure payment integration, while the rider app provides efficient delivery management with route optimization. Built with Flutter and powered by a custom Node.js/Express backend API with Redis for caching and real-time data synchronization.",
    images: [
      "assets/images/projects/grabgo/customer/splash_screen.png",
      "assets/images/projects/grabgo/customer/login_screen.png",
      "assets/images/projects/grabgo/customer/home_screen.png",
      "assets/images/projects/grabgo/customer/home_dark_mode.png",
      "assets/images/projects/grabgo/customer/categories_deals.png",
      "assets/images/projects/grabgo/customer/onboarding.png",
      "assets/images/projects/grabgo/rider/onboarding_1.png",
      "assets/images/projects/grabgo/rider/onboarding_2.png",
      "assets/images/projects/grabgo/rider/login_screen.png",
      "assets/images/projects/grabgo/rider/home_screen.png",
      "assets/images/projects/grabgo/rider/profile_menu.png",
      "assets/images/projects/grabgo/rider/wallet_screen.png",
      "assets/images/projects/grabgo/rider/profile_screen.png",
    ],
    technologies: ["Flutter", "Dart", "Node.js", "Express.js", "Redis", "PostgreSQL", "Google Maps API", "Socket.IO"],
    githubUrl: "https://github.com/zakjnr999/GrabGo",
    features: [
      "Real-time order tracking with live location updates",
      "Dual app system for customers and riders",
      "Secure payment integration with multiple payment methods",
      "Push notifications for order updates",
      "Route optimization for efficient deliveries",
      "Rating and review system",
      "Order history and favorites",
      "Real-time chat between customers and riders",
      "Redis caching for improved performance"
    ],
    challenge: "Managing real-time synchronization between customer and rider apps while ensuring optimal performance and minimal latency across the custom-built backend infrastructure.",
    solution: "Built a scalable RESTful API with Node.js and Express.js, implementing Socket.IO for real-time communication, Redis for caching frequently accessed data, and optimized PostgreSQL queries with proper indexing for fast data retrieval.",
  ),
  Project(
    title: "SlideBuddy - AI-Powered Study Assistant",
    description:
        "An innovative web-based educational platform designed for students to upload presentation slides and receive instant AI-generated summaries and comprehension questions. Features intelligent PDF analysis, personalized learning paths, and interactive quiz generation to enhance study efficiency and knowledge retention. Built with modern web technologies and powered by OpenAI's GPT models for accurate content analysis. Perfect for exam preparation and quick revision.",
    images: [
      "assets/images/projects/slidebuddy/home_upload.png",
      "assets/images/projects/slidebuddy/ai_summary.png",
      "assets/images/projects/slidebuddy/practice_questions.png",
      "assets/images/projects/slidebuddy/login_modal.png",
      "assets/images/projects/slidebuddy/history_page.png",
    ],
    technologies: ["React", "Next.js", "TypeScript", "OpenAI API", "Node.js", "Tailwind CSS", "Firebase"],
    githubUrl: "https://github.com/zakjnr999/SlideBuddy-Web",
    features: [
      "AI-powered PDF slide analysis and summarization",
      "Automatic practice question generation",
      "Real-time document processing",
      "User authentication and session management",
      "Document history and management",
      "Copy and export functionality",
      "Responsive web design",
      "Dark mode support",
      "PDF upload with drag-and-drop"
    ],
    challenge: "Processing and analyzing PDF slides efficiently while providing accurate AI-generated summaries and questions in real-time for a seamless user experience.",
    solution: "Developed a robust PDF processing pipeline integrated with OpenAI's GPT models, implementing efficient document parsing, smart caching strategies, and asynchronous processing to deliver instant results while maintaining accuracy.",
  ),
  Project(
    title: "CITSA Student Community - Academic Collaboration Hub",
    description:
        "A professional collaboration platform developed for Computer Science and IT students at UCC to facilitate academic networking, resource sharing, and community engagement. Features a comprehensive onboarding process with student verification, profile customization with skills and interests, discussion forums, event management, and real-time announcements. Designed to foster meaningful connections and enhance the academic experience through seamless digital interaction.",
    images: [
      "assets/images/projects/citsa/splash_screen.png",
      "assets/images/projects/citsa/signin_screen.png",
      "assets/images/projects/citsa/verify_email.png",
      "assets/images/projects/citsa/profile_setup_1.png",
      "assets/images/projects/citsa/profile_setup_2.png",
      "assets/images/projects/citsa/profile_setup_3.png",
    ],
    technologies: ["Flutter", "Dart", "Firebase", "Cloud Firestore", "FCM", "Node.js"],
    githubUrl: "https://github.com/citsa-ucc-dev/citsa-mobile",
    features: [
      "Student ID verification with university email",
      "Two-step authentication for security",
      "Comprehensive profile setup with skills and interests",
      "Academic journey tracking (program, graduation year)",
      "Portfolio and GitHub integration",
      "Discussion forums with threaded conversations",
      "Event calendar and RSVP system",
      "Resource library with file sharing",
      "Real-time announcements and notifications",
      "Department news feed"
    ],
    challenge: "Creating a secure and engaging platform that verifies student identity while encouraging active participation and maintaining a professional academic environment.",
    solution: "Implemented a robust student verification system using university email authentication, combined with an intuitive multi-step onboarding process that collects relevant academic information. Added gamification elements and moderation tools to foster healthy community engagement.",
  ),
  Project(
    title: "UTAG Welfare - Organization Management System [In Development]",
    description:
        "A specialized application currently under active development for the UTAG (University Teachers Association of Ghana) National organization. Designed to celebrate member birthdays and facilitate organizational communication with a comprehensive birthday tracking system, automated reminders, personalized celebration messages, and a dedicated reporting platform. Features institutional email verification for secure member access. This new project aims to streamline internal communication and strengthen community bonds across the organization.",
    images: [
      "assets/images/projects/utag/splash_screen.png",
      "assets/images/projects/utag/login_screen.png",
      "assets/images/projects/utag/register_screen.png",
    ],
    technologies: ["Flutter", "Dart", "Firebase", "Cloud Functions", "FCM", "Node.js"],
    features: [
      "Institutional email verification for members",
      "Secure authentication system",
      "Automated birthday tracking and reminders",
      "Personalized celebration messages",
      "Member directory with profiles",
      "Report submission system",
      "Announcement broadcasting",
      "Event management",
      "Photo gallery for celebrations",
      "Push notifications for important updates",
      "Role-based access control"
    ],
    challenge: "Building a secure platform that ensures timely birthday notifications while managing sensitive member data and maintaining privacy across a national organization.",
    solution: "Implementing Cloud Functions for scheduled notifications, robust data encryption with role-based access control, and institutional email verification to ensure only verified UTAG members can access the platform.",
  )
];

