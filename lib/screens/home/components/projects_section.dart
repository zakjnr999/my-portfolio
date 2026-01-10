import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/models/Project.dart';
import 'package:my_portfolio/responsive.dart';
import 'package:my_portfolio/screens/home/components/project_details_screen.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double fontSize = Responsive.isMobile(context) ? 24 : Responsive.isTablet(context) ? 28 : 32;
    
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Responsive.isMobile(context) ? defaultPadding / 2 : defaultPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Projects",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: Responsive.isMobile(context) ? defaultPadding / 2 : defaultPadding),
          Responsive(
            mobile: ProjectsGridView(
              crossAxisCount: 1,
              childAspectRatio: Responsive.isMobile(context) ? 1.4 : 1.5,
            ),
            mobileLarge: ProjectsGridView(
              crossAxisCount: 2,
              childAspectRatio: 1.3,
            ),
            tablet: ProjectsGridView(
              crossAxisCount: 2,
              childAspectRatio: 1.2,
            ),
            desktop: ProjectsGridView(
              crossAxisCount: 3,
              childAspectRatio: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectsGridView extends StatelessWidget {
  const ProjectsGridView({
    super.key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1.3,
  });

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: demo_projects.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: Responsive.isMobile(context) ? defaultPadding / 2 : defaultPadding,
        mainAxisSpacing: Responsive.isMobile(context) ? defaultPadding / 2 : defaultPadding,
      ),
      itemBuilder: (context, index) => ProjectCard(
        project: demo_projects[index],
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  const ProjectCard({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProjectDetailsScreen(project: widget.project),
          ),
        );
      },
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.all(Responsive.isMobile(context) ? defaultPadding / 1.5 : defaultPadding),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isHover ? primaryColor : Colors.transparent,
            width: 2,
          ),
          boxShadow: isHover
              ? [
                  BoxShadow(
                    color: primaryColor.withValues(alpha: 0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(defaultPadding / 2),
                    decoration: BoxDecoration(
                      color: primaryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: primaryColor.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Icon(
                      Icons.code,
                      color: primaryColor,
                      size: 30,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    widget.project.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Expanded(
                    child: Text(
                      widget.project.description ?? "",
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            height: 1.5,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: defaultPadding),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProjectDetailsScreen(project: widget.project),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isHover ? primaryColor : secondaryColor,
                  foregroundColor: isHover ? darkColor : primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: primaryColor),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "View Project",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: defaultPadding / 2),
                    Icon(
                      Icons.arrow_forward,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

