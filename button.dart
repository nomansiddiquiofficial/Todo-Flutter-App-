import "package:flutter/material.dart";

class Button extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  Button({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 90,
      color: Theme.of(context).primaryColor,
      child: ElevatedButton(
        child: Text(text),
        onPressed: onTap,
      ),
    );
  }
}
