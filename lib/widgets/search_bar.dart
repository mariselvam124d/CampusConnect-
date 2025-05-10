import 'package:flutter/material.dart';

class MainNavBar extends StatefulWidget {
  @override
  _MainNavBarState createState() => _MainNavBarState();
}

class _MainNavBarState extends State<MainNavBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo,
      padding: EdgeInsets.all(12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            navText("Home"),
            navText("About Us"),
            navText("Admission"),
            navText("Courses"),
            navText("Events"),
            navText("Student"),
            navText("Contact"),
            SizedBox(width: 20),
            Container(
              width: 200,
              height: 35,
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  // Add your search logic here
                  print("Searching for: $value");
                },
                decoration: InputDecoration(
                  hintText: "Search...",
                  border: InputBorder.none,
                  icon: Icon(Icons.search, size: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget navText(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Text(label, style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}
