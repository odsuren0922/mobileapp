import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveTransaction({
    required String type, // "income" эсвэл "expense"
    required double amount,
    required String cardNumber,
    required DateTime date,
  }) async {
    try {
      await _firestore.collection('transactions').add({
        'type': type,
        'amount': amount,
        'cardNumber': cardNumber,
        'date': date.toIso8601String(),
      });
      print("Transaction saved successfully!");
    } catch (e) {
      print("Error saving transaction: $e");
    }
  }
}
