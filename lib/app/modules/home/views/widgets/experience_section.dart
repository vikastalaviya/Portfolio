import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_application_1/app/data/models/experience.dart';

class ExperienceSection extends GetView<HomeController> {
  const ExperienceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const MobileExperience(),
      desktop: (BuildContext context) => const DesktopExperience(),
    );
  }
}

class DesktopExperience extends GetView<HomeController> {
  const DesktopExperience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 60),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                "Work",
                style: AppTextStyles.header.copyWith(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "Experience",
                style: AppTextStyles.header.copyWith(
                  fontSize: 40,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ).animate().fadeIn().moveY(begin: 20, end: 0),
          const SizedBox(height: 10),
          Text(
            "My evolution as a developer and the milestones I've achieved.",
            style: AppTextStyles.body.copyWith(
              fontSize: 18,
              color: Colors.grey,
            ),
          ).animate().fadeIn(delay: 200.ms),

          const SizedBox(height: 60),
          // Timeline layout simulation
          Stack(
            children: [
              // Vertical Line
              Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(width: 2, color: Colors.white10),
                  )
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .scaleY(begin: 0, alignment: Alignment.topCenter),

              // Content List
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  children: controller.experiences.asMap().entries.map((entry) {
                    return _ExperienceCard(
                      experience: entry.value,
                      delay: entry.key * 300,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MobileExperience extends GetView<HomeController> {
  const MobileExperience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        children: [
          Text(
            "Work Experience",
            textAlign: TextAlign.center,
            style: AppTextStyles.header.copyWith(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "My evolution as a developer and the milestones I've achieved.",
            textAlign: TextAlign.center,
            style: AppTextStyles.body.copyWith(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 40),
          Column(
            children: controller.experiences.asMap().entries.map((entry) {
              return _ExperienceCard(
                experience: entry.value,
                delay: entry.key * 200,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _ExperienceCard extends StatefulWidget {
  final Experience experience;
  final int delay;
  const _ExperienceCard({required this.experience, required this.delay});

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Timeline Dot
          Positioned(
            left: -45,
            top: 30, // Align with the box top
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: isHovered ? AppColors.primary : Colors.black,
                border: Border.all(
                  color: isHovered ? AppColors.primary : Colors.grey,
                  width: 2,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),

          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.only(bottom: 30),
            padding: const EdgeInsets.all(30),
            width: double.infinity,
            transform: Matrix4.identity()
              ..translate(0.0, isHovered ? -5.0 : 0.0),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(4), // Rectangular
              border: Border.all(
                color: isHovered ? AppColors.primary : Colors.white10,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Icon(
                              Icons.business,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.experience.role,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  widget.experience.company,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        widget.experience.duration,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  widget.experience.description,
                  style: const TextStyle(color: Colors.grey, height: 1.6),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    _BulletPoint(
                      text:
                          "End-to-end App Publishing on Play Store & App Store",
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(
                      text: "Complex REST API & Firebase Backend Integration",
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(
                      text: "Advanced AdMob & Facebook Ad Integration",
                    ),
                    const SizedBox(height: 8),
                    _BulletPoint(
                      text:
                          "Implementation of Clean Architecture & State Management",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ).animate().fadeIn(delay: widget.delay.ms).slideX(begin: 0.1, end: 0),
    );
  }
}

class _BulletPoint extends StatelessWidget {
  final String text;
  const _BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.check, color: AppColors.primary, size: 18),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
