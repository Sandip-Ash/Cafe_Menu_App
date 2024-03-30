import 'package:flutter/material.dart';

import '../Colors/colors.dart';

class InfoWidget extends StatelessWidget {
  InfoWidget({
    Key? key,
    required this.name,
    required this.profession
  }) : super(key: key);

  final String name, profession;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage('Images/Sandip_Ash.png'),
        // backgroundColor: tdBGColor,
        // child: Icon(
        //     Icons.person,
        //     color: Colors.white,
        // ),
      ),
      title: Text(name, style: TextStyle(color: tdBGColor, fontSize: 20),),
      subtitle: Text(profession, style: TextStyle(color: tdBGColor, fontSize: 15),),
    );
  }
}
