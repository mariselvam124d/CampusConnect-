import 'package:flutter/material.dart';
import 'package:my_first_app/screens/admission_screen.dart';
import 'package:my_first_app/screens/courses_screen.dart' as coursescreen;
import 'package:my_first_app/screens/contact_screen.dart';
import 'package:my_first_app/signup.dart';
import 'package:my_first_app/login.dart';

class MainNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.indigo.shade700, Colors.indigo.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4)),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      margin: EdgeInsets.all(10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _navItem(context, "Home", Icons.home, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CollegeAdmissionApp()),
              );
            }),
            _navItem(context, "About Us", Icons.info_outline, () {
              // Navigate to About Us screen
            }),
            _navItem(context, "Admission", Icons.app_registration, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CollegeAdmissionApp()),
              );
            }),
            _navItem(context, "Courses", Icons.book, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => coursescreen.CourseScreen()),
              );
            }),
            _navItem(context, "Events", Icons.event, () {
              // Navigate to Events screen
            }),
            _navItem(context, "Student", Icons.account_circle, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            }),
            _navItem(context, "chairperson", Icons.account_circle, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            }),
            _navItem(context, "staff", Icons.account_circle, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            }),
            _navItem(context, "Contact", Icons.contact_mail, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => contactscreen()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _navItem(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: onTap,
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 1.0, end: 1.0),
          duration: Duration(milliseconds: 200),
          builder: (context, scale, child) => MouseRegion(
            onEnter: (_) => _onHover(true),
            onExit: (_) => _onHover(false),
            cursor: SystemMouseCursors.click,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 22),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white38),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(icon, color: Colors.white, size: 18),
                  SizedBox(width: 8),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onHover(bool isHovered) {
    // Hover effect logic can be added here if required
  }
}
