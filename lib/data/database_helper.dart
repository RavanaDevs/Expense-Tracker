import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/data/models/expense.dart';

class DataRepository{
  final db = FirebaseFirestore.instance;

  Future<Expense?> getExpense(String id) async{
    
    final ref = db.collection('dogs').doc(id);
    final snapshot = await ref.get();

    if(snapshot.exists){
      final dog = Expense.fromMap(snapshot);
      return dog;
    }

    return null;
  }
}