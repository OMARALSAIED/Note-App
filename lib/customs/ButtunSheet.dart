import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonSheet extends StatelessWidget {
  const ButtonSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color(0xff62FCD7), borderRadius: BorderRadius.circular(15)),
        height: 60,
        width: 350,
        child: Text(
          "Add ",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
