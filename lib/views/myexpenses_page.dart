import 'package:expense_tracker/components/expense_card.dart';
import 'package:flutter/material.dart';

import '../components/button.dart';

class MyExpensesPage extends StatefulWidget {
  const MyExpensesPage({super.key});

  @override
  State<MyExpensesPage> createState() => _MyExpensesPageState();
}

class _MyExpensesPageState extends State<MyExpensesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Column(
          children: [

            const SizedBox(height: 45.0,),

            Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Row(
                  children: [

                    // back button
                    CustomIconButton(
                      icon: const Icon(Icons.arrow_back), 
                      callbackFunction: (){
                        Navigator.pop(context);
                      },
                    ),

                    const Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: Text(
                        "My Expenses",
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 25.0,),

            Column(
              children: const [

                ExpenseCard(
                  date: "2022-01-21",
                  amount: "100.00",
                  description: "This is the description. It can be long as possible as what size you want.",
                ),

                ExpenseCard(
                  date: "2022-01-21",
                  amount: "100.00",
                  description: "This is the description. It can be long as possible as what size you want.",
                ),

                ExpenseCard(
                  date: "2022-01-21",
                  amount: "100.00",
                  description: "This is the description. It can be long as possible as what size you want.",
                ),

              ],
            ),

            
          ],
        )
      ),
    );
  }
}