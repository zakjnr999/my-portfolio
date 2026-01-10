import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';

class AnimatedCircularProgressIndicator extends StatelessWidget {
  const AnimatedCircularProgressIndicator({
    super.key,
    required this.percentage,
    required this.label,
  });

  final double percentage;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: percentage),
            duration: defaultDuration,
            builder: (context, double value, child) => Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: value,
                  color: primaryColor,
                  backgroundColor: darkColor,
                ),
                Center(
                  child: Text(
                    "${(value * 100).toInt()}%",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: defaultPadding / 2),
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

class AnimatedProgressLinearIndicator extends StatelessWidget {
  const AnimatedProgressLinearIndicator({
    super.key,
    required this.percentage,
    required this.label,
  });

  final double percentage;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: percentage),
        duration: defaultDuration,
        builder: (context, double value, child) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label, style: TextStyle(color: Colors.white)),
                Text("${(value * 100).toInt()}%"),
              ],
            ),
            SizedBox(height: defaultPadding / 2),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: LinearProgressIndicator(
                value: value,
                color: primaryColor,
                backgroundColor: darkColor,
                minHeight: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
