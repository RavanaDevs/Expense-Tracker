import 'package:cloud_firestore/cloud_firestore.dart';

class Expense{

  String? userId;
  String description;
  double amount;
  DateTime? time;

  Expense({
    required this.description,
    required this.amount,
    this.time,
    this.userId
  });

  Map<String, dynamic> toMap(){
    return {
      'user_id': userId,
      'description': description,
      'amount': amount,
      'time': time
    };
  }

  factory Expense.fromMap(DocumentSnapshot doc){
    final data = doc.data() as Map<String, dynamic>;
    return Expense(
      userId: data['user_id'],
      description: data['description'],
      amount: data['amount'],
      time: data['time']
    );
  }

}