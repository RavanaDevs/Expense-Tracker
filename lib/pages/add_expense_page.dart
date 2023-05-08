import 'package:expense_tracker/components/button.dart';
import 'package:expense_tracker/components/text_field.dart';
import 'package:expense_tracker/data/database_helper.dart';
import 'package:expense_tracker/data/models/expense.dart';
import 'package:expense_tracker/utils/auth_helper.dart';
import 'package:expense_tracker/utils/utils.dart';
import 'package:flutter/material.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {

  final descriptionController = TextEditingController();
  final amountController = TextEditingController();

  addExpense(){
    final uid = AuthHelper().user.uid;
    final amount = amountController.text;
    final desc = descriptionController.text;
    final time = DateTime.now();

    final expense = Expense(description: desc, amount: double.parse(amount), userId: uid, time: time);
    DataRepository().addExpense(expense).then((value){
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
      ),
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Column(
          children: [
            15.0.spaceY,
            const Text('Add Expence'),
            20.0.spaceY,
            textField(hintText: 'Description', controller: descriptionController),
            10.0.spaceY,
            textField(hintText: 'Amount', controller: amountController, keyboardType: TextInputType.number),
            10.0.spaceY,
            primaryButton(text: 'Add', onTap: addExpense)

          ],
        ),
      )
    );
  }
}