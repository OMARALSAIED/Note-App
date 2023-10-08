import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSerchIcon extends StatelessWidget {
  const CustomSerchIcon({
    super.key,
    required this.icon,
  });
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 180),
      child: Container(
        width: 50,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(57, 255, 255, 255)),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
