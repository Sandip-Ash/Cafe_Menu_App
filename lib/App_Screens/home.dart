import 'package:coffee_app/App_Screens/snacks_menu.dart';
import 'package:coffee_app/Colors/colors.dart';
import 'package:coffee_app/App_Screens/side_navbar.dart';
import 'package:coffee_app/App_Screens/tea_menu.dart';
import 'package:coffee_app/App_Screens/coffee_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data_transfer.dart';
// import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:coffee_app/navbar_items/animated_navbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Color iconColor = tdBlack;
  Color bgColor = tdBGColor;
  bool isDark = false;
  int curIndex = 0;
  String userInput = '';
  TextEditingController _controller = TextEditingController();
  Image inactiveImage = Image.asset('Images/Icons/dark-mode.png', width: 50, height: 50);
  Image activeImage = Image.asset('Images/Icons/light-mode.png', width: 50, height: 50);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      userInput = _controller.text;
    });
  }

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor,
      // drawer: SideNavbar(isDark),
      drawer: SideNavbar(),
      endDrawerEnableOpenDragGesture: true,
      appBar: AppBar(
        title: Center(child: Text('CoffeeCraft', style: TextStyle(fontSize: 30, color: iconColor, fontFamily: 'Pacifico', letterSpacing: 2,))),
        elevation: 0,
        iconTheme: IconThemeData(color: iconColor),
        backgroundColor: Colors.transparent,
        actions: [
          Transform.scale(
            scale: 1.2,
            child: Switch.adaptive(
                splashRadius: 0,
                activeColor: Colors.black54,
                activeTrackColor: Colors.black26,
                inactiveThumbImage: AssetImage('Images/Icons/dark-mode.png'),
                activeThumbImage: AssetImage('Images/Icons/light-mode.png'),
                value: isDark,
                onChanged: (value) async{
                  setState(() {
                    isDark = value;
                    appData.toggleSwitch(value);
                  });
                  Changes();              // Function call
                }
            ),
          ),

          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            // child: IconButton(
            //     onPressed: (){},
            //     icon: Icon(Icons.account_circle_rounded, size: 30,),
            // ),
            child: CircleAvatar(
              backgroundImage: AssetImage('Images/Sandip_Ash.png'),
              radius: 24,
            ),
          )
        ],
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        // reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
              child: Text('Start your day with a cup of coffee', style: TextStyle(fontSize: 40, color: Colors.orange, fontFamily: 'Caprasimo', letterSpacing: 2)),
            ),

            SearchBox(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
              child: Text('Coffee', style: TextStyle(fontSize: 20, color: iconColor, fontFamily: 'Caprasimo', letterSpacing: 2)),
            ),

            // Text(userInput, style: TextStyle(fontSize: 40, color: iconColor, fontFamily: 'Caprasimo', letterSpacing: 2))
            Coffee_menu(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
              child: Text('Tea', style: TextStyle(fontSize: 20, color: iconColor, fontFamily: 'Caprasimo', letterSpacing: 2)),
            ),

            Tea_menu(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
              child: Text('Snacks', style: TextStyle(fontSize: 20, color: iconColor, fontFamily: 'Caprasimo', letterSpacing: 2)),
            ),

            Snacks_menu(),
          ],
        ),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   elevation: 0,
      //   backgroundColor: bgColor,
      //   // mouseCursor: MouseCursor.defer,
      //   // showSelectedLabels: true,
      //   selectedItemColor: Colors.orange,
      //   unselectedItemColor: iconColor,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home, size: 30),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_bag, size: 30),
      //       label: '',
      //
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite, size: 30),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.notifications, size: 30),
      //       label: '',
      //     ),
      //   ],
      //   currentIndex: curIndex,
      //   onTap: (int index) {
      //     setState(() {
      //       curIndex = index;
      //     });
      //   },
      //   type: BottomNavigationBarType.fixed,
      // ),
    );
  }



  // Search Box
  Padding SearchBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14),
      child: Container(
        height: 50,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          // color: Colors.greenAccent,
          border: Border.all(color: iconColor),
          borderRadius: BorderRadius.circular(50),
        ),
        child: TextField(
          controller: _controller,
          cursorColor: iconColor,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: iconColor.withOpacity(0.8),),
            hintText: 'Search',
            hintStyle: TextStyle(color: iconColor.withOpacity(0.5), fontSize: 25, fontFamily: 'Adlam'),
          ),
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Adlam',
            color: iconColor,
            // overflow: TextOverflow()
          ),
        ),
      ),
    );
  }
}
