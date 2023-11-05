import 'package:flutter/material.dart';
import 'package:myshop/Page/Admin/AdminPage.dart';
import 'package:myshop/Page/Admin/LoginAdmin.dart';
import 'package:myshop/Page/Admin/curdPage/edit.dart';
import 'package:myshop/Page/Admin/curdPage/insert.dart';
import 'package:myshop/Page/HomePage.dart';
import 'package:myshop/Page/SignUpPage.dart';
import 'Page/LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFCEDDEE),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        "/": (context) => LoginPage(),
        "homePage": (context) => HomePage(cusId: null,),
        // "itemPage": (context) => ItemPage(),
        "signuppage": (context) => SignUpPage(),
        "LoginAdmin": (context) => LoginAdmin(),
        "homePageAdmin": (context) => AdminPage(),
        "insertPage": (context) => InsertPage(),
        //  "editPage": (context) => EditPages(),
         "adminPage": (context) => AdminPage()
      },
    );
  }
}