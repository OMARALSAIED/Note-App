import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../customs/AddNoteButtonSheet.dart';
import '../customs/notesHomebody.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  getuser() {
    var user = FirebaseAuth.instance.currentUser;
    print(user?.email);
  }

  @override
  void initState() {
    getuser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(160)),
                context: context,
                builder: (context) {
                  return AddNotesButtonSheet();
                });
          },
          child: Icon(Icons.add),
        ),
        body: NotesView());
  }
}
