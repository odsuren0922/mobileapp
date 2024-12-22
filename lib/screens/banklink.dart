import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BankLinkScreen(),
    );
  }
}

class BankLinkScreen extends StatelessWidget {
  const BankLinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: const Text(
          'Түрийвчтэй холбох',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.teal.shade50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            ToggleButtons(
              isSelected: const [true, false],
              borderRadius: BorderRadius.circular(8),
              fillColor: Colors.teal,
              selectedColor: Colors.white,
              color: Colors.teal,
              constraints: const BoxConstraints.expand(width: 120, height: 40),
              children: const [
                Text('Картууд'),
                Text('Аккаунт'),
              ],
              onPressed: (int index) {},
            ),
            const SizedBox(height: 20),
            _buildOptionTile(
              context,
              icon: Icons.account_balance,
              title: 'Bank Link',
              subtitle: 'Connect your bank account to deposit & fund',
              isSelected: true,
            ),
            _buildOptionTile(
              context,
              icon: Icons.monetization_on_outlined,
              title: 'Microdeposits',
              subtitle: 'Connect bank in 5-7 days',
              isSelected: false,
            ),
            _buildOptionTile(
              context,
              icon: Icons.payment,
              title: 'Paypal',
              subtitle: 'Connect your paypal account',
              isSelected: false,
            ),
            const Spacer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {},
                child: const Text(
                  'ДАРААХ',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionTile(BuildContext context,
      {required IconData icon,
      required String title,
      required String subtitle,
      required bool isSelected}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.teal.shade100 : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.teal, width: isSelected ? 2 : 1),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: isSelected
            ? const Icon(Icons.check_circle, color: Colors.teal)
            : null,
      ),
    );
  }
}
