import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class studentmarks extends StatefulWidget {
  @override
  studentmark createState() => studentmark();
}

class studentmark extends State<studentmarks> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  bool _isLoading = true;
  Map<String, dynamic>? mark1Data;
  Map<String, dynamic>? mark2Data;
  Map<String, dynamic>? userData;
  String? photoUrl;

  @override
  void initState() {
    super.initState();
    fetchStudentData();
  }

  Future<void> fetchStudentData() async {
    final userDoc = await FirebaseFirestore.instance.collection('users').doc(currentUser.uid).get();
    userData = userDoc.data() as Map<String, dynamic>;

    final mark1Doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .collection('marks')
        .doc('mark1')
        .get();

    final mark2Doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .collection('marks')
        .doc('mark2')
        .get();

    setState(() {
      mark1Data = mark1Doc.data();
      mark2Data = mark2Doc.data();
      photoUrl = userData?['photoUrl'];
      _isLoading = false;
    });
  }

  Widget buildHeaderCard() {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple, Colors.indigo],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black26)],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 45,
            backgroundImage: photoUrl != null
                ? NetworkImage(photoUrl!)
                : AssetImage('assets/default_avatar.png') as ImageProvider,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userData?['name'] ?? 'Student Name',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("📘 Class: ${userData?['class'] ?? 'N/A'}",
                    style: TextStyle(color: Colors.white70)),
                Text("🎓 Roll No: ${userData?['rollNo'] ?? 'N/A'}",
                    style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMarkCard(String title, Map<String, dynamic> marks, Color color) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      margin: EdgeInsets.symmetric(vertical: 12),
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.2), color.withOpacity(0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: color, width: 1.2),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: color.withOpacity(0.2), blurRadius: 12, offset: Offset(0, 6)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color)),
          ),
          Divider(color: color.withOpacity(0.5)),
          buildRow("🧮 Maths", marks['maths']),
          buildRow("🧪 Science", marks['science']),
          buildRow("🌍 Social", marks['social']),
          buildRow("💻 Computer", marks['cs']),
        ],
      ),
    );
  }

  Widget buildRow(String subject, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(subject, style: TextStyle(fontSize: 16)),
          Text(value?.toString() ?? "-", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }

  Widget buildQuoteCard() {
    return Container(
      margin: EdgeInsets.only(top: 24),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.deepPurple.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        "“Success is the sum of small efforts repeated day in and day out.”",
        textAlign: TextAlign.center,
        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14, color: Colors.black87),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Student Bio"),
        backgroundColor: Colors.deepPurple,
        elevation: 4,
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 700),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                key: ValueKey("loaded"),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    buildHeaderCard(),
                    if (mark1Data != null)
                      buildMarkCard("📘 MARK 1", mark1Data!, Colors.blue),
                    if (mark2Data != null)
                      buildMarkCard("📗 MARK 2", mark2Data!, Colors.green),
                    buildQuoteCard(),
                  ],
                ),
              ),
      ),
    );
  }
}
