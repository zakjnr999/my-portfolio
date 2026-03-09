import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';

class AreaInfoText extends StatelessWidget {
  const AreaInfoText({super.key, required this.text, required this.title});

  final String? title, text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title!,
              style: TextStyle(
                color: bodyTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: defaultPadding / 2),
          Flexible(
            child: Text(
              text!,
              textAlign: TextAlign.end,
              softWrap: true,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
