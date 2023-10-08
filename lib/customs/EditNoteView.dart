import 'package:flutter/material.dart';

import 'EidtViewBody.dart';

class EidtNoteView extends StatelessWidget {
  const EidtNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(57, 255, 255, 255),
        body: EidtViewBody());
  }
}
