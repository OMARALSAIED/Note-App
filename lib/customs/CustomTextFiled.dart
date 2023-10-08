import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFiled extends StatelessWidget {
  final String hint;
  final Icon icon;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  CustomTextFiled({
    super.key,
    required this.hint,
    required this.icon,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  spreadRadius: 3,
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10,
                  offset: Offset(1, 1))
            ]),
        height: 60,
        width: 350,
        child: TextFormField(
          onSaved: onSaved,
          validator: validator,
          scrollPadding: EdgeInsets.only(bottom: 100),
          decoration: InputDecoration(
              prefixIcon: icon,
              hintText: hint,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(15)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(15)),
              filled: true),
        ),
      ),
    );
  }
}
