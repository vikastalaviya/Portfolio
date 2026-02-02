import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/data/models/project.dart';
import 'package:flutter_application_1/app/data/models/experience.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();

  // Data
  final projects = <Project>[
    Project(
      title: "Cyber Runner 2044",
      description:
          "A fast-paced neon-soaked 2D platformer. Features global leaderboards, achievement tracking, and procedural level generation.",
      imagePath: "https://via.placeholder.com/600x400",
      techStack: ["Flame Engine", "Firebase"],
      playStoreUrl: "#",
      appStoreUrl: "#",
    ),
    Project(
      title: "Zen Logic",
      description:
          "Minimalist brain teaser with over 500 levels. Implemented custom state management for seamless puzzle transitions.",
      imagePath: "https://via.placeholder.com/600x400",
      techStack: ["AdMob", "SQLite"],
      playStoreUrl: "#",
      appStoreUrl: "#",
    ),
    Project(
      title: "Pocket Buddy AR",
      description:
          "Interact with your virtual pet in the real world. Optimized performance for high-end AR rendering in Flutter.",
      imagePath: "https://via.placeholder.com/600x400",
      techStack: ["ARCore", "Riverpod"],
      playStoreUrl: "#",
      appStoreUrl: "#",
    ),
  ].obs;

  final experiences = <Experience>[
    Experience(
      role: "Flutter Developer",
      company: "Keypress IT Services Pvt. Ltd.",
      duration: "Jan 2022 - Present",
      description:
          "Lead Flutter developer responsible for architecting and deploying high-quality cross-platform applications. Focused on performance, scalability, and seamless user experiences.\n\n• End-to-end App Publishing on Play Store & App Store\n• Complex REST API & Firebase Backend Integration\n• Advanced AdMob & Facebook Ad Integration\n• Implementation of Clean Architecture & State Management",
    ),
  ].obs;

  // Keys for scrolling
  final GlobalKey heroKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  // Method to scroll to section
  void scrollToSection(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
        alignment: 0.0, // Top of the screen
      );
      // Close drawer if open (for mobile)
      if (Get.isDialogOpen ?? false) Get.back();
      if (Scaffold.of(Get.context!).isEndDrawerOpen) Get.back();
    }
  }
}
