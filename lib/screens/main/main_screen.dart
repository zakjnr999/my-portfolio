import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
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
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final bool useCompactLayout = screenWidth < 1100;
    final double horizontalPadding = useCompactLayout
        ? defaultPadding / 2
        : screenWidth < 1350
        ? defaultPadding
        : defaultPadding * 1.5;
    final double verticalPadding = useCompactLayout
        ? defaultPadding / 2
        : defaultPadding;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: bgColor,
      drawer: useCompactLayout ? const SideMenu() : null,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [bgColor, darkColor.withValues(alpha: 0.5), bgColor],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final double contentWidth = constraints.maxWidth > maxWidth
                    ? maxWidth
                    : constraints.maxWidth;
                final double sideMenuWidth = contentWidth < 1350 ? 320 : 285;
                final double contentSpacing = contentWidth < 1350
                    ? defaultPadding * 1.5
                    : defaultPadding * 2;

                return Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: contentWidth,
                    height: constraints.maxHeight,
                    child: useCompactLayout
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              _buildMobileAppBar(context),
                              Expanded(
                                child: _buildContentScrollView(
                                  topSpacing: defaultPadding / 2,
                                  itemSpacing: defaultPadding,
                                ),
                              ),
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                width: sideMenuWidth,
                                child: const SideMenu(),
                              ),
                              SizedBox(
                                width: contentWidth < 1350
                                    ? defaultPadding
                                    : defaultPadding * 1.5,
                              ),
                              Expanded(
                                child: _buildContentScrollView(
                                  topSpacing: defaultPadding,
                                  itemSpacing: contentSpacing,
                                ),
                              ),
                            ],
                          ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContentScrollView({
    required double topSpacing,
    required double itemSpacing,
  }) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: topSpacing),
          ...widget.children.map(
            (child) => Padding(
              padding: EdgeInsets.only(bottom: itemSpacing),
              child: child,
            ),
          ),
        ],
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
