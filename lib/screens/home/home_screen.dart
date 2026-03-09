import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/responsive.dart';
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
    final double animatedHeight = Responsive.isMobile(context) ? 70 : 56;

    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
        color: Colors.white,
        fontSize: Responsive.isMobile(context) ? 14 : 16,
        height: 1.6,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FlutterCodedText(),
          const SizedBox(height: defaultPadding / 3),
          SizedBox(
            height: animatedHeight,
            child: AnimatedTextKit(
              repeatForever: true,
              pause: const Duration(milliseconds: 1200),
              displayFullTextOnTap: true,
              animatedTexts: [
                TypewriterAnimatedText(
                  "GrabGO customer, rider, and vendor experiences.",
                  speed: const Duration(milliseconds: 50),
                ),
                TypewriterAnimatedText(
                  "Student community workflows for CITSA UCC.",
                  speed: const Duration(milliseconds: 50),
                ),
                TypewriterAnimatedText(
                  "Welfare and communication tools for UTAG National.",
                  speed: const Duration(milliseconds: 50),
                ),
              ],
            ),
          ),
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
