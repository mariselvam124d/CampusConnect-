import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SideDrawer extends StatelessWidget {
  final Function(int) onItemSelected;
  final currentUser = FirebaseAuth.instance.currentUser!;

  SideDrawer({required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder(
        future: FirebaseAuth.instance.currentUser?.uid != null
            ? FirebaseAuth.instance.currentUser!.reload().then((_) => FirebaseAuth.instance.currentUser)
            : Future.value(null),
        builder: (context, snapshot) {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(currentUser.displayName ?? 'Student'),
                accountEmail: Text(currentUser.email ?? ''),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40),
                ),
              ),
              ListTile(
                leading: Icon(Icons.event),
                title: Text('OD FORM APPLY'),
                onTap: () => onItemSelected(0),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('INTERNAL MARKS '),
                onTap: () => onItemSelected(1),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('STUDENT BIO'),
                onTap: () => onItemSelected(2),
              ),
              
              ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('E4'),
                onTap: () => onItemSelected(3),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
