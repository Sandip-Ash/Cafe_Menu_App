// import 'package:coffee_app/App_Screens/user_Info.dart';
// import 'package:coffee_app/Switch_Button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data_transfer.dart';
import 'home.dart';
// import 'login_page.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
          create: (context) => AppData(),
          child: MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      // home: Login(),
    );
  }
}