import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/screens/home/components/about_section.dart';
import 'package:my_portfolio/screens/home/components/contact_section.dart';
import 'package:my_portfolio/screens/home/components/home_banner.dart';
import 'package:my_portfolio/screens/home/components/projects_section.dart';
import 'package:my_portfolio/screens/home/components/recommendations_section.dart';
import 'package:my_portfolio/screens/main/main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey projectsKey = GlobalKey();

  void scrollToProjects() {
    final context = projectsKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      children: [
        HomeBanner(onExplorePressed: scrollToProjects),
        AboutSection(),
        ProjectsSection(key: projectsKey),
        RecommendationsSection(),
        ContactSection(),
      ],
    );
  }
}

class MyBuiltAnimatedText extends StatelessWidget {
  const MyBuiltAnimatedText({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(
        context,
      ).textTheme.bodySmall!.copyWith(color: Colors.white),
      child: Row(
        children: [
          FlutterCodedText(),
          SizedBox(width: defaultPadding / 2),
          Text("Built a "),
          AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText(
                "Full-Stack Food Delivery Platform with Customer and Rider Apps.",
                speed: Duration(milliseconds: 60),
              ),
              TypewriterAnimatedText(
                "AI-Powered Study Assistant for Students.",
                speed: Duration(milliseconds: 60),
              ),
              TypewriterAnimatedText(
                "Academic Collaboration Hub for Computer Science Students.",
                speed: Duration(milliseconds: 60),
              ),
              TypewriterAnimatedText(
                "Organization Management System for UTAG National.",
                speed: Duration(milliseconds: 60),
              ),
            ],
          ),

          SizedBox(width: defaultPadding / 2),
          FlutterCodedText(),
        ],
      ),
    );
  }
}

class FlutterCodedText extends StatelessWidget {
  const FlutterCodedText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "<",
        children: [
          TextSpan(
            text: "flutter",
            style: TextStyle(color: primaryColor),
          ),
          TextSpan(text: ">"),
        ],
      ),
    );
  }
}
