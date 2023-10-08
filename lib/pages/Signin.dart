import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../customs/CustomTextFiled.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  var email, password, username;

  SignIN() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();

      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        return credential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          AwesomeDialog(
              context: context,
              title: "Erorr",
              body: Text(
                'No user found for that email.',
                style: TextStyle(fontSize: 20),
              ))
            ..show();
        } else if (e.code == 'wrong-password') {
          AwesomeDialog(
              context: context,
              title: "Erorr",
              body: Text(
                'Wrong password provided for that user.',
                style: TextStyle(fontSize: 20),
              ))
            ..show();
        }
      } catch (e) {
        print(e);
      }
    } else {}

    return null;
  }

  getUser() {
    var user = FirebaseAuth.instance.currentUser;
    print(user?.email);
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Form(
          key: formstate,
          child: Column(
            children: [
              Center(
                  child: Container(
                      margin: EdgeInsets.only(top: 100),
                      width: 250,
                      height: 250,
                      child: Image.asset("assets/ll.png"))),
              SizedBox(
                height: 16,
              ),
              CustomTextFiled(
                  onSaved: (val) {
                    email = val;
                  },
                  validator: (val) {
                    if (val!.length > 100) {
                      return "Email can't to be larger than 100 letter";
                    }
                    if (val.length < 2) {
                      return "Email can't to be less than 2 letter";
                    }
                    return null;
                  },
                  hint: "email",
                  icon: Icon(Icons.email)),
              SizedBox(
                height: 16,
              ),
              CustomTextFiled(
                  onSaved: (val) {
                    password = val;
                  },
                  validator: (val) {
                    if (val!.length > 100) {
                      return "Password can't to be larger than 100 letter";
                    }
                    if (val.length < 4) {
                      return "Password can't to be less than 4 letter";
                    }
                    return null;
                  },
                  hint: "Password",
                  icon: Icon(Icons.password)),
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 40),
                child: Row(
                  children: [
                    Text(
                      "if you Don't have Account ",
                      style: TextStyle(fontSize: 16),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed("signUp");
                      },
                      child: Text(
                        " Click Here",
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Container(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () async {
                            var user = await SignIN();
                            if (user != null) {
                              Navigator.of(context)
                                  .pushReplacementNamed("Home");
                            }
                          },
                          child: Text(
                            "Sign in",
                            style: TextStyle(fontSize: 20),
                          ))),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
