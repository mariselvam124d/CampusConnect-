import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_first_app/screens/view_marks.dart';
import 'screens/od_form_screen.dart';
import 'screens/student_bio_screen.dart';
import 'widgets/side_drawer.dart';
import 'widgets/top_header.dart';
import 'widgets/main_navbar.dart';
import 'widgets/hero_section.dart';
import 'screens/view_marks.dart';

class StudentDashboard extends StatefulWidget {
  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    ODFormScreen(),
    studentmarks(),
    StudentBioScreen(),
    Center(child: Text('E4 Page')), // Placeholder for e4
  ];

  void onSelectPage(int index) {
    setState(() => selectedIndex = index);
    Navigator.pop(context); // Close drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(onItemSelected: onSelectPage),
      appBar: AppBar(title: Text('Student Dashboard')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainNavBar(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: screens[selectedIndex],
            ),
          ],
        ),
      ),
    );
  }
}
