import 'package:flutter/material.dart';
import 'package:orlogo/screens/wallet_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF7F8),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Өглөөний мэнд? Н.Даваа',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            Icon(Icons.notifications, color: Colors.white),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Нийт үлдэгдлийн хэсэг
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                children: [
                  Text(
                    'Нийт үлдэгдэл',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '\$2,548.00',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Орлого: \$1,840.00',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      Text(
                        'Зарлага: \$284.00',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Гүйлгээний түүх
            const Text(
              'Гүйлгээний Түүх',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 10),
            _buildTransactionItem(
              title: 'Upwork',
              subtitle: 'Өчигдөр',
              amount: '+ \$850.00',
              isIncome: true,
              icon: Icons.work,
            ),
            _buildTransactionItem(
              title: 'Шилжүүлэг',
              subtitle: 'Өчигдөр',
              amount: '- \$85.00',
              isIncome: false,
              icon: Icons.send,
            ),
            _buildTransactionItem(
              title: 'Paypal',
              subtitle: 'Jan 30, 2022',
              amount: '+ \$1,406.00',
              isIncome: true,
              icon: Icons.payment,
            ),
            _buildTransactionItem(
              title: 'Youtube',
              subtitle: 'Jan 16, 2022',
              amount: '- \$11.99',
              isIncome: false,
              icon: Icons.video_library,
            ),
            const SizedBox(height: 20),
            // Send Again хэсэг
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Send Again',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(color: Colors.teal, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildUserAvatar('orlogo.jpg'),
                _buildUserAvatar('orlogo.jpg'),
                _buildUserAvatar('orlogo.jpg'),
                _buildUserAvatar('orlogo.jpg'),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new transaction logic
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home, color: Colors.teal),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashboardPage(),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.bar_chart, color: Colors.teal),
              onPressed: () {},
            ),
            const SizedBox(width: 50),
            IconButton(
              icon: const Icon(Icons.wallet, color: Colors.teal),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WalletScreen(),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.person, color: Colors.teal),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionItem({
    required String title,
    required String subtitle,
    required String amount,
    required bool isIncome,
    required IconData icon,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.teal.shade100,
        child: Icon(icon, color: Colors.teal),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Text(
        amount,
        style: TextStyle(
          color: isIncome ? Colors.green : Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildUserAvatar(String assetPath) {
    return CircleAvatar(
      radius: 24,
      backgroundImage: AssetImage(assetPath),
    );
  }
}
