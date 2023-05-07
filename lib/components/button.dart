import 'package:flutter/material.dart';

ElevatedButton primaryButton({text = String, onTap = Function}){
  return ElevatedButton(
    onPressed: ()=>onTap(), 
    child: Text(text),
  );
}