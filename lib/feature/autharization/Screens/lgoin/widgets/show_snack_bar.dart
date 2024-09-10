 import 'package:flutter/material.dart';

void showSnackBars(BuildContext context, Widget message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: message,
      backgroundColor: color,
      duration: const Duration(seconds: 3),
      
    ));
  }