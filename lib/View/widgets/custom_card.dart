



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class LoginCard extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = const Color(0xffffffff)
      ..style = PaintingStyle.fill
     ..strokeWidth = 1.0;


    Path path0 = Path();
    path0.moveTo(size.width*0.1255250,0);
    path0.quadraticBezierTo(size.width*-0.0064000,size.height*0.0005333,0,size.height*0.0781000);
    path0.lineTo(0,size.height*0.7051000);
    path0.quadraticBezierTo(size.width*0.0013250,size.height*0.7336333,size.width*0.0622000,size.height*0.7491833);
    path0.cubicTo(size.width*0.2940250,size.height*0.8118833,size.width*0.6716688,size.height*0.9372958,size.width*0.8748250,size.height);
    path0.quadraticBezierTo(size.width*1.0023750,size.height*0.9992167,size.width,size.height*0.9174000);
    path0.lineTo(size.width,size.height*0.0841667);
    path0.quadraticBezierTo(size.width*1.0105000,size.height*0.0014500,size.width*0.8756500,0);
    path0.cubicTo(size.width*0.6881188,0,size.width*0.7720063,size.height*0.0012500,size.width*0.1255250,0);
    path0.close();

    canvas.drawPath(path0, paint0);
     // canvas.drawShadow(path0, Colors.black.withAlpha(50), 5.0, false);
    canvas.drawShadow(path0, Colors.white.withAlpha(50), 5.0, true);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}





