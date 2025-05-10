import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ODFormsPage extends StatelessWidget {
  const ODFormsPage({super.key});

  void approve(String id) async {
    var doc = await FirebaseFirestore.instance.collection('od_forms').doc(id).get();
    await FirebaseFirestore.instance.collection('subject_od').doc(id).set(doc.data()!);
    await FirebaseFirestore.instance.collection('od_forms').doc(id).update({'status': 'Approved'});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('od_forms')
          .where('status', isEqualTo: 'Pending')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
        var docs = snapshot.data!.docs;

        return ListView(
          children: docs.map((doc) {
            var data = doc.data() as Map<String, dynamic>;
            return Card(
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text("Student: ${data['studentId']}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Event: ${data['eventName']}"),
                    Text("Date: ${data['date']}"),
                    Text("Time: ${data['time']}"),
                    Text("Department: ${data['department']}"),
                    Text("Purpose: ${data['purpose']}"),
                  ],
                ),
                trailing: ElevatedButton(
                  onPressed: () => approve(doc.id),
                  child: Text('Approve'),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
