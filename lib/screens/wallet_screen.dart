import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WalletScreen(),
    );
  }
}

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int _selectedIndex = 2; // Wallet табыг анх сонгосон болгоно
  bool _isTransactionsSelected = true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Сонгосон табын дагуу хуудас солих
    if (_selectedIndex == 0) {
      // Home руу шилжих
    } else if (_selectedIndex == 1) {
      // Result руу шилжих
    } else if (_selectedIndex == 3) {
      // Profile руу шилжих
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: const Text(
          'Түрийвч',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Үлдэгдэл хэсэг
          Container(
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Нийт үлдэгдэл',
                  style: TextStyle(color: Colors.black87, fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  '\$2,548.00',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ActionButton(
                      icon: Icons.add,
                      label: 'Нэмэх',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddFundsPage(),
                          ),
                        );
                      },
                    ),
                    ActionButton(
                      icon: Icons.payment,
                      label: 'Төлөх',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PayPage(),
                          ),
                        );
                      },
                    ),
                    ActionButton(
                      icon: Icons.send,
                      label: 'Илгээх',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SendPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          // Гүйлгээний болон Хүлээгдэж буй гүйлгээ хэсэг
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF7F7F7),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  // Tab хэсэг
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TabButton(
                        label: 'Гүйлгээнүүд',
                        isSelected: _isTransactionsSelected,
                        onTap: () {
                          setState(() {
                            _isTransactionsSelected = true;
                          });
                        },
                      ),
                      TabButton(
                        label: 'Хүлээгдэж буй гүйлгээ',
                        isSelected: !_isTransactionsSelected,
                        onTap: () {
                          setState(() {
                            _isTransactionsSelected = false;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      children: _isTransactionsSelected
                          ? [
                              TransactionButton(
                                label: 'Upwork',
                                date: 'Today',
                                amount: '+ \$850.00',
                                amountColor: Colors.green,
                                onPressed: () {
                                  // Гүйлгээний дэлгэрэнгүй рүү шилжих
                                },
                              ),
                              TransactionButton(
                                label: 'Transfer',
                                date: 'Yesterday',
                                amount: '- \$85.00',
                                amountColor: Colors.red,
                                onPressed: () {
                                  // Гүйлгээний дэлгэрэнгүй рүү шилжих
                                },
                              ),
                            ]
                          : [
                              TransactionButton(
                                label: 'Pending Payment',
                                date: 'Today',
                                amount: '- \$50.00',
                                amountColor: Colors.orange,
                                onPressed: () {
                                  // Хүлээгдэж буй гүйлгээний дэлгэрэнгүй
                                },
                              ),
                            ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Result',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const ActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: CircleAvatar(
            radius: 28,
            backgroundColor: Colors.teal,
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class TabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const TabButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? Colors.black : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class TransactionButton extends StatelessWidget {
  final String label;
  final String date;
  final String amount;
  final Color amountColor;
  final VoidCallback onPressed;

  const TransactionButton({
    super.key,
    required this.label,
    required this.date,
    required this.amount,
    required this.amountColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        backgroundColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(Icons.attach_money, color: amountColor, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  date,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              color: amountColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// Нэмэх хуудас
class AddFundsPage extends StatelessWidget {
  const AddFundsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Турийч цэнэглэх"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Back action
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Notification action
            },
          ),
        ],
        backgroundColor: const Color(0xFF00796B),
      ),
      body: const Column(
        children: [
          // Tab Section
          TabSection(),
          // Card Details
          CardDetails(),
          // Add Card Form
          Expanded(child: AddCardForm()),
        ],
      ),
    );
  }
}

class TabSection extends StatelessWidget {
  const TabSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const DefaultTabController(
        length: 2,
        child: TabBar(
          indicatorColor: Color(0xFF00796B),
          labelColor: Color(0xFF00796B),
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(text: "Картууд"),
            Tab(text: "Аккаунт"),
          ],
        ),
      ),
    );
  }
}

class CardDetails extends StatelessWidget {
  const CardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: const Color(0xFF80CBC4),
        elevation: 4,
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Debit Card",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                "6219 8610 2888 8075",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "IRVAN MOSES",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "22/01",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddCardForm extends StatelessWidget {
  const AddCardForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Картны мэдээлэл нэмэх",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00796B),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Энэ холбоос карт нь зөвхөн таны нэр дээр байх ёстой.",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: "КАРТ ДЭЭРХ НЭР",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: "КАРТЫН ДУГААР",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "CVC",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "ДУУСАХ ХУГАЦАА YYYY/MM",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: "ZIP",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Төлөх хуудас
class PayPage extends StatelessWidget {
  const PayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Төлөх'),
        backgroundColor: Colors.teal,
      ),
      body: const Center(child: Text('Төлөх хуудас')),
    );
  }
}

// Илгээх хуудас
class SendPage extends StatelessWidget {
  const SendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Илгээх'),
        backgroundColor: Colors.teal,
      ),
      body: const Center(child: Text('Илгээх хуудас')),
    );
  }
}
