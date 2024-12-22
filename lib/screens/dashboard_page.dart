import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:orlogo/screens/wallet_screen.dart';

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
      home: DashboardPage(),
    );
  }
}

class Transaction {
  final String title;
  final String subtitle;
  final String amount;
  final bool isIncome;
  final String date;

  Transaction({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.isIncome,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'amount': amount,
      'isIncome': isIncome,
      'date': date,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      title: map['title'],
      subtitle: map['subtitle'],
      amount: map['amount'],
      isIncome: map['isIncome'],
      date: map['date'],
    );
  }
}

Future<void> addTransaction(Transaction transaction) async {
  final transactionRef =
      FirebaseFirestore.instance.collection('transactions').doc();
  await transactionRef.set(transaction.toMap());
}

Stream<List<Transaction>> getTransactions() {
  return FirebaseFirestore.instance
      .collection('transactions')
      .orderBy('date', descending: true)
      .snapshots()
      .map((snapshot) {
    return snapshot.docs.map((doc) {
      return Transaction.fromMap(doc.data());
    }).toList();
  });
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
            // Нийт үлдэгдэл хэсэг
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
            StreamBuilder<List<Transaction>>(
              stream: getTransactions(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Алдаа: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('Гүйлгээ байхгүй.'));
                }

                final transactions = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];
                    return _buildTransactionItem(
                      title: transaction.title,
                      subtitle: transaction.subtitle,
                      amount: transaction.amount,
                      isIncome: transaction.isIncome,
                      icon: Icons.payment, // Хэрэглэх тохиромжтой icon
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Жишээ: Шинэ орлого эсвэл зарлага нэмэх
          addTransaction(Transaction(
            title: 'Шинэ орлого',
            subtitle: 'Өнөөдөр',
            amount: '+ \$100.00',
            isIncome: true,
            date: DateTime.now().toString(),
          ));
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white),
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
}
