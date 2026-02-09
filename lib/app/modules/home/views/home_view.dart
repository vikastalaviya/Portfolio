import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import '../controllers/home_controller.dart';
import 'widgets/nav_bar.dart';
import 'widgets/hero_section.dart';
import 'widgets/projects_section.dart';
import 'widgets/experience_section.dart';
import 'widgets/footer.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      endDrawer: Container(
        width: 250,
        color: AppColors.secondary,
        child: Column(
          children: [
            const SizedBox(height: 50),
            ListTile(
              title: Text("Home", style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              title: Text("Projects", style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              title: Text("About", style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              title: Text("Contact", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),
            HeroSection(key: controller.heroKey),

            const SizedBox(height: 80),
            ExperienceSection(key: controller.experienceKey),
            const SizedBox(height: 80),
            ProjectsSection(key: controller.projectsKey),

            const SizedBox(height: 80),
            Footer(key: controller.contactKey),
          ],
        ),
      ),
    );
  }
}
