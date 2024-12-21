import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/register_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/dashboard_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBESgkEquStBfTNt0lEsfelYOeJVc1Dtwc",
      authDomain: "mobile-lab-a2f0e.firebaseapp.com",
      projectId: "mobile-lab-a2f0e",
      storageBucket: "mobile-lab-a2f0e.firebasestorage.app",
      messagingSenderId: "494574958093",
      appId: "1:494574958093:web:d556fbefbf2cfbf35dc744",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
