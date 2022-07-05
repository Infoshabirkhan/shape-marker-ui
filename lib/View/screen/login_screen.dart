
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task_ui/View/widgets/custom_circular_container.dart';
import 'package:flutter_task_ui/View/widgets/custom_login_design.dart';
import 'package:flutter_task_ui/View/widgets/custom_right_circular_container.dart';
import '../../Controller/cubit/animated_screens_cubit.dart';
import '../widgets/custom_signup_desgin.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;

    return BlocProvider(
      create: (context) => AnimatedScreensCubit(true),
      child: BlocBuilder<AnimatedScreensCubit, bool>(
        builder: (context, state) {
          return Scaffold(
              backgroundColor: Colors.white.withOpacity(0.9),
              body: SizedBox(
                height: 1.sh,
                width: 1.sw,
                child: Stack(
                  children: [
                    const CustomCircularContainer(),

                    const RightCircularContainer(),

                    /// =========== Sign up Design  =========== //

                    CustomSignUpDesign(
                        onTap: () {
                          context
                              .read<AnimatedScreensCubit>()
                              .getLoginScreen(myState: !state);
                        },
                        state: state),



                    /// ============  Log in Design ================  //

                    CustomLoginDesign(
                        keyboardApparance: keyboardIsOpened,
                        onTap: () {
                          context
                              .read<AnimatedScreensCubit>()
                              .getLoginScreen(myState: !state);
                        },
                        state: state),


                  ],
                ),
              ));
        },
      ),
    );
  }
}




















//// ==================== sign up Design  starting ========== //

// AnimatedPositioned(
//
//         bottom: state == false ? 15.sp : -0.6.sh,
//         right: 15.sp,
//         left: 15.sp,
//         duration: const Duration(milliseconds: 600),
//         child: SizedBox(
//           height: 0.75.sh,
//           child: CustomPaint(
//
//             size: Size(1.sw,0.8.sh,   ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//             painter: SignupCard(),
//             child: Column(
//               children: [
//
//
//                 Expanded(
//                     flex: 0,
//                     child: Container(color: Colors.transparent,
//
//                       alignment: Alignment.centerLeft,
//
//                       child: InkWell(
//                         onTap: (){
//                           context.read<AnimatedScreensCubit>().getLoginScreen(myState: !state);
//                           // Navigator.of(context).pop();
//                         },
//                         child: Container(
//                           margin: EdgeInsets.all(15.sp),
//                           alignment: Alignment.centerRight,
//                           width: 35.sp,
//                           height: 35.sp,
//                           decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                   colors: [
//
//                                     AppColors.kPinkColor,
//                                     AppColors.kOrangeColor
//                                   ]
//
//                               ),                        shape: BoxShape.circle
//
//                           ),
//                           child: Center(child: Icon(state == true ? icon : Icons.arrow_downward, color: Colors.white,)),
//                         ),
//                       ),
//                     )),
//
//                 Expanded(child: Container(
//                   padding: EdgeInsets.only(left: 15.sp),
//
//
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text('LOGO', style: TextStyle(fontSize: 40.sp),),),
//                 )),
//                 Expanded(
//
//                     flex: 2,
//                     child: Container(
//                       padding: EdgeInsets.all(20.sp),
//
//                       child: Column(
//
//                         children: [
//                           Expanded(
//                             child: TextField(
//
//
//                               controller: nameController,
//                               decoration:  const InputDecoration(
//
//
//                                   suffixIcon: Icon(Icons.person, color: Colors.grey,),
//                                   hintText: 'Name'
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: TextField(
//                               controller: emailController,
//
//                               decoration: const InputDecoration(
//
//
//                                   suffixIcon: Icon(Icons.email, color: Colors.grey,),
//                                   hintText: 'Email'
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: TextField(
//                               controller: passwordController,
//
//                               decoration: const InputDecoration(
//                                   suffixIcon: Icon(Icons.key, color: Colors.grey,),
//
//                                   hintText: 'Password'
//                               ),
//                             ),
//                           ),
//
//                           Expanded(
//
//                             child: TextField(
//                               controller: confirmPasswordController,
//
//                               decoration: const InputDecoration(
//                                   suffixIcon: Icon(Icons.key, color: Colors.grey,),
//
//                                   hintText: 'Password'
//                               ),
//                             ),
//                           ),
//
//
//                           const Spacer(),
//
//                           Expanded(
//                             child: Align(
//                               alignment: Alignment.centerRight,
//                               child: InkWell(
//                                 onTap: () {
//                                   signUp();
//                                 },
//                                 child: Container(
//
//                                   width: 250,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(30.sp),
//                                     gradient: LinearGradient(
//                                         colors: [
//
//                                           AppColors.kPinkColor,
//                                           AppColors.kOrangeColor
//                                         ]
//
//                                     ),
//                                   ),
//
//                                   child: Center(child: Text('Signup', style: TextStyle(color: Colors.white, fontSize: 20.sp),),),
//
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     )),
//                 // Expanded(child: Container(color: Colors.yellow,)),
//
//
//               ],
//             ),
//           ),
//         ),
//       ),

//// ==================== sign up Design  ending ========== //

//
// AnimatedPositioned(
// top: state == true ? 50.sp : -0.6.sh,
// right: 15.sp,
// left: 15.sp,
// duration: const Duration(milliseconds: 600),
// child: SizedBox(
// height: 0.82.sh,
// child: Stack(
// children: [
// SizedBox(
// height: 0.75.sh,
// child: CustomPaint(
//
// size: Size(1.sw, 0.8.sh,),
// //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
// painter: LoginCard(),
// child: Column(
// children: [
// Expanded(child: Center(child: Text(
// 'LOGO', style: TextStyle(fontSize: 40.sp),),)),
// Expanded(
//
// flex: 2,
// child: Container(
// padding: EdgeInsets.all(20.sp),
//
// child: Column(
//
// children: [
// Expanded(
// child: TextField(
//
// controller: emailController2,
// decoration: const InputDecoration(
//
//
// suffixIcon: Icon(Icons.email,
// color: Colors.grey,),
// hintText: 'Email'
// ),
// ),
// ),
// Expanded(
// child: TextField(
// controller: passwordController2,
// decoration: const InputDecoration(
// suffixIcon: Icon(
// Icons.key, color: Colors.grey,),
//
// hintText: 'Password'
// ),
// ),
// ),
// const Expanded(
// flex: 2,
// child: Align(
// alignment: Alignment.centerLeft,
// child: Text('Forgot Password ? '))
// ),
//
//
// Expanded(
// child: Align(
// alignment: Alignment.centerRight,
// child: InkWell(
// onTap: () {
// logIn();
// },
// child: Container(
//
// width: 250,
// decoration: BoxDecoration(
// borderRadius: BorderRadius
//     .circular(30.sp),
// gradient: LinearGradient(
// colors: [
//
// AppColors.kPinkColor,
// AppColors.kOrangeColor
// ]
//
// ),
// ),
//
// child: Center(child: Text('login',
// style: TextStyle(
// color: Colors.white,
// fontSize: 20.sp),),),
//
// ),
// ),
// ),
// )
// ],
// ),
// )),
// // Expanded(child: Container(color: Colors.yellow,)),
//
// const Spacer(),
// Expanded(
// flex: 0,
// child: Container(color: Colors.transparent,
//
// alignment: Alignment.centerRight,
//
// child: InkWell(
// onTap: () async{
// context.read<AnimatedScreensCubit>().getLoginScreen(myState: !state);
//
//
//
// // var currentState =   context.read<AnimatedScreensCubit>().state;
// //
// //
// //
// //
// //
// // icon = await getArrow(loginScreen: currentState);
// //
// // print('------------');
// // print(icon);
// // Navigator.of(context).push(
// //     MaterialPageRoute(builder: (context) {
// //       return SignUpScreen();
// //     }));
// },
// child: Container(
// margin: EdgeInsets.all(15.sp),
// alignment: Alignment.centerRight,
// width: 35.sp,
// height: 35.sp,
// decoration: BoxDecoration(
// gradient: LinearGradient(
// colors: [
//
// AppColors.kPinkColor,
// AppColors.kOrangeColor
// ]
//
// ), shape: BoxShape.circle
//
// ),
// child: Center(child: Icon(state == true ? icon : Icons.arrow_downward,
// color: Colors.white,)),
// ),
// ),
// )),
//
// ],
// ),
// ),
// ),
//
// Visibility(
// visible: keyboardIsOpened == true ? false : true,
// child: Positioned(
// bottom: 0.sp,
//
// child: SizedBox(
//
// height: 150.sp,
// width: 0.6.sw,
// // color: Colors.blue,
// child: Column(
// children: [
// Expanded(
// child: Align(
// alignment: Alignment.centerLeft,
// child: Container(width: 50.sp, height: 50.sp,
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// color: state == true ? AppColors.kPinkColor : Colors.white
// ),
// child: Center(child: FaIcon(
// FontAwesomeIcons.googlePlusG,
// color: state == true ? Colors.white : AppColors.kGmailColor, size: 25.sp,)),
//
// ),
// ),
// ),
//
//
// Expanded(
// child: Align(
// alignment: Alignment.center,
// child: Container(width: 50.sp, height: 50.sp,
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// color: state == true ? AppColors.kfacebookColor : Colors.white
// ),
// child: Center(child: FaIcon(
// FontAwesomeIcons.facebookF,
// color: state == true ? Colors.white: AppColors.kfacebookColor,
// size: 25.sp,)),
//
// ),
// ),
// ),
//
//
// Expanded(
// child: Align(
// alignment: Alignment.centerRight,
// child: Container(width: 50.sp, height: 50.sp,
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// color: state == true ?  AppColors.kBlueColor :  Colors.white
// ),
//
// child: Center(child: FaIcon(
// FontAwesomeIcons.twitter,
// color:  state == true ?  Colors.white : AppColors.kBlueColor,
// size: 25.sp,)),
// ),
// ),
// ),
// ],
// ),
//
//
// ),
// ),
// ),
// ],
// ),
// )
// ),
