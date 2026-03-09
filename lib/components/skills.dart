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
        LayoutBuilder(
          builder: (context, constraints) {
            final int itemsPerRow = constraints.maxWidth < 210 ? 2 : 3;
            const double spacing = defaultPadding / 2;
            final double totalSpacing = spacing * (itemsPerRow - 1);
            final double itemWidth =
                (constraints.maxWidth - totalSpacing) / itemsPerRow;
            final double indicatorSize = (itemWidth - defaultPadding / 2).clamp(
              60.0,
              78.0,
            );

            return Wrap(
              alignment: WrapAlignment.center,
              spacing: spacing,
              runSpacing: defaultPadding,
              children: [
                SizedBox(
                  width: itemWidth,
                  child: AnimatedCircularProgressIndicator(
                    label: "Flutter",
                    percentage: 0.85,
                    indicatorSize: indicatorSize,
                  ),
                ),
                SizedBox(
                  width: itemWidth,
                  child: AnimatedCircularProgressIndicator(
                    label: "Backend Dev",
                    percentage: 0.55,
                    indicatorSize: indicatorSize,
                  ),
                ),
                SizedBox(
                  width: itemWidth,
                  child: AnimatedCircularProgressIndicator(
                    label: "UI/UX Design",
                    percentage: 0.70,
                    indicatorSize: indicatorSize,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
