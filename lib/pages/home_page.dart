import 'package:expense_tracker/components/expense_card.dart';
import 'package:expense_tracker/data/database_helper.dart';
import 'package:expense_tracker/data/models/expense.dart';
import 'package:expense_tracker/utils/auth_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Future<List<Expense>> recordsList;

  @override
  void initState(){
    super.initState();
    recordsList = DataRepository().getExpensesList(AuthHelper().user.uid);
  }

  addExpense(){
    DataRepository().getExpensesList('1').then((value) {
      print(value);
    });
  }

  Future<void> _refresh() async{
    setState(() {
      recordsList = DataRepository().getExpensesList(AuthHelper().user.uid);
    });
  }

  Widget _listView(data){
    return ListView.builder(
      itemCount: data!.length,
      itemBuilder:(context, index) {
        return expenseCard(data[index].time.toString(), data[index].amount.toString(), data[index].description);
      },
    );
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
          future: recordsList,
          builder: (context, snapshot) {

            if (snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            }

            if(snapshot.hasData){
              final data = snapshot.data;
              return RefreshIndicator(
                onRefresh: _refresh ,
                child: _listView(data),
              );

            }else{
              return RefreshIndicator(
                onRefresh: _refresh,
                child: const Center(child: Text('no data')),
              );
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