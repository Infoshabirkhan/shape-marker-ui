import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ndialog/ndialog.dart';

import '../../Constants/colors.dart';
import '../screen/home_screen.dart';
import 'custom_card.dart';

import 'package:http/http.dart' as http;

class CustomLoginDesign extends StatefulWidget {
  final bool keyboardApparance;
  final bool state;
  final VoidCallback onTap;

  const CustomLoginDesign(
      {Key? key,
      required this.keyboardApparance,
      required this.onTap,
      required this.state})
      : super(key: key);

  @override
  State<CustomLoginDesign> createState() => _CustomLoginDesignState();
}

class _CustomLoginDesignState extends State<CustomLoginDesign> {
  logIn() async {
    ProgressDialog progressDialog = ProgressDialog(context,
        message: const Text("Please wait...."),
        title: const Text("Logging in...."));

    progressDialog.show();
    var url = 'https://inveoa.com/api/login';

    var response = await http.post(Uri.parse(url), body: {
      'email': emailController.text.trim(),
      'password': passwordController.text.trim()
    });

    var jsonData = json.decode(response.body);

    progressDialog.dismiss();


    debugPrint('==================');
    debugPrint('status code ${response.statusCode}');



    if (response.statusCode == 200) {
      progressDialog.dismiss();

      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return HomeScreen(
          data: jsonData['data'],
        );
      }));
    } else {
      progressDialog.dismiss();

      debugPrint(jsonData);
      Fluttertoast.showToast(
          msg: 'Invalid username or password', backgroundColor: Colors.red);
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        top: widget.state == true ? 50.sp : -0.6.sh,
        right: 15.sp,
        left: 15.sp,
        duration: const Duration(seconds: 1),
        child: SizedBox(
          height: 0.82.sh,
          child: Stack(
            children: [



              /// ============== Custom Painter Design Start here =======//

              SizedBox(
                height: 0.75.sh,
                child: CustomPaint(
                  size: Size(
                    1.sw,
                    0.8.sh,
                  ),
                  //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: LoginCard(),
                  child: Column(
                    children: [
                      Expanded(
                          child: Center(
                        child: Text(
                          'LOGO',
                          style: TextStyle(fontSize: 40.sp),
                        ),
                      )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.all(20.sp),
                            child: Column(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: emailController,
                                    decoration: const InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.email,
                                          color: Colors.grey,
                                        ),
                                        hintText: 'Email'),
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: passwordController,
                                    decoration: const InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.key,
                                          color: Colors.grey,
                                        ),
                                        hintText: 'Password'),
                                  ),
                                ),
                                const Expanded(
                                    flex: 2,
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text('Forgot Password ? '))),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () {
                                        logIn();
                                      },
                                      child: Container(
                                        width: 250,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.sp),
                                          gradient: LinearGradient(colors: [
                                            AppColors.kPinkColor,
                                            AppColors.kOrangeColor
                                          ]),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'login',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.sp),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                      // Expanded(child: Container(color: Colors.yellow,)),

                      const Spacer(),
                      Expanded(
                          flex: 0,
                          child: Container(
                            color: Colors.transparent,
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: widget.onTap,
                              child: Container(
                                margin: EdgeInsets.all(15.sp),
                                alignment: Alignment.centerRight,
                                width: 35.sp,
                                height: 35.sp,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      AppColors.kPinkColor,
                                      AppColors.kOrangeColor
                                    ]),
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Icon(
                                  widget.state == true
                                      ? Icons.arrow_upward
                                      : Icons.arrow_downward,
                                  color: Colors.white,
                                )),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),



              /// ============== Custom Painter Design end here =======//



              /// ========= Social Media buttons Starts here =======//

              Visibility(
                visible: widget.keyboardApparance == true ? false : true,
                child: Positioned(
                  bottom: 0.sp,
                  child: SizedBox(
                    height: 150.sp,
                    width: 0.6.sw,
                    // color: Colors.blue,
                    child: Column(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 50.sp,
                              height: 50.sp,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: widget.state == true
                                      ? AppColors.kPinkColor
                                      : Colors.white),
                              child: Center(
                                  child: FaIcon(
                                FontAwesomeIcons.googlePlusG,
                                color: widget.state == true
                                    ? Colors.white
                                    : AppColors.kGmailColor,
                                size: 25.sp,
                              )),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 50.sp,
                              height: 50.sp,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: widget.state == true
                                      ? AppColors.kfacebookColor
                                      : Colors.white),
                              child: Center(
                                  child: FaIcon(
                                FontAwesomeIcons.facebookF,
                                color: widget.state == true
                                    ? Colors.white
                                    : AppColors.kfacebookColor,
                                size: 25.sp,
                              )),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: 50.sp,
                              height: 50.sp,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: widget.state == true
                                      ? AppColors.kBlueColor
                                      : Colors.white),
                              child: Center(
                                  child: FaIcon(
                                FontAwesomeIcons.twitter,
                                color: widget.state == true
                                    ? Colors.white
                                    : AppColors.kBlueColor,
                                size: 25.sp,
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              /// ========= Social Media buttons ends here =======//

            ],
          ),
        ));
  }
}
