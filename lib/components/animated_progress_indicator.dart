import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';

class AnimatedCircularProgressIndicator extends StatelessWidget {
  const AnimatedCircularProgressIndicator({
    super.key,
    required this.percentage,
    required this.label,
    this.indicatorSize,
  });

  final double percentage;
  final String label;
  final double? indicatorSize;

  @override
  Widget build(BuildContext context) {
    final Widget progressRing = TweenAnimationBuilder(
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
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (indicatorSize == null)
          AspectRatio(aspectRatio: 1, child: progressRing)
        else
          Center(
            child: SizedBox.square(
              dimension: indicatorSize,
              child: progressRing,
            ),
          ),
        SizedBox(height: defaultPadding / 2),
        Text(
          label,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.white, fontSize: 12, height: 1.2),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(label, style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: defaultPadding / 2),
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
