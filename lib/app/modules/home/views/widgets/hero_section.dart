import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/app/modules/home/controllers/home_controller.dart';
import 'dart:ui';

class HeroSection extends GetView<HomeController> {
  const HeroSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const MobileHero(),
      desktop: (BuildContext context) => const DesktopHero(),
    );
  }
}

class DesktopHero extends GetView<HomeController> {
  const DesktopHero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // "Hello." with Dot
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "Hello",
                          style: AppTextStyles.header.copyWith(
                            fontSize: 60,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ".",
                          style: AppTextStyles.header.copyWith(
                            fontSize: 60,
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ).animate().fadeIn(duration: 600.ms).slideX(begin: -30),

                    const SizedBox(height: 10),

                    // "I'm Jensen" (Name)
                    Row(
                      children: [
                        Container(
                          height: 2,
                          width: 50,
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: 15),
                        Text(
                          "I'm Vikas",
                          style: AppTextStyles.subHeader.copyWith(
                            fontSize: 32,
                            color: AppColors.textGrey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ).animate().fadeIn(delay: 200.ms, duration: 800.ms),

                    const SizedBox(height: 10),

                    // "Software Developer" (Title)
                    Text(
                      "Software Developer",
                      style: AppTextStyles.header.copyWith(
                        fontSize: 72,
                        height: 1.1,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ).animate().fadeIn(delay: 400.ms, duration: 600.ms),

                    const SizedBox(height: 50),

                    Row(
                      children: [
                        _HeroButton(
                          text: "Got a project?",
                          isPrimary: true,
                          onPressed: () =>
                              controller.scrollToSection(controller.contactKey),
                        ).animate().fadeIn(delay: 800.ms).scale(),
                        const SizedBox(width: 20),
                        _HeroButton(
                          text: "My resume",
                          isPrimary: false,
                          onPressed: () {}, // Add resume logic
                        ).animate().fadeIn(delay: 900.ms).scale(),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 60),

              // Image / Abstract Graphic
              LayoutBuilder(
                builder: (context, constraints) {
                  double size = constraints.maxWidth < 600 ? 300 : 450;
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      // Outer Glow Ring
                      Container(
                            width: size,
                            height: size,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.primary.withOpacity(0.2),
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withOpacity(0.1),
                                  blurRadius: 50,
                                  spreadRadius: 10,
                                ),
                              ],
                            ),
                          )
                          .animate(
                            onPlay: (controller) =>
                                controller.repeat(reverse: true),
                          )
                          .scaleXY(
                            begin: 0.95,
                            end: 1.05,
                            duration: 3000.ms,
                            curve: Curves.easeInOut,
                          ),

                      // Inner decorative ring
                      Container(
                        width: size * 0.8,
                        height: size * 0.8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primary, // Solid orange ring
                            width: 15,
                          ),
                        ),
                      ),

                      // Image Container
                      Container(
                        width: size * 0.7, // slightly smaller than inner ring
                        height: size * 0.7,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            image: AssetImage(
                              'assets/ig.jpeg',
                            ), // Use user's image
                            fit: BoxFit.cover,
                          ),
                        ),
                      ).animate().fadeIn(duration: 1000.ms),
                    ],
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 30),
          const TechStackBar(),
        ],
      ),
    );
  }
}

class MobileHero extends GetView<HomeController> {
  const MobileHero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                "Hello",
                style: AppTextStyles.header.copyWith(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              Text(
                ".",
                style: AppTextStyles.header.copyWith(
                  fontSize: 40,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(height: 2, width: 30, color: AppColors.primary),
              const SizedBox(width: 10),
              Text(
                "I'm Vikas",
                style: AppTextStyles.subHeader.copyWith(
                  fontSize: 24,
                  color: AppColors.textGrey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "Software Developer",
            style: AppTextStyles.header.copyWith(
              fontSize: 48,
              height: 1.1,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          // const SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: _HeroButton(
                  text: "Got a project?",
                  isPrimary: true,
                  onPressed: () =>
                      controller.scrollToSection(controller.contactKey),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _HeroButton(
                  text: "My resume",
                  isPrimary: false,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          // const SizedBox(height: 60),
          const TechStackBar(),
        ],
      ),
    );
  }
}

class TechStackBar extends StatelessWidget {
  const TechStackBar({Key? key}) : super(key: key);

  final List<String> skills = const [
    "FLUTTER",
    "DART",
    "FIREBASE",
    "GETX",
    "REST API",
    "GIT",
    "STATE MANAGEMENT",
    "ADMOB",
    "UI/UX",
    "CLEAN ARCHITECTURE",
    "FIGMA",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          top: BorderSide(color: Colors.white.withOpacity(0.05)),
          bottom: BorderSide(color: Colors.white.withOpacity(0.05)),
        ),
      ),
      child: _InfiniteMarquee(
        children: skills.map((skill) => _SkillItem(skill: skill)).toList(),
      ),
    ).animate().fadeIn(duration: 800.ms).slideY(begin: 1.0, end: 0.0);
  }
}

class _SkillItem extends StatelessWidget {
  final String skill;
  const _SkillItem({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        skill,
        style: AppTextStyles.body.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white.withOpacity(0.3),
          letterSpacing: 2.0,
        ),
      ),
    );
  }
}

class _InfiniteMarquee extends StatefulWidget {
  final List<Widget> children;

  const _InfiniteMarquee({required this.children, Key? key}) : super(key: key);

  @override
  State<_InfiniteMarquee> createState() => _InfiniteMarqueeState();
}

class _InfiniteMarqueeState extends State<_InfiniteMarquee>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 20))
          ..addListener(() {
            if (_scrollController.hasClients) {
              double maxScroll = _scrollController.position.maxScrollExtent;
              if (_scrollController.offset >= maxScroll) {
                _scrollController.jumpTo(0);
              } else {
                _scrollController.jumpTo(_scrollController.offset + 1.0);
              }
            }
          })
          ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Row(children: widget.children);
        },
      ),
    );
  }
}

class _HeroButton extends StatefulWidget {
  final String text;
  final bool isPrimary;
  final VoidCallback onPressed;

  const _HeroButton({
    required this.text,
    required this.isPrimary,
    required this.onPressed,
  });

  @override
  State<_HeroButton> createState() => _HeroButtonState();
}

class _HeroButtonState extends State<_HeroButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(isHovered ? 1.05 : 1.0),
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.isPrimary
                ? AppColors.primary
                : Colors.transparent,
            foregroundColor: Colors.white,
            shadowColor: Colors.transparent, // Flat style
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 22),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                4,
              ), // Rectangular as requested
              side: widget.isPrimary
                  ? BorderSide.none
                  : const BorderSide(color: Colors.white30, width: 1),
            ),
          ),
          child: Text(
            widget.text,
            style: AppTextStyles.button.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
