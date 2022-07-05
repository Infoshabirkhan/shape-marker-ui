import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({Key? key}) : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool appearButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            ListView(
              children: [
                InkWell(
                  onTap: (){
                    this.setState(() {
                      appearButton = !appearButton;

                    });


                  },
                  child: Container(
                    margin: EdgeInsets.all(20),
                    width: 200,
                    height: 200,
                    color: Colors.blue,
                  ),
                )

              ],
            ),

            AnimatedPositioned(
              left: 40,
                right: 40,
                bottom: appearButton ==false ? -100 : 20,
                child: Container(

              width: 200,
              height: 100,
              color: Colors.red,
            ), duration: Duration(milliseconds: 100)),
          ],
        ),
      ),
    );
  }
}
