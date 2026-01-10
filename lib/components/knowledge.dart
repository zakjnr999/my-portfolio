import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/gen/assets.gen.dart';

class Knowledge extends StatelessWidget {
  const Knowledge({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: darkColor),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            "Knowledge",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        KnowledgeText(text: "Flutter & Dart Development"),
        KnowledgeText(text: "Node.js & Express.js"),
        KnowledgeText(text: "RESTful API Design"),
        KnowledgeText(text: "Database Management (SQL & NoSQL)"),
        KnowledgeText(text: "UI/UX Design Principles"),
        KnowledgeText(text: "Responsive & Adaptive Design"),
        KnowledgeText(text: "State Management (Provider, Bloc)"),
        KnowledgeText(text: "Version Control (Git & GitHub)"),
        KnowledgeText(text: "Firebase & Supabase"),
        KnowledgeText(text: "Agile Development Methodology"),
      ],
    );
  }
}

class KnowledgeText extends StatelessWidget {
  const KnowledgeText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: SvgPicture.asset(
              Assets.icons.check,
              colorFilter: ColorFilter.mode(
                primaryColor,
                BlendMode.srcIn,
              ),
              width: 16,
              height: 16,
            ),
          ),
          SizedBox(width: defaultPadding / 2),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
