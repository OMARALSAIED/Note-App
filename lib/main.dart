import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notappwithfierbase/pages/Home.dart';
import 'package:notappwithfierbase/pages/Signin.dart';
import 'package:notappwithfierbase/pages/signUp.dart';

import 'firebase_options.dart';

bool isLogin = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //التأكد أن عملية الربط تمت بنجاح
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform //
      );
  var userLog = FirebaseAuth.instance.currentUser;
  if (userLog == null) {
    isLogin = false;
  } else {
    isLogin = true;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLogin == false ? Signin() : Homepage(),
      routes: {
        "signUp": (context) => SignUp(),
        "Signin": (context) => Signin(),
        "Home": (context) => Homepage(),
      },
    );
  }
}
