import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_application_1/app/data/models/project.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProjectsSection extends GetView<HomeController> {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: ScreenTypeLayout.builder(
        mobile: (BuildContext context) =>
            const _ProjectsContent(isMobile: true),
        desktop: (BuildContext context) =>
            const _ProjectsContent(isMobile: false),
      ),
    );
  }
}

class _ProjectsContent extends GetView<HomeController> {
  final bool isMobile;
  const _ProjectsContent({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    double padding = isMobile ? 0 : 80;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Projects Showcase",
            style: AppTextStyles.header.copyWith(
              fontSize: 40,
              color: Colors.white,
            ),
          ).animate().fadeIn().moveX(begin: -20, end: 0),

          const SizedBox(height: 10),

          SizedBox(
            width: 600,
            child: Text(
              "Exploring the intersection of performance and aesthetics. A collection of high-quality mobile experiences built with Flutter and modern cloud architectures.",
              style: AppTextStyles.body.copyWith(
                fontSize: 16,
                color: AppColors.textGrey,
              ),
            ),
          ).animate().fadeIn(delay: 200.ms),

          const SizedBox(height: 40),
          // Tabs
          Row(
            children: [
              _ProjectTab(label: "Mobile Games", isSelected: true),
              const SizedBox(width: 30),
              _ProjectTab(label: "Mobile Applications", isSelected: false),
            ],
          ).animate().fadeIn(delay: 300.ms),

          const SizedBox(height: 10),
          Container(height: 1, color: Colors.white10),
          const SizedBox(height: 40),

          // Header Row for Grid
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Featured Games",
                style: AppTextStyles.title.copyWith(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward,
                  color: AppColors.primary,
                  size: 16,
                ),
                label: const Text(
                  "View All",
                  style: TextStyle(color: AppColors.primary),
                ),
                iconAlignment: IconAlignment.end,
              ),
            ],
          ).animate().fadeIn(delay: 400.ms),

          const SizedBox(height: 30),

          // Projects Grid
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 1;
              if (constraints.maxWidth > 1100) {
                crossAxisCount = 3;
              } else if (constraints.maxWidth > 700) {
                crossAxisCount = 2;
              }
              double gap = 30;
              double totalGap = gap * (crossAxisCount - 1);
              double itemWidth =
                  (constraints.maxWidth - totalGap) / crossAxisCount;

              return Wrap(
                spacing: gap,
                runSpacing: gap,
                children: controller.projects.asMap().entries.map((entry) {
                  return _ProjectCard(
                    project: entry.value,
                    width: itemWidth,
                    delay: entry.key * 100,
                  );
                }).toList(),
              );
            },
          ),

          const SizedBox(height: 80),
          // Call to Action Card
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white10),
            ),
            child: Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Have a project in mind?",
                      style: AppTextStyles.title.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "I'm available for freelance work and full-time opportunities.",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                if (isMobile) const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Let's Talk",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 15),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        side: BorderSide(color: Colors.grey[700]!),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Get Resume",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ).animate().fadeIn(delay: 800.ms).moveY(begin: 30, end: 0),
        ],
      ),
    );
  }
}

class _ProjectTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  const _ProjectTab({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: isSelected ? AppColors.primary : Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: isSelected ? 50 : 0,
          height: 2,
          color: AppColors.primary,
        ),
      ],
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Project project;
  final double width;
  final int delay;
  const _ProjectCard({
    required this.project,
    required this.width,
    required this.delay,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: widget.width,
        transform: Matrix4.translationValues(0, isHovered ? -10 : 0, 0),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isHovered
                ? AppColors.primary.withOpacity(0.5)
                : Colors.transparent,
          ),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.1),
                    blurRadius: 20,
                    spreadRadius: 0,
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image / Preview
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                image: DecorationImage(
                  image: NetworkImage(widget.project.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
              child: isHovered
                  ? Container(
                      color: Colors.black45,
                      child: const Center(
                        child: Icon(
                          Icons.touch_app,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ).animate().fadeIn()
                  : null,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tags
                  Row(
                    children: widget.project.techStack
                        .take(2)
                        .map(
                          (tag) => Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              tag.toUpperCase(),
                              style: const TextStyle(
                                color: AppColors.primary,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    widget.project.title,
                    style: AppTextStyles.title.copyWith(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.project.description,
                    style: AppTextStyles.body.copyWith(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Expanded(
                        child: _StoreButton(
                          text: "Play Store",
                          icon: Icons.play_arrow,
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _StoreButton(
                          text: "App Store",
                          icon: FontAwesomeIcons.apple,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: widget.delay.ms).moveY(begin: 30, end: 0);
  }
}

class _StoreButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  const _StoreButton({
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12),
        side: BorderSide(color: Colors.grey[700]!),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      icon: FaIcon(icon, size: 14),
      label: Text(
        text,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}
