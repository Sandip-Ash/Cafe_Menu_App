import 'package:coffee_app/Colors/colors.dart';
import 'package:flutter/material.dart';

import 'navbar_user_Details.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 288,
          height: double.infinity,
          color: tdBlack,
          child: Column(
            children: [
              InfoWidget(name: 'Sandip Ash', profession: 'Developer',)
            ],
          ),
        ),
      ),
    );
  }
}

