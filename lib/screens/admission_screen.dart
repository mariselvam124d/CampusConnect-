import 'package:flutter/material.dart';

void main() {
  runApp(const CollegeAdmissionApp());
}

class CollegeAdmissionApp extends StatelessWidget {
  const CollegeAdmissionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'College of Engineering & Technology',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('COLLEGE OF ENGINEERING & TECHNOLOGY'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[800],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                children: [
                  Text(
                    '(An Autonomous Institution - Affiliate for Area University, Ottawa)',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'ACTE, New Delhi',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'kamarajengg.edu.in',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.amber,
              child: const Center(
                child: Text(
                  'AUTONOMOUS',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),

            const Divider(thickness: 2, height: 32),

            const Text(
              'Admission 2025-2026',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            // Courses Section
            const Text(
              'Courses',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Eligibility Section
            const Text(
              'Eligibility',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('• FIRST YEAR B.E / B.Tech'),
            const Text('• LATERAL ENTRY'),

            const SizedBox(height: 24),

            // Fees Details Section
            const Text(
              'Fees Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            const Text(
              'UG FIRST YEAR ACCREDITED COURSES FEE DETAILS 2025 - 2026',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Table(
              border: TableBorder.all(),
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(3),
                2: FlexColumnWidth(3),
              },
              children: [
                _tableRow(['Branch', 'Account Head', 'Management Quota / Counselling'], isHeader: true),
                _tableRow(['CSE / ECE / IT / EEE / BT', 'Tuition Fees', '87,000 / 55,000']),
                _tableRow(['', 'Caution Deposit', '5,000 / 5,000']),
                _tableRow(['', 'Institute Development Fees', '5,000 / 5,000']),
                _tableRow(['', 'Book / Uniform / Admin / Exam', '30,000 / 30,000']),
              ],
            ),

            const SizedBox(height: 32),

            // Application Form
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'B.E./B.TECH ADMISSION',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  _buildFormField('Name of the Candidate'),
                  _buildFormField('Applicant Mobile Number'),
                  _buildFormField('Student Email ID'),
                  _buildFormField('Father/Mother /Guardian Name'),
                  _buildFormField('Father/Mother/Guardian Mobile Number'),
                  _buildFormField('Father/Mother /Guardian Occupation'),
                  _buildFormField('Address'),

                  const SizedBox(height: 16),

                  const Text('Medium of Instruction'),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '– Select an option –',
                    ),
                    items: const [
                      DropdownMenuItem(value: 'English', child: Text('English')),
                      DropdownMenuItem(value: 'Hindi', child: Text('Hindi')),
                      DropdownMenuItem(value: 'Other', child: Text('Other')),
                    ],
                    onChanged: (value) {},
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle submission here
                      },
                      child: const Text('SUBMIT APPLICATION'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Table Row Builder
  static TableRow _tableRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      children: cells.map((cell) {
        return Container(
          padding: const EdgeInsets.all(8),
          color: isHeader ? Colors.grey[300] : null,
          child: Text(
            cell,
            style: TextStyle(
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        );
      }).toList(),
    );
  }

  // Form Field Builder
  Widget _buildFormField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 6),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: label,
            ),
          ),
        ],
      ),
    );
  }
}
