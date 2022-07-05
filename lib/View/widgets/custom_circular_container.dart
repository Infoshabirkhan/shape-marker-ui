import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Constants/colors.dart';



class CustomCircularContainer extends StatelessWidget {
  const CustomCircularContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return                 Container(
      width: 1.sw,
      height: 300.sp,
      decoration: BoxDecoration(

          gradient: LinearGradient(
              colors: [

                AppColors.kPinkColor,
                AppColors.kOrangeColor
              ]

          ),
          borderRadius: const BorderRadius.only(
            // bottomRight: Radius.circular(200),
            // bottomLeft: Radius.circular(100))
              bottomRight: Radius.circular(180),
              bottomLeft: Radius.circular(100))
      ),
    );
  }
}
