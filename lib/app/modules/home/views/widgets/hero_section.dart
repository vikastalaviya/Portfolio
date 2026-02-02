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
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 80),
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
                    Text(
                      "Hi, I'm",
                      style: AppTextStyles.header.copyWith(
                        fontSize: 24,
                        color: AppColors.primary,
                      ),
                    ).animate().fadeIn(duration: 600.ms).slideX(begin: -30),

                    const SizedBox(height: 10),

                    ShaderMask(
                          shaderCallback: (bounds) =>
                              AppColors.primaryGradient.createShader(bounds),
                          child: Text(
                            "Vikas Talaviya",
                            style: AppTextStyles.header.copyWith(
                              fontSize: 80,
                              height: 1.0,
                              color: Colors.white, // Required for shader
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        )
                        .animate()
                        .fadeIn(delay: 200.ms, duration: 800.ms)
                        .moveY(begin: 30, end: 0),

                    const SizedBox(height: 20),

                    Text(
                      "Flutter Developer & Game Creator",
                      style: AppTextStyles.subHeader.copyWith(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ).animate().fadeIn(delay: 400.ms, duration: 600.ms),

                    const SizedBox(height: 30),

                    Text(
                      "Building high-performance cross-platform experiences and\nengaging interactive games with a focus on seamless\ndesign and clean architecture.",
                      style: AppTextStyles.body.copyWith(
                        fontSize: 18,
                        color: AppColors.textGrey,
                        height: 1.6,
                      ),
                    ).animate().fadeIn(delay: 600.ms, duration: 600.ms),

                    const SizedBox(height: 50),

                    Row(
                      children: [
                        _HeroButton(
                          text: "Contact Me",
                          isPrimary: true,
                          onPressed: () =>
                              controller.scrollToSection(controller.contactKey),
                        ).animate().fadeIn(delay: 800.ms).scale(),

                        const SizedBox(width: 20),

                        _HeroButton(
                          text: "View Projects",
                          isPrimary: false,
                          onPressed: () => controller.scrollToSection(
                            controller.projectsKey,
                          ),
                        ).animate().fadeIn(delay: 900.ms).scale(),
                      ],
                    ),

                    const SizedBox(height: 60),

                    // Social Icons
                    Row(
                      children: [
                        _SocialIcon(icon: Icons.share, delay: 1000),
                        const SizedBox(width: 30),
                        _SocialIcon(icon: Icons.code, delay: 1100),
                        const SizedBox(width: 30),
                        _SocialIcon(icon: Icons.alternate_email, delay: 1200),
                        const SizedBox(width: 30),
                        _SocialIcon(icon: Icons.email, delay: 1300),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 60),

              LayoutBuilder(
                builder: (context, constraints) {
                  double size = constraints.maxWidth < 600 ? 300 : 450;
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                            width: size,
                            height: size + 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withOpacity(0.3),
                                  blurRadius: 150,
                                  spreadRadius: 2,
                                ),
                                BoxShadow(
                                  color: AppColors.accent.withOpacity(0.3),
                                  blurRadius: 150,
                                  spreadRadius: 2,
                                  offset: const Offset(50, 50),
                                ),
                              ],
                            ),
                          )
                          .animate(
                            onPlay: (controller) =>
                                controller.repeat(reverse: true),
                          )
                          .scaleXY(
                            begin: 0.9,
                            end: 1.1,
                            duration: 3000.ms,
                            curve: Curves.easeInOut,
                          ),

                      Container(
                            width: size,
                            height: size + 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: const Color(0x0DFFFFFF),
                                width: 2,
                              ),
                              image: const DecorationImage(
                                image: AssetImage('assets/ig.jpeg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                          .animate()
                          .fadeIn(duration: 1000.ms)
                          .moveY(begin: 50, end: 0)
                          .shimmer(duration: 2000.ms, delay: 2000.ms),
                    ],
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: 100),

          // Glassmorphism Professional Objective Card
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                  gradient: const LinearGradient(
                    colors: [Color(0x0DFFFFFF), Colors.transparent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                              Icons.gps_fixed,
                              color: AppColors.primary,
                              size: 28,
                            )
                            .animate(
                              onPlay: (controller) => controller.repeat(),
                            )
                            .rotate(duration: 4000.ms),
                        const SizedBox(width: 12),
                        Text(
                          "Professional Objective",
                          style: AppTextStyles.title.copyWith(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "\"To leverage my expertise in Flutter and game development to create high-performance, visually stunning, and user-centric digital solutions. Committed to clean architecture and innovative problem-solving in a professional environment.\"",
                      style: AppTextStyles.body.copyWith(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[300],
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ).animate().fadeIn(delay: 1500.ms).slideY(begin: 0.3, end: 0),
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
          Text(
            "Hi, I'm",
            style: AppTextStyles.header.copyWith(
              fontSize: 20,
              color: AppColors.primary,
            ),
          ),
          ShaderMask(
            shaderCallback: (bounds) =>
                AppColors.primaryGradient.createShader(bounds),
            child: Text(
              "Vikas\nTalaviya",
              style: AppTextStyles.header.copyWith(
                fontSize: 48,
                height: 1.1,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Flutter Developer & Game Creator",
            style: AppTextStyles.subHeader.copyWith(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Building high-performance cross-platform experiences and engaging interactive games.",
            style: AppTextStyles.body.copyWith(
              color: AppColors.textGrey,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 30),

          Row(
            children: [
              Expanded(
                child: _HeroButton(
                  text: "Contact Me",
                  isPrimary: true,
                  onPressed: () =>
                      controller.scrollToSection(controller.contactKey),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _HeroButton(
                  text: "Projects",
                  isPrimary: false,
                  onPressed: () =>
                      controller.scrollToSection(controller.projectsKey),
                ),
              ),
            ],
          ).animate().fadeIn(delay: 500.ms),

          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _SocialIcon(icon: Icons.share, delay: 600),
              _SocialIcon(icon: Icons.code, delay: 700),
              _SocialIcon(icon: Icons.alternate_email, delay: 800),
              _SocialIcon(icon: Icons.email, delay: 900),
            ],
          ),

          const SizedBox(height: 40),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.gps_fixed,
                          color: AppColors.primary,
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "Professional Objective",
                          style: AppTextStyles.title.copyWith(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "\"To leverage my expertise in Flutter and game development to create high-performance, visually stunning, and user-centric digital solutions.\"",
                      style: AppTextStyles.body.copyWith(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey[300],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final int delay;
  const _SocialIcon({required this.icon, required this.delay});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.secondary,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(child: Icon(icon, color: Colors.grey[400], size: 20)),
        )
        .animate(onPlay: (controller) => controller.repeat(reverse: true))
        .moveY(
          begin: 0,
          end: -5,
          duration: 2000.ms,
          delay: delay.ms,
          curve: Curves.easeInOut,
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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), // Pill shape
          gradient: widget.isPrimary ? AppColors.primaryGradient : null,
          boxShadow: widget.isPrimary
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(isHovered ? 0.6 : 0.4),
                    blurRadius: isHovered ? 30 : 20,
                    offset: const Offset(0, 5),
                  ),
                ]
              : [],
        ),
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            shadowColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 22),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: widget.isPrimary
                  ? BorderSide.none
                  : BorderSide(
                      color: isHovered
                          ? AppColors.primary
                          : AppColors.primary.withOpacity(0.5),
                      width: 2,
                    ),
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
