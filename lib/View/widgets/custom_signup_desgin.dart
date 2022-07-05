import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_ui/View/widgets/sign_up_card.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ndialog/ndialog.dart';

import 'package:http/http.dart' as http;

import '../../Constants/colors.dart';



class CustomSignUpDesign extends StatefulWidget {
  final bool state;
  final VoidCallback onTap;
  const CustomSignUpDesign({Key? key, required this.state, required this.onTap}) : super(key: key);

  @override
  State<CustomSignUpDesign> createState() => _CustomSignUpDesignState();
}

class _CustomSignUpDesignState extends State<CustomSignUpDesign> {
  signUp()async{


    ProgressDialog progressDialog = ProgressDialog(context,
        message:const Text("Please wait...."),
        title:const Text("Signing up....")
    );

    progressDialog.show();
    var url = 'https://inveoa.com/api/signup';

    var response = await  http.post(Uri.parse(url), body: {
      'name' : nameController.text.trim(),
      'email' : emailController.text.trim(),
      'password' : passwordController.text.trim()
    });




    var jsonData = json.decode(response.body);

    progressDialog.dismiss();

    debugPrint(jsonData);

    if(response.statusCode == 200){
      progressDialog.dismiss();


      Fluttertoast.showToast(msg: 'Account Created Sucessfully', backgroundColor: Colors.green);

      Navigator.of(context).pop();


    }else{
      progressDialog.dismiss();

      Fluttertoast.showToast(msg: 'User Already exists', backgroundColor: Colors.red);
    }


  }

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return           AnimatedPositioned(

      bottom: widget.state == false ? 15.sp : -0.65.sh,
      right: 15.sp,
      left: 15.sp,
      duration: const Duration(seconds: 1),
      child: SizedBox(
        height: 0.75.sh,
        child: CustomPaint(

          size: Size(1.sw,0.8.sh,   ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          painter: SignupCard(),
          child: Column(
            children: [


              Expanded(
                  flex: 0,
                  child: Container(color: Colors.transparent,

                    alignment: Alignment.centerLeft,

                    child: InkWell(
                      onTap: widget.onTap,
                      child: Container(
                        margin: EdgeInsets.all(15.sp),
                        alignment: Alignment.centerRight,
                        width: 35.sp,
                        height: 35.sp,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [

                                  AppColors.kPinkColor,
                                  AppColors.kOrangeColor
                                ]

                            ),                        shape: BoxShape.circle

                        ),
                        child: Center(child: Icon(widget.state == true ? Icons.arrow_upward: Icons.arrow_downward, color: Colors.white,)),
                      ),
                    ),
                  )),

              Expanded(child: Container(
                padding: EdgeInsets.only(left: 15.sp),


                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('LOGO', style: TextStyle(fontSize: 40.sp),),),
              )),
              Expanded(

                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(20.sp),

                    child: Column(

                      children: [
                        Expanded(
                          child: TextField(


                            controller: nameController,
                            decoration:  const InputDecoration(


                                suffixIcon: Icon(Icons.person, color: Colors.grey,),
                                hintText: 'Name'
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: emailController,

                            decoration: const InputDecoration(


                                suffixIcon: Icon(Icons.email, color: Colors.grey,),
                                hintText: 'Email'
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: passwordController,

                            decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.key, color: Colors.grey,),

                                hintText: 'Password'
                            ),
                          ),
                        ),

                        Expanded(

                          child: TextField(
                            controller: confirmPasswordController,

                            decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.key, color: Colors.grey,),

                                hintText: 'Password'
                            ),
                          ),
                        ),


                        const Spacer(),

                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                signUp();
                              },
                              child: Container(

                                width: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.sp),
                                  gradient: LinearGradient(
                                      colors: [

                                        AppColors.kPinkColor,
                                        AppColors.kOrangeColor
                                      ]

                                  ),
                                ),

                                child: Center(child: Text('Signup', style: TextStyle(color: Colors.white, fontSize: 20.sp),),),

                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              // Expanded(child: Container(color: Colors.yellow,)),


            ],
          ),
        ),
      ),
    );
  }
}
