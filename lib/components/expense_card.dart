import 'package:expense_tracker/utils/utils.dart';
import 'package:flutter/material.dart';

expenseCard(String time, String amount, String desc){
  return Container(
    margin: const EdgeInsets.only(bottom: 10.0),
    width: double.infinity,
    decoration: const BoxDecoration(
      color: Colors.black12,
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            time,
            style: const TextStyle(
              color: Colors.black54
            ),
            ),

          10.0.spaceY,

          Text(
            'Rs. $amount',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.red[600]

            )
          ),

          10.0.spaceY,

          Text(
            desc,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87

            ),
          ),
        ],
      ),
    ),
  );
}