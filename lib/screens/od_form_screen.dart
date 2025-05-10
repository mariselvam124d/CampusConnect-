import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ODFormScreen extends StatefulWidget {
  @override
  _ODFormScreenState createState() => _ODFormScreenState();
}

class _ODFormScreenState extends State<ODFormScreen> {
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
    return Padding(
      padding: EdgeInsets.all(16),
      child: applied
          ? Text("OD Application: Pending")
          : Column(
              children: [
                TextField(decoration: InputDecoration(labelText: 'sutdentName&rolno'), onChanged: (v) => eventName = v),
                TextField(decoration: InputDecoration(labelText: 'Date'), onChanged: (v) => date = v),
                TextField(decoration: InputDecoration(labelText: 'Time'), onChanged: (v) => time = v),
                TextField(decoration: InputDecoration(labelText: 'Department'), onChanged: (v) => department = v),
                TextField(decoration: InputDecoration(labelText: 'Purpose'), onChanged: (v) => purpose = v),
                SizedBox(height: 10),
                ElevatedButton(onPressed: applyOD, child: Text('Apply OD')),
              ],
            ),
    );
  }
}
