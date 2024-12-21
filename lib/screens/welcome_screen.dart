import 'package:flutter/material.dart';
import 'package:orlogo/screens/login.dart';
import 'package:orlogo/screens/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF7F8),
      body: Column(
        children: [
          const Spacer(),
          SizedBox(
            height: 300,
            child: Image.asset('welcome.png'),
          ),
          const SizedBox(height: 20),
          Text(
            'Ухаалаг Зарцуулж\nИлүү Хэмнэе',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.teal[800],
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 40,
              ),
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Эхлэх',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Хэрэглэгчийн Эрх Бий Юу?',
                  style: TextStyle(
                    color: Colors.teal[800],
                    fontSize: 14,
                  ),
                ),
              ),
              const Text('|'),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Нэвтрэх',
                  style: TextStyle(
                    color: Colors.teal[800],
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
