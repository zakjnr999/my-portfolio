import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/gen/assets.gen.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              secondaryColor,
              secondaryColor.withValues(alpha: 0.8),
              secondaryColor,
            ],
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Spacer(flex: 2),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: primaryColor,
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withValues(alpha: 0.3),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(Assets.images.myProfile.path),
              ),
            ),
            Spacer(),
            Text(
              "Muktar Zakari Junior",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: defaultPadding / 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(
                "Flutter Full-Stack Developer",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  fontSize: 14,
                ),
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
