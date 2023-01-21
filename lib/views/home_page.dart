import 'package:expense_tracker/components/button.dart';
import 'package:expense_tracker/components/input_field.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                
                 const SizedBox(height: 45.0,),

                  const Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54
                    ),
                  ),

                 const SizedBox(height: 15.0,),

                 const Text(
                    "Track your expenses easily with us.",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.blue
                    ),
                  ),

                  const SizedBox(height: 60.0,),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: InputField(
                      hintText: "Amount",
                      inputType: TextInputType.number,
                      ),
                  ),

                  const SizedBox(height: 25.0,),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: InputField(
                      hintText: "Description",
                      inputType: TextInputType.multiline,
                      ),
                  ),

                  const SizedBox(height: 25.0,),

                  Button(btnText: "Add", callbackFunction: (){}),

                  const SizedBox(height: 95.0,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // to expenses
                        CustomIconButton(
                          icon: const Icon(Icons.bar_chart_outlined, size: 50.0,),
                          width: 80.0,
                          height: 80.0,
                          callbackFunction: (){
                            Navigator.pushNamed(context, '/expenses');
                          },
                        ),

                        // to settings
                        CustomIconButton(
                          icon: const Icon(Icons.supervised_user_circle, size: 50.0,),
                          width: 80.0,
                          height: 80.0,
                          callbackFunction: (){
                            Navigator.pushNamed(context, '/profile');
                          },
                        ),
                      ],
                    ),
                  ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}