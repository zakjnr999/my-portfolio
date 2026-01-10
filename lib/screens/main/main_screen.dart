import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/responsive.dart';
import 'package:my_portfolio/screens/main/components/side_menu.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.children});

  final List<Widget> children;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: bgColor,
      drawer: Responsive.isMobile(context) ? SideMenu() : null,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              bgColor,
              darkColor.withValues(alpha: 0.5),
              bgColor,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
              child: Container(
              constraints: BoxConstraints(maxWidth: maxWidth),
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.isMobile(context)
                    ? defaultPadding / 2
                    : Responsive.isTablet(context)
                        ? defaultPadding
                        : defaultPadding * 1.5,
                vertical: Responsive.isMobile(context) ? defaultPadding / 2 : defaultPadding,
              ),
              child: Responsive(
                mobile: Column(
                  children: [
                    _buildMobileAppBar(context),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: defaultPadding / 2),
                            ...widget.children.map((child) => Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: defaultPadding),
                                  child: child,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                tablet: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: SideMenu()),
                    SizedBox(width: defaultPadding),
                    Expanded(
                      flex: 7,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: defaultPadding),
                            ...widget.children.map((child) => Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: defaultPadding * 1.5),
                                  child: child,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                desktop: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: SideMenu()),
                    SizedBox(width: defaultPadding * 1.5),
                    Expanded(
                      flex: 7,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: defaultPadding),
                            ...widget.children.map((child) => Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: defaultPadding * 2),
                                  child: child,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.menu, color: primaryColor),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
          const SizedBox(width: defaultPadding / 2),
          Text(
            "Muktar Zakari",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
