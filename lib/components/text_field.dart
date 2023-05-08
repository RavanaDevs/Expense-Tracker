import 'package:flutter/material.dart';

TextField textField({hintText = String, password = false, controller, keyboardType = TextInputType.name}){
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black54, width: 2), 
        borderRadius: BorderRadius.circular(10.0)
      )
    ),
    obscureText: password,
    keyboardType: keyboardType,
  );
}