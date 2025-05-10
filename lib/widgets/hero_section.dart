import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/clg front.jpg',
          height: 400,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          height: 400,
          alignment: Alignment.center,
          color: Colors.black.withOpacity(0.4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "WELCOME TO UNIVERSITY",
                style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "There are many variations of passages of Lorem Ipsum...",
                style: TextStyle(color: Colors.white70, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Wrap(
                spacing: 10,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("ALL COURSES"),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text("READ MORE", style: TextStyle(color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.white),
                    ),
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
