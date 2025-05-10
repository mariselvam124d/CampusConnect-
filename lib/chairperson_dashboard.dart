import 'package:flutter/material.dart';
import 'sidebar.dart';
import 'e1_od_forms.dart';
import 'upload_marks.dart';

class ChairpersonDashboard extends StatefulWidget {
  @override
  _ChairpersonDashboardState createState() => _ChairpersonDashboardState();
}

class _ChairpersonDashboardState extends State<ChairpersonDashboard> with SingleTickerProviderStateMixin {
  int selectedScreen = 1;
  final String studentName = "John Doe";
  final String studentPhotoUrl = "https://via.placeholder.com/150";

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  Widget buildInfoCard({required IconData icon, required String title, required String subtitle, required Function onTap}) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: Colors.indigo.shade100, child: Icon(icon, color: Colors.indigo)),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () => onTap(), // Call onTap function to handle navigation
      ),
    );
  }

  Widget buildPlaceholder(String label) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 24),
        children: [
          buildInfoCard(icon: Icons.info, title: '$label Reports', subtitle: 'View submitted $label reports', onTap: () {}),
          buildInfoCard(icon: Icons.analytics, title: '$label Analysis', subtitle: 'View trends and insights', onTap: () {}),
          buildInfoCard(icon: Icons.settings, title: 'Settings', subtitle: 'Configure $label options', onTap: () {}),
        ],
      ),
    );
  }

  Widget buildUploadMarksForm() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          children: [
            Text('Upload Marks', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Enter Student ID', border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Enter Marks', border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle the upload action
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Marks Uploaded')));
              },
              child: Text('Upload Marks'),
            ),
          ],
        ),
      ),
    );
  }

  Widget getSelectedScreen() {
    _controller.reset();
    _controller.forward();

    switch (selectedScreen) {
      case 1:
        return FadeTransition(opacity: _fadeAnimation, child: const ODFormsPage());
      case 2:
        return buildUploadMarksForm();
      case 3:
        return buildPlaceholder('Leave Applications');
      case 4:
        return buildPlaceholder('Department Summary');
      default:
        return const ODFormsPage();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text('Chairperson Dashboard'),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        ],
      ),
      drawer: AppDrawer(
        studentName: studentName,
        studentPhotoUrl: studentPhotoUrl,
        onSelect: (index) {
          setState(() {
            selectedScreen = index;
            Navigator.pop(context);
          });
        },
      ),
      body: getSelectedScreen(),
    );
  }
}
