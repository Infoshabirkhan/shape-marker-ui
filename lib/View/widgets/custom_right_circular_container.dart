import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Constants/colors.dart';



class RightCircularContainer extends StatelessWidget {
  const RightCircularContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return                 Positioned(

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
    )
    ;
  }
}
