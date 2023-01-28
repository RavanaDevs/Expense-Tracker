import 'package:flutter/material.dart';

class InputField extends StatelessWidget {

  final String? hintText;
  final bool obscuredText;
  final TextInputType? inputType;
  final TextEditingController? controller;

  const InputField({
    super.key, 
    this.hintText, 
    this.obscuredText = false, 
    this.inputType = TextInputType.name,
    this.controller
    });



  @override
  Widget build(BuildContext context) {

    return TextField(
        keyboardType: inputType,
        controller: controller,
        decoration: InputDecoration(
          
          filled: true,
          fillColor: Colors.white,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), 
            borderSide: const BorderSide(
              color: Colors.black12,
              width: 2.0,
            )
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), 
            borderSide:  const BorderSide(
              color:  Colors.black54,
              width: 2.0,
            )
          ),


          hintStyle: const TextStyle(
            color: Colors.black45,
            fontWeight: FontWeight.bold,
            fontSize: 20.0
          ),

          hintText: hintText
        ),

        obscureText: obscuredText,

        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),

    );
  }
}