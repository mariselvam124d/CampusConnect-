import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UploadMarksPage extends StatefulWidget {
  @override
  _UploadMarksPageState createState() => _UploadMarksPageState();
}

class _UploadMarksPageState extends State<UploadMarksPage> {
  final regNoController = TextEditingController();
  final mathsController = TextEditingController();
  final scienceController = TextEditingController();
  final socialController = TextEditingController();
  final csController = TextEditingController();

  String selectedMarkCategory = 'marks'; // default selected

  final List<String> markCategories = ['marks', 'mark1'];

  Future<void> uploadMarks() async {
    final regNo = regNoController.text.trim();
    final maths = int.tryParse(mathsController.text) ?? 0;
    final science = int.tryParse(scienceController.text) ?? 0;
    final social = int.tryParse(socialController.text) ?? 0;
    final cs = int.tryParse(csController.text) ?? 0;

    final userQuery = await FirebaseFirestore.instance
        .collection('users')
        .where('regNo', isEqualTo: regNo)
        .get();

    if (userQuery.docs.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Student with RegNo $regNo not found")),
      );
      return;
    }

    final userDocId = userQuery.docs.first.id;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userDocId)
        .collection('marks')
        .doc(selectedMarkCategory) // dynamic category
        .set({
      'maths': maths,
      'science': science,
      'social': social,
      'cs': cs,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Marks uploaded to $selectedMarkCategory successfully")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Marks')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            DropdownButtonFormField<String>(
              value: selectedMarkCategory,
              decoration: InputDecoration(labelText: "Select Mark Category"),
              items: markCategories.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category.toUpperCase()),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedMarkCategory = value!;
                });
              },
            ),
            SizedBox(height: 10),
            TextField(controller: regNoController, decoration: InputDecoration(labelText: 'RegNo')),
            TextField(controller: mathsController, decoration: InputDecoration(labelText: 'Maths')),
            TextField(controller: scienceController, decoration: InputDecoration(labelText: 'Science')),
            TextField(controller: socialController, decoration: InputDecoration(labelText: 'Social')),
            TextField(controller: csController, decoration: InputDecoration(labelText: 'Computer Science')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: uploadMarks, child: Text('Upload Marks')),
          ],
        ),
      ),
    );
  }
}