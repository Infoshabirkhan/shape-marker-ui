import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupCard extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = const Color(0xffffffff)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;


    Path path0 = Path();
    path0.moveTo(size.width*0.1307250,0);
    path0.quadraticBezierTo(size.width*-0.0149000,size.height*-0.0066667,size.width*0.0042000,size.height*0.0819500);
    path0.lineTo(0,size.height*0.9140500);
    path0.quadraticBezierTo(size.width*-0.0018250,size.height*0.9981167,size.width*0.1275500,size.height);
    path0.quadraticBezierTo(size.width*0.3624750,size.height*0.9995333,size.width*0.8767000,size.height);
    path0.quadraticBezierTo(size.width*1.0142750,size.height*1.0049333,size.width,size.height*0.9161000);
    path0.quadraticBezierTo(size.width,size.height*0.7531583,size.width,size.height*0.2643333);
    path0.quadraticBezierTo(size.width*1.0066750,size.height*0.2273500,size.width*0.9622750,size.height*0.2165667);
    path0.cubicTo(size.width*0.7203250,size.height*0.1624167,size.width*0.7543875,size.height*0.1624250,size.width*0.1307250,0);
    path0.close();

    canvas.drawPath(path0, paint0);
  canvas.drawShadow(path0, Colors.grey.withAlpha(50), 5.0, false);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
