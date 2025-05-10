import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'chairperson_dashboard.dart';
import 'student_dashboards.dart';
import 'subject_dashboard.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    
    _fadeController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
    );

    _scaleController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );

    _fadeController.forward(); // Start fade animation
    _scaleController.forward(); // Start scaling animation
  }

  Future<void> loginUser(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();
      String role = userDoc['role'];

      if (role == 'student') {
        Navigator.push(context, MaterialPageRoute(builder: (_) => StudentDashboard()));
      } else if (role == 'chairperson') {
        Navigator.push(context, MaterialPageRoute(builder: (_) => ChairpersonDashboard()));
      } else if (role == 'staff') {
        Navigator.push(context, MaterialPageRoute(builder: (_) => SubjectDashboard()));
      }
    } catch (e) {
      print("Login error: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login failed. Check credentials.")));
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left Login Panel
          Expanded(
            child: Container(
              color: Colors.black87,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Login",
                        style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text("Enter your account details",
                        style: TextStyle(color: Colors.grey[400], fontSize: 16)),
                    SizedBox(height: 40),
                    TextField(
                      controller: emailController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "EMAIL",
                        labelStyle: TextStyle(color: Colors.grey[300]),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: passwordController,
                      obscureText: _obscurePassword,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.grey[300]),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {}, // implement forgot password logic if needed
                      child: Text("Forgot Password?", style: TextStyle(color: Colors.grey[300])),
                    ),
                    SizedBox(height: 30),
                    ScaleTransition(
                      scale: _scaleAnimation,
                      child: ElevatedButton(
                        onPressed: () => loginUser(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent,
                          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: Text("Login", style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?", style: TextStyle(color: Colors.grey[300])),
                        SizedBox(width: 8),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpPage()));
                          },
                          child: Text("Sign up", style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Right Illustration Panel
          Expanded(
            child: Container(
              color: Color(0xFFB17BFF), // Purple theme background
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome to", style: TextStyle(fontSize: 30, color: Colors.white)),
                    Text("student portal",
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    SizedBox(height: 10),
                    Text("Login to access your account", style: TextStyle(color: Colors.white70)),
                    SizedBox(height: 40),
                    Image.asset(
                      'assets/login.jpg', // Add your custom image here
                      height: 250,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
