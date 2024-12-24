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
      home: PaymentSuccessScreen(),
    );
  }
}

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill Payment'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        leading: const Icon(Icons.arrow_back),
        actions: const [
          Icon(Icons.more_vert),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Center(
              child: Column(
                children: [
                  Text(
                    "Амжилттай Төлөгдлөө",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Youtube Premium",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 16),
                  Icon(
                    Icons.check_circle,
                    color: Colors.teal,
                    size: 48,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Гүйлгээний дэлгэрэнгүй",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            buildDetailRow("Төлбөрийн хэрэгсэл", "Дебит Карт"),
            buildDetailRow("Төлөв", "Хийгдсэн"),
            buildDetailRow("Цаг", "08:15 AM"),
            buildDetailRow("Огноо", "Feb 28, 2022"),
            buildDetailRow("Гүйлгээний дугаар", "209291383247..."),
            const Divider(height: 32, color: Colors.grey),
            buildDetailRow("Үнэ", "\$ 11.99"),
            buildDetailRow("Хураамж", "- \$ 1.99"),
            buildDetailRow("Нийт", "\$ 13.98", isBold: true),
            const Spacer(),
            Center(
              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    color: Colors.grey[200],
                    child: const Center(
                      child: Text(
                        "QR Code",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('!')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal.shade50,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.teal.shade300),
                      ),
                    ),
                    child: const Text(
                      "Share Receipt",
                      style: TextStyle(color: Colors.teal, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDetailRow(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
