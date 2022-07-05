import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_ui/View/screen/login_screen.dart';

import '../../Constants/colors.dart';



class HomeScreen extends StatelessWidget {
  final Map<String , dynamic> data;
  const HomeScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:   Container(
          height: 1.sh,
          width: 1.sw,
          child: Stack(
            children: [

              Container(
                width: 1.sw,
                height: 300.sp,
                decoration: BoxDecoration(

                    gradient: LinearGradient(
                        colors: [

                          AppColors.kPinkColor,
                          AppColors.kOrangeColor
                        ]

                    ),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(200), bottomLeft: Radius.circular(100))
                ),
              ),


              Positioned(

                right: -300,
                bottom: 0,
                child: Container(
                  width: 400.sp,
                  height: 400.sp,
                  decoration: BoxDecoration(


                    gradient: LinearGradient(
                        colors: [

                          AppColors.kPinkColor,
                          AppColors.kOrangeColor
                        ]

                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),






          Positioned(
            left: 30.sp,
            top: 100.sp,
            child: Container(
              width: 0.8.sw,
              height: 130,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: Text('Hello', style: TextStyle(fontSize: 30.sp),)),
                  
                  Expanded(
                      flex: 2,
                      child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(data['name'], style: TextStyle(fontSize: 30.sp),)))

                ],

              ),
            ),
          ),




              Positioned(
                  top: 50.sp,
                  right: 10.sp,
                  child: IconButton(icon: Icon(Icons.logout), onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                  return LoginScreen();
                }));
              },)),


            ],
          ),
        )
    );
  }
}
