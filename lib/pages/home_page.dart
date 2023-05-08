import 'package:expense_tracker/components/button.dart';
import 'package:expense_tracker/components/text_field.dart';
import 'package:expense_tracker/data/database_helper.dart';
import 'package:expense_tracker/utils/auth_helper.dart';
import 'package:expense_tracker/utils/utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  addExpense(){
    DataRepository().getExpensesList('1').then((value) {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(onPressed: (){AuthHelper().signOut();}, icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Column(
          children: [
            15.0.spaceY,
            const Text('Add Expence'),
            20.0.spaceY,
            textField(hintText: 'Description'),
            10.0.spaceY,
            textField(hintText: 'Amount'),
            10.0.spaceY,
            primaryButton(text: 'Add', onTap: addExpense)

          ],
        ),
      )
    );
  }
}