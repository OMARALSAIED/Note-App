import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CustomAppbar.dart';
import 'coustomListView.dart';

class NotesView extends StatelessWidget {
  const NotesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 85, 75, 65),
      body: Column(children: [
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              IconButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushReplacementNamed("Signin");
                  },
                  icon: Icon(Icons.exit_to_app)),
              CustomAppBar(
                title: "Notes",
                icon: Icons.search,
              ),
            ],
          ),
        ),
        Expanded(child: ListviewOfNotes())
      ]),
    );
  }
}
