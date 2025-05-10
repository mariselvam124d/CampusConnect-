import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final String studentName;
  final String studentPhotoUrl;
  final Function(int) onSelect;

  AppDrawer({
    required this.studentName,
    required this.studentPhotoUrl,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(studentPhotoUrl),
            ),
            accountName: Text(studentName),
            accountEmail: Text(""), // Optional: Add email if needed
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('e1: OD Forms'),
            onTap: () => onSelect(1),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('e2: Staff Bio Data'),
            onTap: () => onSelect(2),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('e3'),
            onTap: () => onSelect(3),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('e4'),
            onTap: () => onSelect(4),
          ),
          Spacer(),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              // Add logout functionality here if needed
            },
          ),
        ],
      ),
    );
  }
}
