import 'package:flutter/material.dart';

class TopHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[800],
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Contact: 123-456-7890 | Email: info@example.com',
              style: TextStyle(color: Colors.white, fontSize: 12)),
          Row(
            children: [
              Icon(Icons.login, color: Colors.white, size: 16),
              SizedBox(width: 8),
              Text("Login / Sign up", style: TextStyle(color: Colors.white)),
            ],
          )
        ],
      ),
    );
  }
}
