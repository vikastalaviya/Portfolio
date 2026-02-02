import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/app/modules/home/controllers/home_controller.dart';

class NavBar extends GetView<HomeController> {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const MobileNavBar(),
      desktop: (BuildContext context) => const DesktopNavBar(),
    );
  }
}

class DesktopNavBar extends GetView<HomeController> {
  const DesktopNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      color: AppColors.background.withOpacity(0.9), // Slight transparency
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const NavBarLogo(),
          Row(
            children: [
              _NavBarItem(
                title: 'Home',
                onTap: () => controller.scrollToSection(controller.heroKey),
              ),
              const SizedBox(width: 30),
              _NavBarItem(
                title: 'Projects',
                onTap: () => controller.scrollToSection(controller.projectsKey),
              ),
              const SizedBox(width: 30),
              _NavBarItem(
                title: 'Skills',
                onTap: () => controller.scrollToSection(controller.skillsKey),
              ),
              const SizedBox(width: 30),
              _NavBarItem(
                title: 'Experience',
                onTap: () =>
                    controller.scrollToSection(controller.experienceKey),
              ),
              const SizedBox(width: 30),
              _NavBarItem(
                title: 'Contact',
                onTap: () => controller.scrollToSection(controller.contactKey),
              ),
              const SizedBox(width: 30),
              const HireMeButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class MobileNavBar extends StatelessWidget {
  const MobileNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const NavBarLogo(),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ],
      ),
    );
  }
}

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.4),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Center(
            child: Text(
              "V",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'Vikas Talaviya',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const _NavBarItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: Colors.transparent,
      child: HoverBuilder(
        builder: (isHovered) {
          return Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isHovered ? FontWeight.w600 : FontWeight.normal,
              color: isHovered ? AppColors.primary : Colors.white70,
            ),
          );
        },
      ),
    );
  }
}

// Simple Helper for Hover
class HoverBuilder extends StatefulWidget {
  final Widget Function(bool isHovered) builder;
  const HoverBuilder({required this.builder});
  @override
  _HoverBuilderState createState() => _HoverBuilderState();
}

class _HoverBuilderState extends State<HoverBuilder> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: widget.builder(_isHovered),
    );
  }
}

class HireMeButton extends StatelessWidget {
  const HireMeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        elevation: 4,
      ),
      child: Text(
        'Resume',
        style: AppTextStyles.button.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
