import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/models/Project.dart';
import 'package:my_portfolio/responsive.dart';
import 'package:my_portfolio/screens/home/components/project_details_screen.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double fontSize = Responsive.isMobile(context)
        ? 24
        : Responsive.isTablet(context)
        ? 28
        : 32;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Responsive.isMobile(context)
            ? defaultPadding / 2
            : defaultPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Selected Projects",
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
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: Text(
              "A focused portfolio of delivery, student community, and association apps. Open any case study to review the screenshots, stack, and implementation decisions behind the product.",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: Responsive.isMobile(context) ? 13 : 14,
                height: 1.7,
              ),
            ),
          ),
          SizedBox(
            height: Responsive.isMobile(context)
                ? defaultPadding
                : defaultPadding * 1.2,
          ),
          Responsive(
            mobile: const ProjectsGridView(
              crossAxisCount: 1,
              mainAxisExtent: 360,
            ),
            mobileLarge: const ProjectsGridView(
              crossAxisCount: 2,
              mainAxisExtent: 390,
            ),
            tablet: const ProjectsGridView(
              crossAxisCount: 2,
              mainAxisExtent: 400,
            ),
            desktop: const ProjectsGridView(
              crossAxisCount: 3,
              mainAxisExtent: 410,
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
    this.mainAxisExtent = 380,
  });

  final int crossAxisCount;
  final double mainAxisExtent;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: demo_projects.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisExtent: mainAxisExtent,
        crossAxisSpacing: Responsive.isMobile(context)
            ? defaultPadding / 2
            : defaultPadding,
        mainAxisSpacing: Responsive.isMobile(context)
            ? defaultPadding / 2
            : defaultPadding,
      ),
      itemBuilder: (context, index) =>
          ProjectCard(project: demo_projects[index]),
    );
  }
}

class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key, required this.project});

  final Project project;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHover = false;

  void _openProject() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProjectDetailsScreen(project: widget.project),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: _openProject,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.all(
          Responsive.isMobile(context) ? defaultPadding / 1.5 : defaultPadding,
        ),
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
          children: [
            _ProjectPreview(imagePath: widget.project.images?.first),
            const SizedBox(height: defaultPadding * 0.75),
            if (widget.project.category != null)
              _ProjectCategoryChip(label: widget.project.category!),
            if (widget.project.category != null)
              const SizedBox(height: defaultPadding / 2),
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
                widget.project.summary ?? widget.project.description ?? "",
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(height: 1.6, fontSize: 13),
              ),
            ),
            const SizedBox(height: defaultPadding),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                onPressed: _openProject,
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
                      "View Case Study",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: defaultPadding / 2),
                    Icon(Icons.arrow_forward, size: 18),
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

class _ProjectPreview extends StatelessWidget {
  const _ProjectPreview({this.imagePath});

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        color: darkColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: primaryColor.withValues(alpha: 0.15)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: imagePath == null
            ? Center(
                child: Icon(
                  Icons.image_outlined,
                  color: primaryColor.withValues(alpha: 0.5),
                  size: 40,
                ),
              )
            : Stack(
                fit: StackFit.expand,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          primaryColor.withValues(alpha: 0.08),
                          darkColor,
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(defaultPadding / 2),
                    child: Image.asset(
                      imagePath!,
                      fit: BoxFit.contain,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _ProjectCategoryChip extends StatelessWidget {
  const _ProjectCategoryChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding / 1.5,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: primaryColor.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: primaryColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
