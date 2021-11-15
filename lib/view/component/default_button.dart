import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({
    required this.backgroundColor,
    required this.text,
    required this.onPressed,
  });

  final Color backgroundColor;
  final String text;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(primary: backgroundColor),
    );
  }
}
