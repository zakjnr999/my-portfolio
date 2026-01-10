import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/gen/assets.gen.dart';
import 'package:my_portfolio/responsive.dart';
import 'package:my_portfolio/screens/home/home_screen.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key, required this.onExplorePressed});

  final VoidCallback onExplorePressed;

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final double fontSize = Responsive.isMobile(context)
        ? 24
        : Responsive.isTablet(context)
            ? 32
            : 42;
    final double aspectRatio = Responsive.isMobile(context)
        ? 2.2
        : Responsive.isTablet(context)
            ? 2.8
            : 3;
    
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            Assets.images.bgImage.path,
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  darkColor.withValues(alpha: 0.8),
                  darkColor.withValues(alpha: 0.6),
                  darkColor.withValues(alpha: 0.8),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context)
                  ? defaultPadding / 2
                  : Responsive.isTablet(context)
                      ? defaultPadding
                      : defaultPadding * 1.5,
              vertical: Responsive.isMobile(context)
                  ? defaultPadding / 2
                  : defaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to My Digital \nArt Space!",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: fontSize,
                        height: 1.2,
                        shadows: [
                          Shadow(
                            color: primaryColor.withValues(alpha: 0.3),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                ),
                SizedBox(height: Responsive.isMobile(context) ? defaultPadding / 2 : defaultPadding),
                MyBuiltAnimatedText(),
                SizedBox(height: Responsive.isMobile(context) ? defaultPadding : defaultPadding * 1.5),
                MouseRegion(
                  onEnter: (_) => setState(() => _isHovered = true),
                  onExit: (_) => setState(() => _isHovered = false),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    child: ElevatedButton(
                      onPressed: widget.onExplorePressed,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: Responsive.isMobile(context)
                              ? defaultPadding * 1.5
                              : defaultPadding * 2,
                          vertical: Responsive.isMobile(context)
                              ? defaultPadding / 1.5
                              : defaultPadding,
                        ),
                        backgroundColor: _isHovered
                            ? primaryColor.withValues(alpha: 0.9)
                            : primaryColor,
                        foregroundColor: darkColor,
                        elevation: _isHovered ? 8 : 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        shadowColor: primaryColor.withValues(alpha: 0.5),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "EXPLORE NOW",
                            style: TextStyle(
                              color: darkColor,
                              fontWeight: FontWeight.bold,
                              fontSize: Responsive.isMobile(context) ? 14 : 16,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(width: defaultPadding / 2),
                          AnimatedRotation(
                            turns: _isHovered ? 0.25 : 0,
                            duration: const Duration(milliseconds: 300),
                            child: Icon(
                              Icons.arrow_forward,
                              color: darkColor,
                              size: Responsive.isMobile(context) ? 18 : 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
