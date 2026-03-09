import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/models/Project.dart';
import 'package:my_portfolio/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailsScreen extends StatefulWidget {
  const ProjectDetailsScreen({super.key, required this.project});

  final Project project;

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [bgColor, darkColor.withValues(alpha: 0.5), bgColor],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: maxWidth),
                padding: EdgeInsets.all(
                  Responsive.isMobile(context)
                      ? defaultPadding
                      : defaultPadding * 2,
                ),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeader(context),
                        const SizedBox(height: defaultPadding * 2),
                        _buildImageGallery(context),
                        const SizedBox(height: defaultPadding * 2),
                        _buildOverview(context),
                        const SizedBox(height: defaultPadding * 2),
                        _buildTechnologies(context),
                        const SizedBox(height: defaultPadding * 2),
                        _buildFeatures(context),
                        const SizedBox(height: defaultPadding * 2),
                        _buildChallengeAndSolution(context),
                        if (widget.project.githubUrl != null ||
                            widget.project.liveUrl != null) ...[
                          const SizedBox(height: defaultPadding * 2),
                          _buildActions(context),
                        ],
                        const SizedBox(height: defaultPadding),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: primaryColor),
              onPressed: () => Navigator.pop(context),
              tooltip: "Back to Projects",
            ),
            const SizedBox(width: defaultPadding / 2),
            Expanded(
              child: Text(
                widget.project.title ?? "",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  fontSize: Responsive.isMobile(context) ? 24 : 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        if (widget.project.category != null || widget.project.images != null)
          const SizedBox(height: defaultPadding),
        Wrap(
          spacing: defaultPadding / 2,
          runSpacing: defaultPadding / 2,
          children: [
            if (widget.project.category != null)
              _HeaderChip(
                icon: Icons.apps_outlined,
                label: widget.project.category!,
              ),
            if (widget.project.images != null &&
                widget.project.images!.isNotEmpty)
              _HeaderChip(
                icon: Icons.photo_library_outlined,
                label: "${widget.project.images!.length} screens",
              ),
          ],
        ),
        if (widget.project.summary != null)
          const SizedBox(height: defaultPadding),
        if (widget.project.summary != null)
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Text(
              widget.project.summary!,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                height: 1.7,
                fontSize: Responsive.isMobile(context) ? 14 : 16,
              ),
            ),
          ),
        const SizedBox(height: defaultPadding),
        Container(
          height: 4,
          width: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [primaryColor, primaryColor.withValues(alpha: 0.3)],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  Widget _buildImageGallery(BuildContext context) {
    if (widget.project.images == null || widget.project.images!.isEmpty) {
      // Placeholder for projects without images
      return Container(
        height: Responsive.isMobile(context) ? 250 : 400,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.image,
                size: 80,
                color: primaryColor.withValues(alpha: 0.3),
              ),
              const SizedBox(height: defaultPadding),
              Text(
                "Project Screenshots",
                style: TextStyle(color: bodyTextColor, fontSize: 18),
              ),
              const SizedBox(height: defaultPadding / 2),
              Text(
                "Images coming soon",
                style: TextStyle(
                  color: bodyTextColor.withValues(alpha: 0.5),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.photo_library, color: primaryColor, size: 24),
            ),
            const SizedBox(width: defaultPadding),
            Text(
              "Screenshots",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        _ImageCarousel(images: widget.project.images!),
      ],
    );
  }

  Widget _buildOverview(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.description, color: primaryColor, size: 24),
              ),
              const SizedBox(width: defaultPadding),
              Text(
                "Project Overview",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          Text(
            widget.project.description ?? "",
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(height: 1.8, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildTechnologies(BuildContext context) {
    if (widget.project.technologies == null ||
        widget.project.technologies!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.code, color: primaryColor, size: 24),
            ),
            const SizedBox(width: defaultPadding),
            Text(
              "Technologies Used",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Wrap(
          spacing: defaultPadding / 2,
          runSpacing: defaultPadding / 2,
          children: widget.project.technologies!.map((tech) {
            return _TechChip(label: tech);
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildFeatures(BuildContext context) {
    if (widget.project.features == null || widget.project.features!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.star, color: primaryColor, size: 24),
              ),
              const SizedBox(width: defaultPadding),
              Text(
                "Key Features",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          ...widget.project.features!.asMap().entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.only(bottom: defaultPadding / 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: defaultPadding),
                  Expanded(
                    child: Text(
                      entry.value,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 15,
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildChallengeAndSolution(BuildContext context) {
    if (widget.project.challenge == null && widget.project.solution == null) {
      return const SizedBox.shrink();
    }

    return Responsive(
      mobile: Column(
        children: [
          if (widget.project.challenge != null) _buildChallengeCard(context),
          if (widget.project.challenge != null &&
              widget.project.solution != null)
            const SizedBox(height: defaultPadding),
          if (widget.project.solution != null) _buildSolutionCard(context),
        ],
      ),
      tablet: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.project.challenge != null)
            Expanded(child: _buildChallengeCard(context)),
          if (widget.project.challenge != null &&
              widget.project.solution != null)
            const SizedBox(width: defaultPadding),
          if (widget.project.solution != null)
            Expanded(child: _buildSolutionCard(context)),
        ],
      ),
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.project.challenge != null)
            Expanded(child: _buildChallengeCard(context)),
          if (widget.project.challenge != null &&
              widget.project.solution != null)
            const SizedBox(width: defaultPadding * 1.5),
          if (widget.project.solution != null)
            Expanded(child: _buildSolutionCard(context)),
        ],
      ),
    );
  }

  Widget _buildChallengeCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.warning_amber,
                  color: Colors.orange,
                  size: 24,
                ),
              ),
              const SizedBox(width: defaultPadding),
              Text(
                "Challenge",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          Text(
            widget.project.challenge ?? "",
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(height: 1.8, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _buildSolutionCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.check_circle, color: Colors.green, size: 24),
              ),
              const SizedBox(width: defaultPadding),
              Text(
                "Solution",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          Text(
            widget.project.solution ?? "",
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(height: 1.8, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    if (widget.project.githubUrl == null && widget.project.liveUrl == null) {
      return const SizedBox.shrink();
    }

    return Responsive(
      mobile: Column(
        children: [
          if (widget.project.githubUrl != null)
            _buildActionButton(
              context,
              "View on GitHub",
              Icons.code,
              widget.project.githubUrl!,
              isPrimary: true,
            ),
          if (widget.project.githubUrl != null &&
              widget.project.liveUrl != null)
            const SizedBox(height: defaultPadding / 2),
          if (widget.project.liveUrl != null)
            _buildActionButton(
              context,
              "Live Demo",
              Icons.launch,
              widget.project.liveUrl!,
              isPrimary: false,
            ),
        ],
      ),
      tablet: Row(
        children: [
          if (widget.project.githubUrl != null)
            Expanded(
              child: _buildActionButton(
                context,
                "View on GitHub",
                Icons.code,
                widget.project.githubUrl!,
                isPrimary: true,
              ),
            ),
          if (widget.project.githubUrl != null &&
              widget.project.liveUrl != null)
            const SizedBox(width: defaultPadding),
          if (widget.project.liveUrl != null)
            Expanded(
              child: _buildActionButton(
                context,
                "Live Demo",
                Icons.launch,
                widget.project.liveUrl!,
                isPrimary: false,
              ),
            ),
        ],
      ),
      desktop: Row(
        children: [
          if (widget.project.githubUrl != null)
            Expanded(
              child: _buildActionButton(
                context,
                "View on GitHub",
                Icons.code,
                widget.project.githubUrl!,
                isPrimary: true,
              ),
            ),
          if (widget.project.githubUrl != null &&
              widget.project.liveUrl != null)
            const SizedBox(width: defaultPadding),
          if (widget.project.liveUrl != null)
            Expanded(
              child: _buildActionButton(
                context,
                "Live Demo",
                Icons.launch,
                widget.project.liveUrl!,
                isPrimary: false,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String label,
    IconData icon,
    String url, {
    required bool isPrimary,
  }) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          } else {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Could not open $label"),
                  backgroundColor: Colors.red,
                ),
              );
            }
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? primaryColor : secondaryColor,
          foregroundColor: isPrimary ? darkColor : primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: isPrimary ? BorderSide.none : BorderSide(color: primaryColor),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: defaultPadding / 2),
            Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderChip extends StatelessWidget {
  const _HeaderChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding / 1.5,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: primaryColor.withValues(alpha: 0.15)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: primaryColor),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _TechChip extends StatelessWidget {
  const _TechChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }
}

class _ImageCarousel extends StatefulWidget {
  const _ImageCarousel({required this.images});

  final List<String> images;

  @override
  State<_ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<_ImageCarousel> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Responsive.isMobile(context) ? 380 : 520,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _showFullscreenImage(context, index);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(defaultPadding),
                    decoration: BoxDecoration(
                      color: darkColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      widget.images[index],
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: defaultPadding),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios, color: primaryColor, size: 20),
              onPressed: _currentPage > 0
                  ? () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  : null,
            ),
            Expanded(
              child: Text(
                "Screen ${_currentPage + 1} of ${widget.images.length}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                color: primaryColor,
                size: 20,
              ),
              onPressed: _currentPage < widget.images.length - 1
                  ? () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  : null,
            ),
          ],
        ),
        const SizedBox(height: defaultPadding / 2),
        Text(
          "Tap any screenshot to open it full screen",
          style: TextStyle(color: bodyTextColor, fontSize: 14),
        ),
        if (widget.images.length > 1) ...[
          const SizedBox(height: defaultPadding),
          SizedBox(
            height: 88,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: widget.images.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(width: defaultPadding / 2),
              itemBuilder: (context, index) {
                final bool isSelected = _currentPage == index;

                return GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 68,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? primaryColor
                            : primaryColor.withValues(alpha: 0.12),
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        widget.images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }

  void _showFullscreenImage(BuildContext context, int initialIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _FullscreenImageGallery(
          images: widget.images,
          initialIndex: initialIndex,
        ),
      ),
    );
  }
}

class _FullscreenImageGallery extends StatefulWidget {
  const _FullscreenImageGallery({
    required this.images,
    required this.initialIndex,
  });

  final List<String> images;
  final int initialIndex;

  @override
  State<_FullscreenImageGallery> createState() =>
      _FullscreenImageGalleryState();
}

class _FullscreenImageGalleryState extends State<_FullscreenImageGallery> {
  late PageController _pageController;
  late int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return InteractiveViewer(
                child: Center(
                  child: Image.asset(widget.images[index], fit: BoxFit.contain),
                ),
              );
            },
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.white, size: 30),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding,
                      vertical: defaultPadding / 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "${_currentPage + 1} / ${widget.images.length}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
