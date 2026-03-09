class Project {
  final String? title, category, summary, description;
  final List<String>? images;
  final List<String>? technologies;
  final String? githubUrl;
  final String? liveUrl;
  final List<String>? features;
  final String? challenge;
  final String? solution;

  const Project({
    this.title,
    this.category,
    this.summary,
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

const List<String> _grabGoCustomerImages = [
  "assets/images/projects/grabgo/customer/home_screen.png",
  "assets/images/projects/grabgo/customer/Screenshot_1772568681.png",
  "assets/images/projects/grabgo/customer/Screenshot_1772568710.png",
  "assets/images/projects/grabgo/customer/Screenshot_1772657734.png",
  "assets/images/projects/grabgo/customer/Screenshot_1772935081.png",
  "assets/images/projects/grabgo/customer/Screenshot_1772938430.png",
  "assets/images/projects/grabgo/customer/Screenshot_1772963087.png",
  "assets/images/projects/grabgo/customer/Screenshot_1772963094.png",
  "assets/images/projects/grabgo/customer/Screenshot_1772963137.png",
  "assets/images/projects/grabgo/customer/Screenshot_1772963145.png",
  "assets/images/projects/grabgo/customer/Screenshot_1772963148.png",
  "assets/images/projects/grabgo/customer/Screenshot_1772963155.png",
  "assets/images/projects/grabgo/customer/Screenshot_1772964992.png",
  "assets/images/projects/grabgo/customer/Screenshot_1772965017.png",
  "assets/images/projects/grabgo/customer/Screenshot_1772965018.png",
  "assets/images/projects/grabgo/customer/Screenshot_1772965024.png",
  "assets/images/projects/grabgo/customer/Screenshot_1772965039.png",
  "assets/images/projects/grabgo/customer/Screenshot_1772965046.png",
  "assets/images/projects/grabgo/customer/Screenshot_1772965813.png",
  "assets/images/projects/grabgo/customer/Screenshot_1772965829.png",
  "assets/images/projects/grabgo/customer/Screenshot_1773016032.png",
  "assets/images/projects/grabgo/customer/Screenshot_1773016039.png",
  "assets/images/projects/grabgo/customer/Screenshot_1773016076.png",
];

const List<String> _grabGoRiderImages = [
  "assets/images/projects/grabgo/rider/Screenshot_1773010491.png",
  "assets/images/projects/grabgo/rider/Screenshot_1773010498.png",
  "assets/images/projects/grabgo/rider/Screenshot_1773011484.png",
  "assets/images/projects/grabgo/rider/Screenshot_1773011499.png",
  "assets/images/projects/grabgo/rider/Screenshot_1773010477.png",
  "assets/images/projects/grabgo/rider/Screenshot_1773010390.png",
  "assets/images/projects/grabgo/rider/Screenshot_1772963316.png",
  "assets/images/projects/grabgo/rider/Screenshot_1772963308.png",
  "assets/images/projects/grabgo/rider/Screenshot_1772963302.png",
  "assets/images/projects/grabgo/rider/Screenshot_1772963296.png",
  "assets/images/projects/grabgo/rider/Screenshot_1772654224.png",
  "assets/images/projects/grabgo/rider/Screenshot_1772506102.png",
];

const List<String> _grabGoVendorImages = [
  "assets/images/projects/grabgo/vendor/Screenshot_1773010168.png",
  "assets/images/projects/grabgo/vendor/Screenshot_1773010165.png",
  "assets/images/projects/grabgo/vendor/Screenshot_1773010176.png",
  "assets/images/projects/grabgo/vendor/Screenshot_1773010184.png",
  "assets/images/projects/grabgo/vendor/Screenshot_1773010189.png",
  "assets/images/projects/grabgo/vendor/Screenshot_1773010198.png",
  "assets/images/projects/grabgo/vendor/Screenshot_1773010205.png",
  "assets/images/projects/grabgo/vendor/Screenshot_1773010216.png",
  "assets/images/projects/grabgo/vendor/Screenshot_1773010137.png",
  "assets/images/projects/grabgo/vendor/Screenshot_1773010133.png",
  "assets/images/projects/grabgo/vendor/Screenshot_1773010129.png",
  "assets/images/projects/grabgo/vendor/Screenshot_1773010125.png",
];

const List<String> _citsaImages = [
  "assets/images/projects/citsa/Screenshot_1772346928.png",
  "assets/images/projects/citsa/Screenshot_1772347432.png",
  "assets/images/projects/citsa/Screenshot_1772347334.png",
  "assets/images/projects/citsa/Screenshot_1772346854.png",
  "assets/images/projects/citsa/Screenshot_1772346672.png",
  "assets/images/projects/citsa/Screenshot_1772346656.png",
  "assets/images/projects/citsa/Screenshot_1772346570.png",
  "assets/images/projects/citsa/Screenshot_1772346509.png",
  "assets/images/projects/citsa/Screenshot_1772346498.png",
  "assets/images/projects/citsa/Screenshot_1772346455.png",
];

const List<String> _utagImages = [
  "assets/images/projects/utag/splash_screen.png",
  "assets/images/projects/utag/login_screen.png",
  "assets/images/projects/utag/register_screen.png",
];

const List<Project> demo_projects = [
  Project(
    title: "GrabGO Customer App",
    category: "Delivery Platform / Customer Experience",
    summary:
        "Customer-facing ordering app for browsing stores, customizing meals, managing carts, and placing mobile-first delivery orders.",
    description:
        "The GrabGO Customer App is the consumer side of the GrabGO delivery ecosystem. I built the experience around fast browsing, clear product discovery, item customization, and a checkout flow that keeps pricing and actions obvious on small screens. The app supports everyday ordering across food and convenience services while keeping the interface simple enough for repeat use.",
    images: _grabGoCustomerImages,
    technologies: [
      "Flutter",
      "Dart",
      "Node.js",
      "Express.js",
      "PostgreSQL",
      "Redis",
      "REST API",
    ],
    githubUrl: "https://github.com/zakjnr999/GrabGo",
    features: [
      "Location-aware home experience for nearby ordering",
      "Category-based browsing for groceries, pharmacy, mart, and parcel services",
      "Menu item detail pages with customization options",
      "Cart flow with quantity management and price visibility",
      "Promotional banners and first-order offers",
      "Order tracking and status-driven user flows",
      "Mobile-friendly navigation built for frequent repeat orders",
    ],
    challenge:
        "The main challenge was keeping a content-heavy shopping flow fast and easy to use on mobile while handling product options, cart state, and order actions without overwhelming the user.",
    solution:
        "I structured the UI around reusable product components, clear CTA placement, and backend-driven data models that kept catalog loading, item customization, and order state changes predictable across the app.",
  ),
  Project(
    title: "GrabGO Rider App",
    category: "Delivery Platform / Rider Operations",
    summary:
        "Operations app for riders to manage deliveries, monitor performance, and track incentives, streaks, and daily progress.",
    description:
        "The GrabGO Rider App supports the operational side of the delivery workflow. I focused on helping riders see what matters quickly: delivery counts, ratings, partner score, performance breakdowns, and incentive progress. The result is a dashboard-oriented experience that turns delivery metrics into a workflow riders can act on while staying on the move.",
    images: _grabGoRiderImages,
    technologies: [
      "Flutter",
      "Dart",
      "Node.js",
      "Express.js",
      "PostgreSQL",
      "Redis",
      "REST API",
    ],
    githubUrl: "https://github.com/zakjnr999/GrabGo",
    features: [
      "Rider dashboard with partner score and delivery statistics",
      "Performance views for on-time, completion, and acceptance rates",
      "Quest and streak tracking for delivery incentives",
      "Active versus completed work segmentation",
      "Daily targets and earnings motivation flows",
      "Operational UI designed for speed and readability",
    ],
    challenge:
        "The rider product needed to expose operational detail without slowing the rider down, especially when they are checking progress between live tasks.",
    solution:
        "I prioritized high-signal dashboards, lightweight navigation, and simple metric cards so riders can review performance, incentives, and job progress in a few quick interactions.",
  ),
  Project(
    title: "GrabGO Vendor App",
    category: "Delivery Platform / Merchant Operations",
    summary:
        "Merchant app for handling live order queues, filtering incoming requests, and keeping store fulfillment organized in real time.",
    description:
        "The GrabGO Vendor App gives restaurants and merchants a focused interface for processing orders from the platform. I designed it around queue visibility, fast state filtering, and quick action paths so vendors can preview orders, inspect details, and keep fulfillment moving without losing context. It is built to support real operational pressure at the point of sale.",
    images: _grabGoVendorImages,
    technologies: [
      "Flutter",
      "Dart",
      "Node.js",
      "Express.js",
      "PostgreSQL",
      "REST API",
    ],
    githubUrl: "https://github.com/zakjnr999/GrabGo",
    features: [
      "Live order queue with status filters",
      "Search by order ID or customer",
      "Fast preview and detailed order actions",
      "Clear pricing and fulfillment visibility",
      "Bottom navigation for merchant workflows",
      "Operational layout tailored for kitchens and store counters",
    ],
    challenge:
        "Vendors need to process orders quickly, so the interface had to surface urgency, status, and action paths without clutter or unnecessary taps.",
    solution:
        "I used a state-filtered order workflow, action-first cards, and a clear information hierarchy so merchants can move from incoming order to fulfillment with minimal friction.",
  ),
  Project(
    title: "CITSA Mobile App",
    category: "Student Community / Campus Communication",
    summary:
        "Student community platform for CITSA UCC with onboarding, announcements, classroom updates, and campus engagement features.",
    description:
        "The CITSA Mobile App is a student-focused platform built for the Computer Science and Information Technology Association at UCC. It combines identity setup, structured onboarding, announcements, classroom communication, and day-to-day student engagement in one mobile experience. I approached it as both a community product and an academic communication tool, making sure the app feels organized, useful, and easy to navigate.",
    images: _citsaImages,
    technologies: [
      "Flutter",
      "Dart",
      "Firebase",
      "Cloud Firestore",
      "FCM",
      "Node.js",
    ],
    githubUrl: "https://github.com/citsa-ucc-dev/citsa-mobile",
    features: [
      "Student sign-in and guided onboarding flow",
      "Email verification and profile setup",
      "Classroom announcements with pinned and urgent states",
      "Home feed for news, events, and opportunities",
      "Bottom navigation for classroom and community workflows",
      "Notification-ready structure for active student communication",
    ],
    challenge:
        "The product had to support both first-time onboarding and daily academic communication without feeling fragmented or difficult for students to follow.",
    solution:
        "I structured the experience around progressive onboarding, clear navigation, and dedicated communication surfaces so students can move naturally from setup to classroom and community participation.",
  ),
  Project(
    title: "UTAG National App",
    category: "Association Welfare / Internal Operations",
    summary:
        "Internal app for UTAG National focused on secure access, member onboarding, and welfare communication foundations.",
    description:
        "The UTAG National App is an internal product being developed to support structured communication and welfare engagement across a national association. The current work emphasizes secure access, registration, and a clean entry point for member-centered features such as birthday recognition, reminders, and internal updates. It is designed as a practical digital foundation for an organization that needs trust, order, and simplicity.",
    images: _utagImages,
    technologies: ["Flutter", "Dart", "Firebase", "Cloud Functions", "FCM"],
    features: [
      "Secure login and registration flow",
      "Institutional email verification for member access",
      "Foundation for birthday reminders and celebration messaging",
      "Role-aware structure for organization communication",
      "Internal welfare and reporting workflow direction",
      "Clean onboarding experience for national membership use",
    ],
    challenge:
        "The core challenge is building a member platform that feels trustworthy and simple while handling identity, privacy, and organization-wide communication requirements.",
    solution:
        "I approached the app with verified access flows, backend-ready communication hooks, and a clean UX that reduces friction for members while leaving room for future welfare and reporting features.",
  ),
];
