import 'package:coffee_app/App_Screens/user_Info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Colors/colors.dart';
import '../data_transfer.dart';
import 'home.dart';

class SideNavbar extends StatefulWidget {
  @override
  State<SideNavbar> createState() => _SideNavbarState();
}

class _SideNavbarState extends State<SideNavbar> {
  // bool isSwitch = false;
  late Color iconColor;
  late bool isDark;
  late Color bgColor;
  bool isHover = false;

  void Changes(){
    if(isDark == true)
    {
      iconColor = tdBGColor;
      bgColor = tdBlack;
    }
    else
    {
      iconColor = tdBlack;
      bgColor = tdBGColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context);
    isDark = appData.isDark;
    Changes();
    return Drawer(
      backgroundColor: bgColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), topRight: Radius.circular(20) )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
              image: DecorationImage(
                image: AssetImage('Images/Banner1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            accountName: Text('Sandip Ash', style: TextStyle(color: tdRed, fontSize: 25, fontFamily: 'Caprasimo'),),
            accountEmail: Text('sandipash2020@gmail.com', style: TextStyle(color: tdRed, fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Adlam')),
            currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('Images/Sandip_Ash.png'),
                radius: 50,
            ),
          ),

          ListTile(
            leading: Icon(
              Icons.home,
              color: iconColor,
              size: 30,
            ),
            title: Text('Home', style: TextStyle(color: iconColor, fontSize: 22, letterSpacing: 1, fontFamily: 'Adlam'),),
            hoverColor: Colors.orange,
            onTap: (){
              setState(() {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        Home(),
                  ),
                );
              });
            },
          ),

          // Divider(),

          ListTile(
            leading: Icon(
              Icons.notifications,
              color: iconColor,
              size: 30,
            ),
            title: Text('Notifications', style: TextStyle(color: iconColor, fontSize: 22, letterSpacing: 1, fontFamily: 'Adlam'),),
            hoverColor: Colors.orange,
            onTap: (){},
          ),

          // Divider(),

          ListTile(
            leading: Icon(
              Icons.favorite,
              color: iconColor,
              size: 30,
            ),
            title: Text('Favourites', style: TextStyle(color: iconColor, fontSize: 22, letterSpacing: 1, fontFamily: 'Adlam'),),
            hoverColor: Colors.orange,
            onTap: (){},
          ),

          // Divider(),

          ListTile(
            leading: Icon(
              Icons.share,
              color: iconColor,
              size: 30,
            ),
            title: Text('Share', style: TextStyle(color: iconColor, fontSize: 22, letterSpacing: 1, fontFamily: 'Adlam'),),
            hoverColor: Colors.orange,
            onTap: (){},
          ),

          Divider(
            color: iconColor.withOpacity(0.5),
          ),

          ListTile(
            leading: Icon(
              Icons.settings,
              color: iconColor,
              size: 30,
            ),
            title: Text('Settings', style: TextStyle(color: iconColor, fontSize: 22, letterSpacing: 1, fontFamily: 'Adlam'),),
            hoverColor: Colors.orange,
            onTap: (){},
          ),
          // Divider(),

          ListTile(
            leading: Icon(
              Icons.sticky_note_2_outlined,
              color: iconColor,
              size: 30,
            ),
            title: Text('Policies', style: TextStyle(color: iconColor, fontSize: 22, letterSpacing: 1, fontFamily: 'Adlam'),),
            hoverColor: Colors.orange,
            onTap: (){},
          ),
          // Divider(),

          ListTile(
            leading: Icon(
              Icons.person,
              color: iconColor,
              size: 30,
            ),
            title: Text('About Me', style: TextStyle(color: iconColor, fontSize: 22, letterSpacing: 1, fontFamily: 'Adlam'),),
            hoverColor: Colors.orange,
            onTap: (){
              setState(() {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        UserInfo(),
                  ),
                );
              });
            },
          ),

          ListTile(
            leading: Icon(
              Icons.logout,
              color: iconColor,
              size: 30,
            ),
            title: Text('Logout', style: TextStyle(color: iconColor, fontSize: 22, letterSpacing: 1, fontFamily: 'Adlam'),),
            hoverColor: Colors.orange,
            onTap: (){},
          ),
          Divider(),
        ]
      ),
    );
  }
}
