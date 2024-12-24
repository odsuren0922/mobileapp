import 'package:flutter/material.dart';
import 'package:orlogo/screens/addexpensescreen.dart';

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

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Түрийвч цэнэглэх'),
          centerTitle: true,
          leading: const Icon(Icons.arrow_back),
          actions: const [
            Icon(Icons.more_vert),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.teal,
            labelColor: Colors.teal,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "Картууд"),
              Tab(text: "Аккаунт"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CardsTab(),
            AccountTab(),
          ],
        ),
      ),
    );
  }
}

class CardsTab extends StatelessWidget {
  const CardsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Дебит картын загвар
            Card(
              margin: const EdgeInsets.only(bottom: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Debit Card',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(
                        '6219 8610 2888 8075',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'IRVAN MOSES',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            '22/01',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Карт нэмэх форм
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Картны мэдээлэл нэмэх',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Энд холбоо карт нь зөвхөн таны нэр дээр байх ёстой.',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                _buildTextField('КАРТ ДЭЭРХ НЭР', 'Davaasuren Nyamjav'),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField('КАРТЫН ДУГААР', ''),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField('CVC', ''),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField('ДУУСАХ ХУГАЦАА YYYY/MM', ''),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField('ZIP', ''),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String placeholder) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: placeholder,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

class AccountTab extends StatefulWidget {
  const AccountTab({super.key});

  @override
  State<AccountTab> createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  final List<Map<String, dynamic>> accounts = [
    {
      'icon': Icons.link,
      'title': 'Bank Link',
      'subtitle': 'Connect your bank account to deposit & fund',
      'isSelected': false,
    },
    {
      'icon': Icons.account_balance_wallet_outlined,
      'title': 'Microdeposits',
      'subtitle': 'Connect bank in 5-7 days',
      'isSelected': false,
    },
    {
      'icon': Icons.attach_money, // Paypal icon орлуулав
      'title': 'Paypal',
      'subtitle': 'Connect your PayPal account',
      'isSelected': false,
    },
  ];

  void _toggleSelection(int index) {
    setState(() {
      accounts[index]['isSelected'] = !accounts[index]['isSelected'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: accounts.length,
            itemBuilder: (context, index) {
              final account = accounts[index];
              return Column(
                children: [
                  OptionButton(
                    icon: account['icon'],
                    title: account['title'],
                    subtitle: account['subtitle'],
                    isSelected: account['isSelected'],
                    onTap: () => _toggleSelection(index),
                  ),
                  const SizedBox(height: 16),
                ],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddExpenseScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text("Дараах"),
          ),
        ),
      ],
    );
  }
}

class OptionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const OptionButton({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.teal.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.teal : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: ListTile(
          leading: Icon(icon, color: isSelected ? Colors.teal : Colors.grey),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.teal : Colors.black87,
            ),
          ),
          subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
          trailing: isSelected
              ? const Icon(Icons.check_circle, color: Colors.teal)
              : null,
        ),
      ),
    );
  }
}
