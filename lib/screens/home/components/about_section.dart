import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/responsive.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Responsive.isMobile(context)
            ? defaultPadding / 2
            : defaultPadding,
      ),
      child: Responsive(
        mobile: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAboutContent(context),
            SizedBox(
              height: Responsive.isMobile(context)
                  ? defaultPadding / 2
                  : defaultPadding,
            ),
            _buildPersonalInfo(context),
          ],
        ),
        tablet: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAboutContent(context),
            const SizedBox(height: defaultPadding),
            _buildPersonalInfo(context),
          ],
        ),
        desktop: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: _buildAboutContent(context)),
            const SizedBox(width: defaultPadding * 2),
            Expanded(child: _buildPersonalInfo(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutContent(BuildContext context) {
    final double fontSize = Responsive.isMobile(context)
        ? 24
        : Responsive.isTablet(context)
        ? 28
        : 32;
    final double textSize = Responsive.isMobile(context) ? 14 : 16;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About Me",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: Responsive.isMobile(context)
              ? defaultPadding / 2
              : defaultPadding,
        ),
        Container(
          padding: EdgeInsets.all(
            Responsive.isMobile(context)
                ? defaultPadding / 1.5
                : defaultPadding,
          ),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "I am a Flutter full-stack developer focused on building mobile apps that solve practical operational and community problems. Across products like GrabGO, CITSA, and UTAG, I work on interface implementation, feature architecture, and backend-aware product delivery.",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  height: 1.8,
                  fontSize: textSize,
                ),
              ),
              SizedBox(
                height: Responsive.isMobile(context)
                    ? defaultPadding / 1.5
                    : defaultPadding,
              ),
              Text(
                "My strength is turning product requirements into clear mobile flows such as onboarding, dashboards, status tracking, and role-based interfaces. I am comfortable building with Flutter and Dart on the client side and integrating with services built on Node.js, Express, Firebase, and real-time backend infrastructure.",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  height: 1.8,
                  fontSize: textSize,
                ),
              ),
              SizedBox(
                height: Responsive.isMobile(context)
                    ? defaultPadding / 1.5
                    : defaultPadding,
              ),
              Text(
                "I am currently seeking a National Service opportunity where I can contribute to a strong engineering team, keep improving as a developer, and bring discipline, ownership, and fast learning to real product work from day one.",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  height: 1.8,
                  fontSize: textSize,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPersonalInfo(BuildContext context) {
    final double fontSize = Responsive.isMobile(context) ? 20 : 24;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Profile",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: Responsive.isMobile(context)
              ? defaultPadding / 2
              : defaultPadding,
        ),
        Container(
          padding: EdgeInsets.all(
            Responsive.isMobile(context)
                ? defaultPadding / 1.5
                : defaultPadding,
          ),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              _buildInfoRow(context, "Full Name", "Muktar Zakari Junior"),
              const Divider(color: darkColor),
              _buildInfoRow(context, "Location", "Accra, Ghana"),
              const Divider(color: darkColor),
              _buildInfoRow(context, "Email", "zakjnr165@gmail.com"),
              const Divider(color: darkColor),
              _buildInfoRow(context, "Phone", "+233 53 599 7662"),
              const Divider(color: darkColor),
              _buildInfoRow(
                context,
                "Availability",
                "Open to National Service",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool shouldStack = constraints.maxWidth < 320;

          if (shouldStack) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: bodyTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    value,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          }

          return Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    color: bodyTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: defaultPadding),
              Expanded(
                flex: 2,
                child: Text(
                  value,
                  textAlign: TextAlign.end,
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
