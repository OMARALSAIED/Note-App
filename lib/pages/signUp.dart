import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../customs/CustomTextFiled.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  var email, password, username;

  SignUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        // ignore: unused_local_variable
        UserCredential credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AwesomeDialog(
              context: context,
              title: "Erorr",
              body: Text(
                "Passoword is to weak",
                style: TextStyle(fontSize: 20),
              ))
            ..show();
        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(
              context: context,
              title: "Erorr",
              body: Text("the account already exists for that email"))
            ..show();
        }
      } catch (e) {
        print(e);
      }
    } else {}
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
                      child: Image.asset("assets/owl.png"))),
              CustomTextFiled(
                onSaved: (val) {
                  username = val;
                },
                validator: (val) {
                  if (val!.length > 100) {
                    return "username can't to be larger than 100 letter";
                  }
                  if (val.length < 2) {
                    return "username can't to be less than 2 letter";
                  }
                  return null;
                },
                hint: "Username",
                icon: Icon(Icons.person),
              ),
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
                      "if you have Account ",
                      style: TextStyle(fontSize: 16),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            "Signin", (route) => false);
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
                            var resopnse = await SignUp();
                            print("============");
                            if (resopnse != null) {
                            } else {
                              print("Sign Up Faild");
                            }
                            print("============");
                          },
                          child: Text(
                            "Sign Up",
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
