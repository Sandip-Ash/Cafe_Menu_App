import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Colors/colors.dart';
import '../data_transfer.dart';

class Tea_menu extends StatefulWidget {
  const Tea_menu({Key? key}) : super(key: key);

  @override
  State<Tea_menu> createState() => _Tea_menuState();
}

class _Tea_menuState extends State<Tea_menu> {

  late Color iconColor;
  late bool isDark;
  late Color bgColor;

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

  List<String> items = [
    'Tandoori Chai',
    'Green Tea',
    'Chai',
    'Black Tea'
  ];

  List<String> itemPrice = [
    '\₹140.00',
    '\₹60.00',
    '\₹40.00',
    '\₹60.00',
  ];

  List<String> itemImage = [
    'Images/Tea/Tandoori_chai.jpg',
    'Images/Tea/Green_tea.jpg',
    'Images/Tea/Chai.jpg',
    'Images/Tea/Black_tea.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final appData = Provider.of<AppData>(context);
    isDark = appData.isDark;
    Changes();

    List<Widget> menuWidgets = [];

    for (int i = 0; i < items.length; i++) {
      menuWidgets.add(Menu(
        itemName: items[i],
        itemPrice: itemPrice[i],
        itemImagePath: itemImage[i],
      ));
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: menuWidgets,
      ),
    );
  }

  Widget Menu({required String itemName, required String itemPrice, required String itemImagePath}) {
    // Menu
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(8),
        width: 200,
        height: 300,
        decoration: BoxDecoration(
          color: bgColor,
          boxShadow: [
            BoxShadow(
                color: iconColor.withOpacity(0.5),
                blurRadius: 2,
                offset: Offset.zero
            )
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              // clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(itemImagePath, fit: BoxFit.fitWidth),
            ),

            Text(itemName, style: TextStyle(fontSize: 22, color: iconColor, fontFamily: 'Adlam', letterSpacing: 1), textAlign: TextAlign.center),

            Padding(
              padding: const EdgeInsets.only(right: 6, left: 6, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(itemPrice, style: TextStyle(fontSize: 22, color: iconColor, fontFamily: 'Adlam', letterSpacing: 1),textAlign: TextAlign.left),

                  InkWell(
                    onTap: (){
                      setState(() {
                        print('Item Name: ${itemName}');
                        print('Item Price: ${itemPrice}');
                        print('Item Image Path: ${itemImagePath}');
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      height: 40,
                      width: 40,
                      child: Center(
                        child: Icon(Icons.add, color: iconColor, size: 30),
                      ),
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
