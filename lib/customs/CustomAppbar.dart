import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coustomserchicon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.icon,
  });
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        CustomSerchIcon(
          
          icon: icon,
        )
      ],
    );
  }
}
