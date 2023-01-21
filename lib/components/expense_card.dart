import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {

  final String date;
  final String amount;
  final String description;

  const ExpenseCard({
    super.key,
    required this.date,
    required this.amount,
    required this.description,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),

          child: Container(
            decoration:BoxDecoration(
              border: Border.all(width: 3.0, color: Colors.black38),
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white60,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            width: double.infinity,
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 10.0,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 8.0,),

                Text(
                  "Rs. $amount",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[600],
                  ),
                ),

                const SizedBox(height: 8.0,),

                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),

              ],
            ),
          ),
        );
  }
}