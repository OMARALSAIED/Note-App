import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notappwithfierbase/customs/EditNoteView.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EidtNoteView();
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8),
        child: Container(
          padding: EdgeInsets.only(top: 35, bottom: 28, left: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.yellow),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            ListTile(
              title: Text(
                "Flutter Tips",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text(
                  "Build your carrer with omar saied",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(162, 0, 0, 0),
                  ),
                ),
              ),
              trailing: IconButton(
                  iconSize: 40,
                  color: Colors.black,
                  onPressed: () {},
                  icon: Icon(Icons.delete)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text("May 21 , 2023",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(162, 0, 0, 0),
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
