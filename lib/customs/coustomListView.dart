import 'package:flutter/cupertino.dart';

import 'NotesItem.dart';

class ListviewOfNotes extends StatelessWidget {
  const ListviewOfNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return NotesItem();
            }),
      ),
    );
  }
}
