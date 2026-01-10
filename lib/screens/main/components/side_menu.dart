import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_portfolio/components/coding.dart';
import 'package:my_portfolio/components/knowledge.dart';
import 'package:my_portfolio/components/skills.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/gen/assets.gen.dart';
import 'package:my_portfolio/responsive.dart';
import 'package:my_portfolio/screens/main/components/area_info_text.dart';
import 'package:my_portfolio/screens/main/components/my_info.dart';
import 'package:url_launcher/url_launcher.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _buildMobileMenu(context),
      desktop: _buildDesktopMenu(context),
      tablet: _buildDesktopMenu(context),
    );
  }

  Widget _buildMobileMenu(BuildContext context) {
    return Drawer(
      backgroundColor: secondaryColor,
      child: Column(
        children: [
          MyInfo(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  AreaInfoText(title: "Residence", text: "Ghana"),
                  AreaInfoText(title: "City", text: "Accra"),
                  AreaInfoText(title: "Age", text: "22"),
                  Skills(),
                  SizedBox(height: defaultPadding),
                  Coding(),
                  Knowledge(),
                  Divider(color: darkColor),
                  SizedBox(height: defaultPadding / 2),
                  _buildDownloadButton(context),
                  SizedBox(height: defaultPadding),
                  _buildSocialLinks(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopMenu(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
        
      ),
      child: Column(
        children: [
          MyInfo(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  AreaInfoText(title: "Residence", text: "Ghana"),
                  AreaInfoText(title: "City", text: "Accra"),
                  AreaInfoText(title: "Age", text: "21"),
                  Skills(),
                  SizedBox(height: defaultPadding),
                  Coding(),
                  Knowledge(),
                  Divider(color: darkColor),
                  SizedBox(height: defaultPadding / 2),
                  _buildDownloadButton(context),
                  SizedBox(height: defaultPadding),
                  _buildSocialLinks(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadButton(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: primaryColor),
      ),
      child: TextButton(
        onPressed: () async {
          try {
            // For web, we'll use url_launcher to open the CV
            final cvUrl = Uri.parse('assets/doc/Muktar Zakari Junior CV.pdf');
            
            if (await canLaunchUrl(cvUrl)) {
              await launchUrl(cvUrl, mode: LaunchMode.externalApplication);
              
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Opening CV..."),
                    backgroundColor: primaryColor,
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            } else {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Could not open CV. Please contact me directly."),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            }
          } catch (e) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Error opening CV: ${e.toString()}"),
                  backgroundColor: Colors.red,
                ),
              );
            }
          }
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: defaultPadding / 2),
        ),
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "DOWNLOAD CV",
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: defaultPadding / 2),
              SvgPicture.asset(
                Assets.icons.download,
                colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLinks(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding / 2),
      decoration: BoxDecoration(
        color: darkColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildSocialIcon(
            context,
            Assets.icons.linkedin,
            "https://www.linkedin.com/in/muktar-zakari-junior-4130332b7/",
            "LinkedIn",
          ),
          _buildSocialIcon(
            context,
            Assets.icons.github,
            "https://github.com/zakjnr999",
            "GitHub",
          ),
          _buildSocialIcon(
            context,
            Assets.icons.twitter,
            "https://x.com/zakjnr12",
            "Twitter",
          ),
          _buildSocialIcon(
            context,
            Assets.icons.behance,
            "https://behance.net",
            "Behance",
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(
    BuildContext context,
    String iconPath,
    String url,
    String tooltip,
  ) {
    return Tooltip(
      message: tooltip,
      child: IconButton(
        onPressed: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          } else {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Could not launch $tooltip"),
                  backgroundColor: Colors.red,
                ),
              );
            }
          }
        },
        icon: SvgPicture.asset(
          iconPath,
          colorFilter: ColorFilter.mode(
            primaryColor.withValues(alpha: 0.8),
            BlendMode.srcIn,
          ),
        ),
        hoverColor: primaryColor.withValues(alpha: 0.1),
      ),
    );
  }
}
