import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ButtunSheet.dart';
import 'customTextButtomSheet.dart';

class AddNotesButtonSheet extends StatelessWidget {
  const AddNotesButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 85, 75, 65),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 32,
          ),
          TextButtomSheet(
            hint: "Title",
          ),
          SizedBox(
            height: 16,
          ),
          TextButtomSheet(
            hint: "Content",
            maxline: 7,
          ),
          SizedBox(
            height: 80,
          ),
          ButtonSheet(),
          SizedBox(
            height: 20,
          )
        ]),
      ),
    );
  }
}
