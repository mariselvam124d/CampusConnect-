import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import'screens/home_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAggyKDXmxXbzPb1mjq221zBJWPlSE4S44", // Replace with your API key
      appId: "1:871693246360:android:7f983988719241f63695ed", // Replace with your app ID
      messagingSenderId: "871693246360", // Replace with your messaging sender ID
      projectId: "od-application12", // Replace with your project ID
      storageBucket: "od-application12.firebasestorage.app", // Replace with your storage bucket
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OD Form App',
      home: HomeScreen(),
    );
  }
}