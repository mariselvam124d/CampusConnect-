import 'package:flutter/material.dart';
import '../widgets/top_header.dart';
import '../widgets/main_navbar.dart';
import '../widgets/hero_section.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainNavBar(),
            HeroSection(),
          ],
        ),
      ),
    );
  }
}
