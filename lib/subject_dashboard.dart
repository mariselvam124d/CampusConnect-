import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:lottie/lottie.dart';

class SubjectDashboard extends StatefulWidget {
  @override
  _SubjectDashboardState createState() => _SubjectDashboardState();
}

class _SubjectDashboardState extends State<SubjectDashboard> {
  List<Map<String, dynamic>> dataList = [];

  Future<void> _downloadAsTxt(List<Map<String, dynamic>> data) async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final directory = await getExternalStorageDirectory();
      final path = '${directory!.path}/subject_od_data.txt';
      final file = File(path);

      final content = data.map((item) =>
          "Student ID: ${item['studentId']}\nEvent: ${item['eventName']}\nDate: ${item['date']}\n\n").join();

      await file.writeAsString(content);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Data downloaded to: $path")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Storage permission denied")),
      );
    }
  }

  Widget buildTable() {
    return DataTable(
      columnSpacing: 20,
      headingRowColor: MaterialStateColor.resolveWith((states) => Colors.indigo.shade100),
      columns: const [
        DataColumn(label: Text("Studentname&rollno", style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text("Event Name", style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text("Date", style: TextStyle(fontWeight: FontWeight.bold))),
      ],
      rows: dataList.map((data) {
        return DataRow(cells: [
          DataCell(Text(data['studentId'].toString())),
          DataCell(Text(data['eventName'])),
          DataCell(Text(data['date'])),
        ]);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE8F0FE), Color(0xFFD1D9FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.indigo,
              elevation: 4,
              title: const Text('Subject Incharge Dashboard'),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.account_circle_rounded, size: 28),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              color: Colors.indigo.shade50,
              child: Row(
                children: [
                  Icon(Icons.dashboard_customize, size: 32, color: Colors.indigo),
                  const SizedBox(width: 10),
                  const Text(
                    "Subject OD Records",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.indigo),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('subject_od').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Lottie.asset('assets/animations/loading.gif', width: 120),
                    );
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(child: Text("No records found", style: TextStyle(fontSize: 18)));
                  }

                  dataList = snapshot.data!.docs.map((doc) {
                    var data = doc.data() as Map<String, dynamic>;
                    return {
                      'studentId': data['studentId'],
                      'eventName': data['eventName'],
                      'date': data['date'],
                    };
                  }).toList();

                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total Records: ${dataList.length}",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87)),
                        const SizedBox(height: 10),
                        Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: buildTable(),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton.icon(
                onPressed: () => _downloadAsTxt(dataList),
                icon: Icon(Icons.download, size: 22),
                label: Text("Download as TXT", style: TextStyle(fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
