import 'package:coffee_app/Colors/colors.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  UserInfo({Key? key}) : super(key: key);

  Color iconColor = tdBlack;
  Color bgColor = tdBGColor;
  String name = 'Sandip Ash';
  String email = 'sandipash2020@gmail.com';
  String designation = 'Developer';
  String gender = 'Male';
  int phone_no = 7431964656;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Images/UserInfo_BG.png'),
            opacity: 0.5,
            fit: BoxFit.cover,
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   iconTheme: IconThemeData(color: iconColor, size: 30),
        // ),
        body: Padding(
          // padding: const EdgeInsets.only(left: 30, right: 30, bottom: 50),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: tdBGColor.withOpacity(0.8),
            ),
            child: ListView(
              padding: EdgeInsets.only(top: 40),

              children: [
                const Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('Images/Sandip_Ash.png'),
                      radius: 60,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20, bottom: 10),
                  child: Text('Profile', style: TextStyle(fontFamily: 'Caprasimo', fontSize: 20, color: iconColor),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: tdBlack,

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text('Name: ${name}', style: TextStyle(fontFamily: 'DynaPuff', letterSpacing: 1, fontSize: 20, color: iconColor),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text('E-mail ID: ${email}', style: TextStyle(fontFamily: 'DynaPuff', letterSpacing: 1, fontSize: 20, color: iconColor),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text('Designation: ${designation}', style: TextStyle(fontFamily: 'DynaPuff', letterSpacing: 1, fontSize: 20, color: iconColor),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text('Gender: ${gender}', style: TextStyle(fontFamily: 'DynaPuff', letterSpacing: 1, fontSize: 20, color: iconColor),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text('Contact: ${phone_no}', style: TextStyle(fontFamily: 'DynaPuff', letterSpacing: 1, fontSize: 20, color: iconColor),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
