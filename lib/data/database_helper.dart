import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/data/models/expense.dart';

class DataRepository{
  final db = FirebaseFirestore.instance;

  Future<List<Expense>> getExpensesList(String id) async{

    List<Expense> expenseRecords = List<Expense>.empty(growable: true);
    
    final querySnapshot = await db.collection('expense_records').where('user_id', isEqualTo: '1').get();

    for (var snapshot in querySnapshot.docs){
      if (snapshot.exists){
        final data = Expense.fromMap(snapshot.data());
        expenseRecords.add(data);
      }
    }
    return expenseRecords;
  }
}