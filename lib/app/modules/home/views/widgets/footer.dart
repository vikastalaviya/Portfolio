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
      color: AppColors.backgroundDark,
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
        // Upper Section: Education & Contact
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Educational Background Card
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Educational Background",
                      style: AppTextStyles.header.copyWith(
                        fontSize: 32,
                        color: Colors.white,
                      ),
                    ).animate().fadeIn(),
                    const SizedBox(height: 10),
                    Text(
                      "My academic journey in computer science and software\ndevelopment.",
                      style: AppTextStyles.body.copyWith(color: Colors.grey),
                    ).animate().fadeIn(delay: 200.ms),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "2019 - 2022",
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  "Bachelor of Computer\nApplications",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  "Bhagwan Mahavir University",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.verified, size: 16),
                                  label: const Text("View Certificate"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white10,
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            width: 120,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey[800],
                              image: const DecorationImage(
                                image: NetworkImage(
                                  'https://via.placeholder.com/150x200',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).animate().fadeIn(delay: 400.ms).moveY(begin: 30, end: 0),
                  ],
                ),
              ),
              const SizedBox(width: 60),
              // Get In Touch Section
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "GET IN TOUCH",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ).animate().fadeIn(delay: 200.ms),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        style: AppTextStyles.header.copyWith(
                          fontSize: 48,
                          height: 1.1,
                          color: Colors.white,
                        ),
                        children: [
                          const TextSpan(text: "Let's build something\n"),
                          TextSpan(
                            text: "together.",
                            style: TextStyle(color: AppColors.primary),
                          ),
                        ],
                      ),
                    ).animate().fadeIn(delay: 400.ms),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: _ContactCard(
                            label: "EMAIL ME",
                            value: "vikas.t@dev.com",
                            icon: Icons.email,
                            delay: 600,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: _ContactCard(
                            label: "CALL ME",
                            value: "+91 98765 43210",
                            icon: Icons.phone,
                            delay: 700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _LinkedInCard().animate().fadeIn(delay: 800.ms),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 80),

        // Lower Footer
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 60),
          color: Colors.black, // Darker footer background
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          color: AppColors.primary,
                          alignment: Alignment.center,
                          child: const Text(
                            "V",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Vikas Talaviya",
                          style: AppTextStyles.title.copyWith(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Passionate Flutter Developer building cross-\nplatform experiences that are beautiful,\nperformant, and accessible.",
                      style: TextStyle(color: Colors.grey, height: 1.6),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        _FooterSocial(icon: Icons.code),
                        const SizedBox(width: 10),
                        _FooterSocial(icon: Icons.share),
                        const SizedBox(width: 10),
                        _FooterSocial(icon: Icons.language),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "NAVIGATION",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _FooterLink("Home"),
                    _FooterLink("About"),
                    _FooterLink("Projects"),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "SERVICES",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _FooterLink("App Development"),
                    _FooterLink("UI/UX Design"),
                    _FooterLink("Consulting"),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "LOCATION",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[800],
                        image: const DecorationImage(
                          image: NetworkImage(
                            'https://via.placeholder.com/100',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ).animate().fadeIn(delay: 500.ms),
        ),

        // Copyright
        Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "© 2024 VIKAS TALAVIYA. ALL RIGHTS RESERVED.",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const Row(
                children: [
                  Text(
                    "MADE WITH ",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Icon(Icons.favorite, color: Colors.red, size: 14),
                  Text(
                    " USING FLUTTER WEB",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
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
        children: [
          const Text(
            "Get in Touch",
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Let's build something together.",
            textAlign: TextAlign.center,
            style: AppTextStyles.header.copyWith(
              fontSize: 32,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),
          _ContactCard(
            label: "EMAIL ME",
            value: "vikas.t@dev.com",
            icon: Icons.email,
            delay: 200,
          ),
          const SizedBox(height: 15),
          _ContactCard(
            label: "CALL ME",
            value: "+91 98765 43210",
            icon: Icons.phone,
            delay: 300,
          ),
          const SizedBox(height: 40),
          const Text(
            "© 2024 VIKAS TALAVIYA.",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(delay: delay.ms).moveY(begin: 10, end: 0);
  }
}

class _LinkedInCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.person, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: 15),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "LINKEDIN PROFESSIONAL",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "linkedin.com/in/vikas-talaviya",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward, color: Colors.grey),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String text;
  const _FooterLink(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white70),
      ).animate().fadeIn().moveX(begin: -5, end: 0),
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
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isHovered ? AppColors.primary : Colors.white10,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(widget.icon, color: Colors.white, size: 18),
      ),
    );
  }
}
