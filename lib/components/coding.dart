import 'package:flutter/material.dart';
import 'package:my_portfolio/components/animated_progress_indicator.dart';
import 'package:my_portfolio/constants.dart';

class Coding extends StatelessWidget {
  const Coding({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: darkColor),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            "Coding",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        AnimatedProgressLinearIndicator(label: "Dart", percentage: 0.85),
        AnimatedProgressLinearIndicator(label: "JavaScript", percentage: 0.75),
        AnimatedProgressLinearIndicator(label: "Node.js", percentage: 0.70),
        AnimatedProgressLinearIndicator(label: "Python", percentage: 0.65),
        AnimatedProgressLinearIndicator(label: "HTML/CSS", percentage: 0.80),
        AnimatedProgressLinearIndicator(label: "SQL", percentage: 0.70),
      ],
    );
  }
}