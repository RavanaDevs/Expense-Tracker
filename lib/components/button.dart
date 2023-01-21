import 'dart:ffi';

import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final String btnText;
  final Function()? callbackFunction;

  const Button({super.key, required this.btnText, required this.callbackFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: callbackFunction,
          child:  Container(
            padding:  const EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10.0)
            ),
            
            child: Text(
              btnText,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            
          ),
    );
  }
}

class ImageButton extends StatelessWidget {

  final Function()? callbackFunction;
  final String imagePath;
  final double width;
  final double height;


  const ImageButton({
    super.key, 
    required this.imagePath, 
    required this.width, 
    required this.height,
    required this.callbackFunction
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callbackFunction,
      child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image.asset(imagePath),
              width: width,
              height: height,
            ),
    );
  }
}


class CustomIconButton extends StatelessWidget {

  final Icon icon;
  final double iconPadding;
  final double width;
  final double height;
  final Function()? callbackFunction;

  const CustomIconButton({
    super.key,
    required this.icon,
    this.iconPadding = 10,
    this.width = 50,
    this.height = 50,
    this.callbackFunction,
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callbackFunction,
      child: Container(
              padding: EdgeInsets.all(iconPadding),
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.black38),
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white54
              ),
              width: width,
              height: height,
              child: icon,
            ),
    );
  }
}