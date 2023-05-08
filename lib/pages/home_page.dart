import 'package:expense_tracker/components/expense_card.dart';
import 'package:expense_tracker/data/database_helper.dart';
import 'package:expense_tracker/utils/auth_helper.dart';
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
        child: FutureBuilder(
          future: DataRepository().getExpensesList('1'),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              final data = snapshot.data;
              return ListView.builder(
                itemCount: data!.length,
                itemBuilder:(context, index) {
                  return expenseCard(data[index].time.toString(), data[index].amount.toString(), data[index].description);
                },
              );
            }else{
              return const Text('no data');
            }
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){Navigator.of(context).pushNamed('/add-expense');},
        child: const Icon(Icons.add),
      ),
    );
  }
}