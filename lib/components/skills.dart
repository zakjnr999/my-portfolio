import 'package:flutter/material.dart';
import 'package:my_portfolio/components/animated_progress_indicator.dart';
import 'package:my_portfolio/constants.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: darkColor),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            "Skills",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: AnimatedCircularProgressIndicator(
                label: "Flutter",
                percentage: 0.85,
              ),
            ),
            SizedBox(width: defaultPadding),
            Expanded(
              child: AnimatedCircularProgressIndicator(
                label: "Backend Dev",
                percentage: 0.55,
              ),
            ),
            SizedBox(width: defaultPadding),
            Expanded(
              child: AnimatedCircularProgressIndicator(
                label: "UI/UX Design",
                percentage: 0.70,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
