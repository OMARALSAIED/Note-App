import 'package:flutter/material.dart';
import 'package:notappwithfierbase/customs/CustomAppbar.dart';
import 'package:notappwithfierbase/customs/customTextButtomSheet.dart';

class EidtViewBody extends StatelessWidget {
  const EidtViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: CustomAppBar(title: "Eidt Note", icon: Icons.check),
        ),
        TextButtomSheet(hint: "Title"),
        SizedBox(
          height: 16,
        ),
        TextButtomSheet(
          hint: "Content",
          maxline: 5,
        )
      ],
    );
  }
}
