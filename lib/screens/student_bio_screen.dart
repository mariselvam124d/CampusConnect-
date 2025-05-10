import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



class StudentBioScreen extends StatelessWidget {
final currentUser = FirebaseAuth.instance.currentUser!;

@override
Widget build(BuildContext context) {
return FutureBuilder<DocumentSnapshot>(
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
            Center(child: Image.network(data['photoUrl'], width: 100, height: 100)),
          SizedBox(height: 10),
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
          SizedBox(height: 20),
          Text(
            "Exam 1 Marks",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 10),
          FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('users')
                .doc(currentUser.uid)
                .collection('marks')
                .doc('mark1')
                .get(),
            builder: (context, markSnapshot) {
              if (!markSnapshot.hasData) return CircularProgressIndicator();
              var marks = markSnapshot.data!.data() as Map<String, dynamic>;

              return Table(
                border: TableBorder.all(color: Colors.black),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    decoration: BoxDecoration(color: Colors.grey[300]),
                    children: [
                      tableHeaderCell("Subject"),
                      tableHeaderCell("Marks"),
                    ],
                  ),
                  tableRow("CS", marks['cs'].toString()),
                  tableRow("Maths", marks['maths'].toString()),
                  tableRow("Science", marks['science'].toString()),
                  tableRow("Social", marks['social'].toString()),
                ],
              );
            },
          ),
        ],
      ),
    );
  },
);
}

Widget tableHeaderCell(String text) {
return Padding(
padding: const EdgeInsets.all(8.0),
child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
);
}

TableRow tableRow(String subject, String mark) {
    return TableRow(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(subject),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(mark),
      ),
    ]);
  }
}