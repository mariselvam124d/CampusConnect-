import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StudentDashboard extends StatefulWidget {
  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  bool applied = false;
  String eventName = '', date = '', time = '', department = '', purpose = '';

  Future<void> applyOD() async {
    await FirebaseFirestore.instance.collection('od_forms').doc(currentUser.uid).set({
      'studentId': currentUser.uid,
      'eventName': eventName,
      'date': date,
      'time': time,
      'department': department,
      'purpose': purpose,
      'status': 'Pending',
    });
    setState(() => applied = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Dashboard')),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('users').doc(currentUser.uid).get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          var data = snapshot.data!.data() as Map<String, dynamic>;

          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (data['photoUrl'] != '')
                  Center(child: Image.network(data['photoUrl'], width: 100, height: 100)), // Using Image.network instead of Image.file
                Text("Name: ${data['name']}"),
                Text("Reg No: ${data['regNo']}"),
                Text("Department: ${data['department']}"),
                Text("Phone: ${data['phone']}"),
                Text("Address: ${data['address']}"),
                Text("DOB: ${data['dob']}"),
                Text("Blood Group: ${data['bloodGroup']}"),
                Text("Guardian: ${data['guardian']}"),
                Text("Guardian Phone: ${data['guardianPhone']}"),
                Text("Hobby: ${data['hobby']}"),
                Text("Skills: ${data['skills']}"),
                Divider(),
                applied
                    ? Text("OD Application: Pending")
                    : Column(
                        children: [
                          TextField(decoration: InputDecoration(labelText: 'Event Name'), onChanged: (v) => eventName = v),
                          TextField(decoration: InputDecoration(labelText: 'Date'), onChanged: (v) => date = v),
                          TextField(decoration: InputDecoration(labelText: 'Time'), onChanged: (v) => time = v),
                          TextField(decoration: InputDecoration(labelText: 'Department'), onChanged: (v) => department = v),
                          TextField(decoration: InputDecoration(labelText: 'Purpose'), onChanged: (v) => purpose = v),
                          ElevatedButton(onPressed: applyOD, child: Text('Apply OD')),
                        ],
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
