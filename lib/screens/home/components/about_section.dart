import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/responsive.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Responsive.isMobile(context) ? defaultPadding / 2 : defaultPadding,
      ),
      child: Responsive(
        mobile: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAboutContent(context),
            SizedBox(height: Responsive.isMobile(context) ? defaultPadding / 2 : defaultPadding),
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
    final double fontSize = Responsive.isMobile(context) ? 24 : Responsive.isTablet(context) ? 28 : 32;
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
        SizedBox(height: Responsive.isMobile(context) ? defaultPadding / 2 : defaultPadding),
        Container(
          padding: EdgeInsets.all(Responsive.isMobile(context) ? defaultPadding / 1.5 : defaultPadding),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(10),
           
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "I'm a passionate Flutter Full-Stack Developer with 5 years of experience in mobile and web development. I specialize in creating beautiful, responsive, and performant applications using Flutter and Dart, with strong backend expertise in Node.js and Express.",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      height: 1.8,
                      fontSize: textSize,
                    ),
              ),
              SizedBox(height: Responsive.isMobile(context) ? defaultPadding / 1.5 : defaultPadding),
              Text(
                "My journey in software development started with a curiosity about how applications work, and it has evolved into a career focused on building user-centric, full-stack solutions. From crafting intuitive mobile interfaces to architecting robust backend systems, I love turning complex problems into simple, elegant, and scalable applications.",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      height: 1.8,
                      fontSize: textSize,
                    ),
              ),
              SizedBox(height: Responsive.isMobile(context) ? defaultPadding / 1.5 : defaultPadding),
              Text(
                "When I'm not coding, you can find me exploring new technologies, contributing to open-source projects, or sharing knowledge with the developer community. I'm always excited to take on new challenges and collaborate on innovative projects.",
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
          "Personal Information",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(height: Responsive.isMobile(context) ? defaultPadding / 2 : defaultPadding),
        Container(
          padding: EdgeInsets.all(Responsive.isMobile(context) ? defaultPadding / 1.5 : defaultPadding),
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
              _buildInfoRow(context, "Freelance", "Available"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: bodyTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

