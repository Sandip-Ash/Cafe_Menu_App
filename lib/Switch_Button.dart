import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

class MyAdvanceSwitch extends StatelessWidget {
  MyAdvanceSwitch({Key? key}) : super(key: key);

  // ...
// 1. Create a controller in the state of the StatefulWidget
  final _controller = ValueNotifier<bool>(false);

// 2. In case, you want to call setState on switch changes.
// 2.1. Add event listener, for example in the initState() method.
// ...
  bool _checked = false;

// ...
  @override
  void initState() {
    // super.initState();

    _controller.addListener(() {
      // setState(() {
        if (_controller.value) {
          _checked = true;
        } else {
          _checked = false;
        }
      // });
    });
  }

// 3. Add AdvancedSwitch to the build method.
// ...
//   AdvancedSwitch(
//   controller: _controller,
//   ),
// ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AdvancedSwitch(
          controller: _controller,
          // activeColor: Colors.black,
          // inactiveColor: Colors.white54,
          activeChild: Padding(
            padding: const EdgeInsets.all(4),
            child: Image(image: AssetImage('Images/Icons/light-mode.png')),
          ),
          inactiveChild: Padding(
            padding: const EdgeInsets.all(4),
            child: Image(image: AssetImage('Images/Icons/dark-mode.png')),
          ),
          // activeImage: AssetImage('Images/Icons/light-mode.png'),
          // inactiveImage: AssetImage('Images/Icons/dark-mode.png'),
          // borderRadius: BorderRadius.all(const Radius.circular(15)),
          thumb: ValueListenableBuilder(
            valueListenable: _controller,
            builder: (_, value, __) {
              if(value)
                return Icon(Icons.lightbulb_outline, color: Colors.white,);
              else
                return Icon(Icons.lightbulb, color: Colors.yellow);

            },
          ),
          width: 60.0,
          height: 30.0,
          enabled: true,
          disabledOpacity: 0.5,
        ),
      ),
    );
  }
}
