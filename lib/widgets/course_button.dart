import 'package:flutter/material.dart';
import '../widgets/top_header.dart';
import '../widgets/main_navbar.dart';
import '../widgets/hero_section.dart';

void main() => runApp(coursescreen());

class coursescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KCET Template',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> departments = [
    {'title': 'B.Tech Artificial Intelligence and Data Science', 'image': 'assets/ai.png'},
    {'title': 'B.Tech Bio-Technology', 'image': 'assets/biotech.png'},
    {'title': 'B.E Computer Science and Engineering', 'image': 'assets/cse.png'},
    {'title': 'B.E Civil Engineering', 'image': 'assets/civil.png'},
    {'title': 'B.E ECE', 'image': 'assets/ece.png'},
    {'title': 'B.E EEE', 'image': 'assets/eee.png'},
    {'title': 'B.Tech IT', 'image': 'assets/it.png'},
    {'title': 'B.E Mechanical', 'image': 'assets/mech.png'},
    {'title': 'B.E Mechatronics', 'image': 'assets/mechatronics.png'},
    {'title': 'M.E Communication & Networking', 'image': 'assets/mecn.png'},
    {'title': 'M.E Power Systems Engineering', 'image': 'assets/mepse.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KCET'),
        backgroundColor: Colors.indigo[900],
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.amber,
              child: Text(
                "2025\n2026",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            MainNavBar(),
           
            // Departments Grid
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: departments
                    .map((dept) => SizedBox(
                          width: MediaQuery.of(context).size.width / 2 - 20,
                          child: Card(
                            elevation: 3,
                            child: Column(
                              children: [
                                Image.asset(dept['image']!, height: 100, fit: BoxFit.cover),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    dept['title']!,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            // Section Titles and Images
            sectionWidget('Achievements', 'assets/achievement.png'),
            sectionWidget('Events', 'assets/event.png'),
            sectionWidget('Awards & Recognition', 'assets/award.png'),
          ],
        ),
      ),
    );
  }

  Widget sectionWidget(String title, String imageAsset) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 20, color: Colors.orange, fontWeight: FontWeight.bold)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(imageAsset, height: 200, fit: BoxFit.cover),
        )
      ],
    );
  }
}
