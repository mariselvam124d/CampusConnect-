import 'package:flutter/material.dart';
import 'package:my_first_app/widgets/main_navbar.dart';


void main() => runApp(CourseScreen());

class CourseScreen extends StatelessWidget {
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
    {'title': 'B.Tech Artificial Intelligence and Data Science', 'image': 'assets/ai.jpeg'},
    {'title': 'B.Tech Bio-Technology', 'image': 'assets/bio.jpg'},
    {'title': 'B.E Computer Science and Engineering', 'image': 'assets/cse.png'},
    {'title': 'B.E Civil Engineering', 'image': 'assets/civil.jpeg'},
    {'title': 'B.E ECE', 'image': 'assets/ece.jpeg'},
    {'title': 'B.E EEE', 'image': 'assets/eee.jpeg'},
    {'title': 'B.Tech IT', 'image': 'assets/it.jpeg'},
    {'title': 'B.E Mechanical', 'image': 'assets/mech.jpg'},
    {'title': 'B.E Mechatronics', 'image': 'assets/mechatronic.jpg'},
    {'title': 'M.E Communication & Networking', 'image': 'assets/communication.jpeg'},
    {'title': 'M.E Power Systems Engineering', 'image': 'assets/net.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
            
            // Animated Departments Grid
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: departments
                    .map((dept) => AnimatedCard(
                          title: dept['title']!,
                          image: dept['image']!,
                        ))
                    .toList(),
              ),
            ),
            // Animated Sections
            sectionWidget('Achievements', 'assets/achievement.png'),
            sectionWidget('Events', 'assets/event.png'),
            sectionWidget('Awards & Recognition', 'assets/award.jpg'),
          ],
        ),
      ),
    );
  }

  Widget sectionWidget(String title, String imageAsset) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.orange, Colors.deepOrange]),
          ),
          child: Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(imageAsset, height: 200, fit: BoxFit.cover),
          ),
        )
      ],
    );
  }
}

class AnimatedCard extends StatefulWidget {
  final String title;
  final String image;
  

  const AnimatedCard({Key? key, required this.title, required this.image}) : super(key: key);

  @override
  _AnimatedCardState createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> with SingleTickerProviderStateMixin {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: Duration(milliseconds: 200),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2 - 20,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                
                FadeInImage(
                  placeholder: AssetImage('assets/placeholeder.jpg'), // Add a placeholder asset
                  image: AssetImage(widget.image),
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
