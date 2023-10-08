import 'package:flutter/material.dart';

class TextButtomSheet extends StatelessWidget {
  final String hint;
  final int maxline;
  const TextButtomSheet({super.key, required this.hint, this.maxline = 1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        maxLines: maxline,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 17,
            color: Color(0xff62FCD7),
          ),
          enabledBorder: Outline(),
          focusedBorder: Outline(Color(0xff62FCD7)),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder Outline([Color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Color ?? Colors.white, width: 0.8));
  }
}
