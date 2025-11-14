import 'package:flutter/material.dart';

class InitialsAvatar extends StatelessWidget {
  final String text;
  final double size;
  final Color? backgroundColor;
  final Color? textColor;

  const InitialsAvatar({
    super.key,
    required this.text,
    this.size = 48,
    this.backgroundColor,
    this.textColor,
  });

  String _getInitial() {
    if (text.isEmpty) return "?";
    return text.trim()[0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundColor: backgroundColor ?? Color(0xFF457B9D),
      child: Text(
        _getInitial(),
        style: TextStyle(
          fontSize: size * 0.6,
          fontWeight: FontWeight.bold,
          color: textColor ?? Colors.white,
        ),
      ),
    );
  }
}
