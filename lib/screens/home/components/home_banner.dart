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
        ? 28
        : Responsive.isTablet(context)
        ? 38
        : 48;

    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final double bannerHeight = width < 600
            ? 420
            : width < 900
            ? 450
            : width < 1100
            ? 500
            : width < 1300
            ? 470
            : 430;
        final double horizontalPadding = Responsive.isMobile(context)
            ? defaultPadding / 1.2
            : width < 1300
            ? defaultPadding
            : defaultPadding * 1.5;
        final double verticalPadding = Responsive.isMobile(context)
            ? defaultPadding
            : width < 1300
            ? defaultPadding * 1.2
            : defaultPadding * 1.5;
        final double maxCopyWidth = width < 900 ? width : width * 0.72;

        return ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: SizedBox(
            height: bannerHeight,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(Assets.images.bgImage.path, fit: BoxFit.cover),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        darkColor.withValues(alpha: 0.84),
                        darkColor.withValues(alpha: 0.62),
                        darkColor.withValues(alpha: 0.84),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: verticalPadding,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: maxCopyWidth),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Flutter Apps Built for\nReal-World Workflows.",
                            style: Theme.of(context).textTheme.bodyLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: fontSize,
                                  height: 1.15,
                                  shadows: [
                                    Shadow(
                                      color: primaryColor.withValues(
                                        alpha: 0.3,
                                      ),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                          ),
                          SizedBox(
                            height: Responsive.isMobile(context)
                                ? defaultPadding / 2
                                : defaultPadding * 0.75,
                          ),
                          const MyBuiltAnimatedText(),
                          const SizedBox(height: defaultPadding * 0.75),
                          Text(
                            "I build mobile products with strong UI execution, practical backend integration, and clean user flows. I am currently looking for a National Service role where I can contribute immediately as a software developer.",
                            style: Theme.of(context).textTheme.bodySmall!
                                .copyWith(
                                  color: Colors.white.withValues(alpha: 0.9),
                                  fontSize: Responsive.isMobile(context)
                                      ? 13
                                      : 15,
                                  height: 1.7,
                                ),
                          ),
                          SizedBox(
                            height: Responsive.isMobile(context)
                                ? defaultPadding
                                : defaultPadding * 1.2,
                          ),
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
                                  shadowColor: primaryColor.withValues(
                                    alpha: 0.5,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "VIEW PROJECTS",
                                      style: TextStyle(
                                        color: darkColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Responsive.isMobile(context)
                                            ? 14
                                            : 16,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    const SizedBox(width: defaultPadding / 2),
                                    AnimatedRotation(
                                      turns: _isHovered ? 0.25 : 0,
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: darkColor,
                                        size: Responsive.isMobile(context)
                                            ? 18
                                            : 24,
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
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
