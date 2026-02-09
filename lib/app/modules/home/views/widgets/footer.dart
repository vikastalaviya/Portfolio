import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/app/modules/home/controllers/home_controller.dart';

class Footer extends GetView<HomeController> {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60),
      color: AppColors.background, // Match main background
      child: ScreenTypeLayout.builder(
        mobile: (BuildContext context) => const _MobileFooter(),
        desktop: (BuildContext context) => const _DesktopFooter(),
      ),
    );
  }
}

class _DesktopFooter extends StatelessWidget {
  const _DesktopFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Upper Section: Contact / Get in Touch
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Contact Info
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "GOT A PROJECT?",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        fontSize: 14,
                      ),
                    ).animate().fadeIn(delay: 200.ms),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        style: AppTextStyles.header.copyWith(
                          fontSize: 64,
                          height: 1.1,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                        children: [
                          const TextSpan(text: "Let's work\n"),
                          TextSpan(
                            text: "together.",
                            style: TextStyle(color: AppColors.primary),
                          ),
                        ],
                      ),
                    ).animate().fadeIn(delay: 400.ms),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(
                          child: _ContactCard(
                            label: "EMAIL ME",
                            value: "vikas@example.com",
                            icon: Icons.email_outlined,
                            delay: 600,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: _ContactCard(
                            label: "CALL ME",
                            value: "+91 98765 43210",
                            icon: Icons.phone_outlined,
                            delay: 700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 80),

              // Education / Quick Summary
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Education",
                      style: AppTextStyles.title.copyWith(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ).animate().fadeIn(),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.white10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "B.C.A",
                                style: AppTextStyles.title.copyWith(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Text(
                                  "2019 - 2022",
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Bhagwan Mahavir University",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          const SizedBox(height: 20),
                          const Divider(color: Colors.white10),
                          const SizedBox(height: 20),
                          const Text(
                            "Specialized in Mobile Application Development and Software Engineering principles.",
                            style: TextStyle(color: Colors.grey, height: 1.5),
                          ),
                        ],
                      ),
                    ).animate().fadeIn(delay: 500.ms).moveY(begin: 20, end: 0),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 100),

        // Bottom Footer
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 40),
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.white10)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "VIKAS TALAVIYA",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Flutter Developer",
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),

              Row(
                children: [
                  _FooterSocial(
                    icon: Icons.code,
                  ), // GitHub (using code icon as placeholder if needed, or FontAwesome)
                  const SizedBox(width: 15),
                  _FooterSocial(icon: Icons.link), // LinkedIn
                  const SizedBox(width: 15),
                  _FooterSocial(icon: Icons.alternate_email), // Email
                ],
              ),

              Text(
                "© 2024 All Rights Reserved",
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MobileFooter extends StatelessWidget {
  const _MobileFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "GOT A PROJECT?",
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              style: AppTextStyles.header.copyWith(
                fontSize: 40,
                height: 1.1,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
              children: [
                const TextSpan(text: "Let's work\n"),
                TextSpan(
                  text: "together.",
                  style: TextStyle(color: AppColors.primary),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          _ContactCard(
            label: "EMAIL ME",
            value: "vikas@example.com",
            icon: Icons.email_outlined,
            delay: 200,
          ),
          const SizedBox(height: 15),
          _ContactCard(
            label: "CALL ME",
            value: "+91 98765 43210",
            icon: Icons.phone_outlined,
            delay: 300,
          ),
          const SizedBox(height: 50),
          const Divider(color: Colors.white10),
          const SizedBox(height: 20),
          const Text(
            "VIKAS TALAVIYA",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "© 2024 All Rights Reserved",
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatefulWidget {
  final String label;
  final String value;
  final IconData icon;
  final int delay;
  const _ContactCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.delay,
  });

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: isHovered ? AppColors.primary : Colors.white10,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(widget.icon, color: AppColors.primary, size: 24),
            ),
            const SizedBox(height: 20),
            Text(
              widget.label,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ).animate().fadeIn(delay: widget.delay.ms).moveY(begin: 20, end: 0),
    );
  }
}

class _FooterSocial extends StatefulWidget {
  final IconData icon;
  const _FooterSocial({required this.icon});

  @override
  State<_FooterSocial> createState() => _FooterSocialState();
}

class _FooterSocialState extends State<_FooterSocial> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isHovered ? AppColors.primary : Colors.white10,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(widget.icon, color: Colors.white, size: 18),
      ),
    );
  }
}
