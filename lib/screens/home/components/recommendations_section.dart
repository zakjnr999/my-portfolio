import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/models/Recommendation.dart';
import 'package:my_portfolio/responsive.dart';

class RecommendationsSection extends StatelessWidget {
  const RecommendationsSection({super.key});

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
            "Recommendations",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: Responsive.isMobile(context) ? defaultPadding / 2 : defaultPadding),
          Responsive(
            mobile: RecommendationsListView(),
            mobileLarge: RecommendationsListView(),
            tablet: RecommendationsGridView(crossAxisCount: 2),
            desktop: RecommendationsGridView(crossAxisCount: 2),
          ),
        ],
      ),
    );
  }
}

class RecommendationsListView extends StatelessWidget {
  const RecommendationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Responsive.isMobile(context) ? 250 : 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
        itemCount: demo_recommendations.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(
            right: defaultPadding,
            left: index == 0 ? 0 : 0,
          ),
          child: SizedBox(
            width: Responsive.isMobile(context)
                ? MediaQuery.of(context).size.width * 0.85
                : MediaQuery.of(context).size.width * 0.8,
            child: RecommendationCard(
              recommendation: demo_recommendations[index],
            ),
          ),
        ),
      ),
    );
  }
}

class RecommendationsGridView extends StatelessWidget {
  const RecommendationsGridView({
    super.key,
    this.crossAxisCount = 2,
  });

  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: demo_recommendations.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 1.5,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
      ),
      itemBuilder: (context, index) => RecommendationCard(
        recommendation: demo_recommendations[index],
      ),
    );
  }
}

class RecommendationCard extends StatefulWidget {
  const RecommendationCard({
    super.key,
    required this.recommendation,
  });

  final Recommendation recommendation;

  @override
  State<RecommendationCard> createState() => _RecommendationCardState();
}

class _RecommendationCardState extends State<RecommendationCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(defaultPadding),
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
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor.withValues(alpha: 0.2),
                    border: Border.all(color: primaryColor, width: 2),
                  ),
                  child: Icon(
                    Icons.person,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(width: defaultPadding),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.recommendation.name ?? "",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        widget.recommendation.source ?? "",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: primaryColor,
                            ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.format_quote,
                  color: primaryColor.withValues(alpha: 0.3),
                  size: 40,
                ),
              ],
            ),
            const SizedBox(height: defaultPadding),
            Expanded(
              child: Text(
                widget.recommendation.text ?? "",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      height: 1.8,
                      fontStyle: FontStyle.italic,
                    ),
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

