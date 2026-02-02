import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const MobileSkills(),
      desktop: (BuildContext context) => const DesktopSkills(),
    );
  }
}

class DesktopSkills extends StatelessWidget {
  const DesktopSkills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 100),
      child: Column(
        children: [
          Text(
            "My Technical Arsenal",
            style: AppTextStyles.header.copyWith(
              fontSize: 40,
              color: Colors.white,
            ),
          ).animate().fadeIn(duration: 600.ms).moveY(begin: 20, end: 0),

          const SizedBox(height: 10),

          Text(
            "A collection of technologies and tools I use to build high-\nperformance mobile applications.",
            textAlign: TextAlign.center,
            style: AppTextStyles.body.copyWith(
              fontSize: 18,
              color: AppColors.textGrey,
            ),
          ).animate().fadeIn(delay: 200.ms).moveY(begin: 20, end: 0),

          const SizedBox(height: 50),

          Container(
                width: double.infinity,
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: AppColors.secondary.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.05),
                      blurRadius: 30,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CORE EXPERTISE",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Wrap(
                            spacing: 15,
                            runSpacing: 15,
                            children: [
                              _SkillChip(
                                label: "Dart",
                                icon: Icons.code,
                                isPrimary: false,
                                delay: 400,
                              ),
                              _SkillChip(
                                label: "Flutter",
                                icon: Icons.flutter_dash,
                                isPrimary: true,
                                delay: 500,
                              ),
                              _SkillChip(
                                label: "GetX",
                                icon: Icons.bolt,
                                isPrimary: false,
                                delay: 600,
                              ),
                              _SkillChip(
                                label: "Firebase",
                                icon: Icons.local_fire_department,
                                isPrimary: false,
                                delay: 700,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "TOOLS & UTILITIES",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Wrap(
                            spacing: 15,
                            runSpacing: 15,
                            children: [
                              _SkillChip(
                                label: "REST APIs",
                                icon: Icons.api,
                                isPrimary: false,
                                delay: 800,
                              ),
                              _SkillChip(
                                label: "Git",
                                icon: Icons.merge_type,
                                isPrimary: false,
                                delay: 900,
                              ),
                              _SkillChip(
                                label: "State Management",
                                icon: Icons.mediation,
                                isPrimary: false,
                                delay: 1000,
                              ),
                              _SkillChip(
                                label: "AdMob",
                                icon: Icons.monetization_on,
                                isPrimary: false,
                                delay: 1100,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
              .animate()
              .fadeIn(delay: 300.ms)
              .shimmer(duration: 1.5.seconds, delay: 2.seconds),
        ],
      ),
    );
  }
}

class MobileSkills extends StatelessWidget {
  const MobileSkills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        children: [
          Text(
            "My Technical Arsenal",
            textAlign: TextAlign.center,
            style: AppTextStyles.header.copyWith(
              fontSize: 32,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "A collection of technologies and tools I use to build high-performance mobile applications.",
            textAlign: TextAlign.center,
            style: AppTextStyles.body.copyWith(
              fontSize: 16,
              color: AppColors.textGrey,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.secondary.withOpacity(0.6),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CORE EXPERTISE",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 15),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _SkillChip(
                      label: "Dart",
                      icon: Icons.code,
                      isPrimary: false,
                      delay: 200,
                    ),
                    _SkillChip(
                      label: "Flutter",
                      icon: Icons.flutter_dash,
                      isPrimary: true,
                      delay: 300,
                    ),
                    _SkillChip(
                      label: "GetX",
                      icon: Icons.bolt,
                      isPrimary: false,
                      delay: 400,
                    ),
                    _SkillChip(
                      label: "Firebase",
                      icon: Icons.local_fire_department,
                      isPrimary: false,
                      delay: 500,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  "TOOLS & UTILITIES",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 15),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _SkillChip(
                      label: "REST APIs",
                      icon: Icons.api,
                      isPrimary: false,
                      delay: 600,
                    ),
                    _SkillChip(
                      label: "Git",
                      icon: Icons.merge_type,
                      isPrimary: false,
                      delay: 700,
                    ),
                    _SkillChip(
                      label: "State Management",
                      icon: Icons.mediation,
                      isPrimary: false,
                      delay: 800,
                    ),
                    _SkillChip(
                      label: "AdMob",
                      icon: Icons.monetization_on,
                      isPrimary: false,
                      delay: 900,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillChip extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool isPrimary;
  final int delay;
  const _SkillChip({
    required this.label,
    required this.icon,
    required this.isPrimary,
    required this.delay,
  });

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: widget.isPrimary
              ? AppColors.primary
              : (isHovered
                    ? AppColors.primary.withOpacity(0.2)
                    : const Color(0xFF2B3A4F)),
          borderRadius: BorderRadius.circular(30),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.4),
                    blurRadius: 10,
                  ),
                ]
              : [],
          border: widget.isPrimary
              ? null
              : Border.all(
                  color: isHovered ? AppColors.primary : Colors.transparent,
                ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.icon, color: Colors.white, size: 18),
            const SizedBox(width: 8),
            Text(
              widget.label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ).animate().scale(
      delay: widget.delay.ms,
      duration: 400.ms,
      curve: Curves.easeOutBack,
    );
  }
}
