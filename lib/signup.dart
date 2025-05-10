import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'login.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final regNoController = TextEditingController();
  final departmentController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final dobController = TextEditingController();
  final bloodGroupController = TextEditingController();
  final guardianController = TextEditingController();
  final guardianPhoneController = TextEditingController();
  final hobbyController = TextEditingController();
  final skillsController = TextEditingController();
  String role = 'student';
  File? _image;

  Future pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _image = File(pickedFile.path));
    }
  }

  Future<void> signUpUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      String photoUrl = '';
      if (_image != null) {
        final ref = FirebaseStorage.instance
            .ref()
            .child('profile_images')
            .child('${userCredential.user!.uid}.jpg');

        await ref.putFile(_image!);
        photoUrl = await ref.getDownloadURL();
      }

      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'email': emailController.text.trim(),
        'role': role,
        'name': nameController.text.trim(),
        'regNo': regNoController.text.trim(),
        'department': departmentController.text.trim(),
        'phone': phoneController.text.trim(),
        'address': addressController.text.trim(),
        'dob': dobController.text.trim(),
        'bloodGroup': bloodGroupController.text.trim(),
        'guardian': guardianController.text.trim(),
        'guardianPhone': guardianPhoneController.text.trim(),
        'hobby': hobbyController.text.trim(),
        'skills': skillsController.text.trim(),
        'photoUrl': photoUrl,
      });

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginPage()));
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Signup failed!")));
    }
  }

  Widget buildTextField(TextEditingController controller, String label, IconData icon,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: label,
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: pickImage,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        if (_image != null)
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: _image != null ? FileImage(_image!) : null,
                      backgroundColor: Colors.grey.shade300,
                      child: _image == null
                          ? Icon(Icons.add_a_photo, size: 40, color: Colors.white70)
                          : null,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                buildTextField(nameController, 'Name', Icons.person),
                buildTextField(regNoController, 'Register Number', Icons.confirmation_number),
                buildTextField(departmentController, 'Department', Icons.school),
                buildTextField(phoneController, 'Phone', Icons.phone),
                buildTextField(addressController, 'Address', Icons.home),
                buildTextField(dobController, 'Date of Birth', Icons.calendar_today),
                buildTextField(bloodGroupController, 'Blood Group', Icons.opacity),
                buildTextField(guardianController, 'Guardian Name', Icons.person_outline),
                buildTextField(guardianPhoneController, 'Guardian Phone', Icons.call),
                buildTextField(hobbyController, 'Hobby', Icons.interests),
                buildTextField(skillsController, 'Skills', Icons.star),
                buildTextField(emailController, 'Email', Icons.email),
                buildTextField(passwordController, 'Password', Icons.lock, isPassword: true),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: role,
                  items: ['student', 'staff', 'chairperson']
                      .map((r) => DropdownMenuItem(value: r, child: Text(r)))
                      .toList(),
                  onChanged: (val) => setState(() => role = val!),
                  decoration: InputDecoration(
                    labelText: 'Select Role',
                    prefixIcon: Icon(Icons.person_pin),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: signUpUser,
                  icon: Icon(Icons.app_registration),
                  label: Text('Sign Up', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
