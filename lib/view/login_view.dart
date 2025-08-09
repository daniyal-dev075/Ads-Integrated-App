import 'dart:developer';

import 'package:ads_integrated_app/res/components/banner_ad_widget.dart';
import 'package:ads_integrated_app/utils/ad_helper.dart';
import 'package:ads_integrated_app/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../res/components/custom_button.dart';
import '../res/components/custom_text_form_field.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop(); // This will close the app
        return false; // Prevent default back navigation
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 80.h),
                        Center(
                          child: Image(
                            height: 70.h,
                            width: 70.w,
                            image: AssetImage('images/admob_logo.png'),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Center(
                          child: Text(
                            'Welcome back',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Email',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h,),
                        CustomTextFormField(
                          controller: emailController,
                          hintText: 'Enter your email',
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                        SizedBox(height: 20.h),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Password',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h,),
                        CustomTextFormField(
                          controller: passwordController,
                          hintText: 'Enter your Password',
                          prefixIcon: Icon(Icons.lock_open),
                          isPassword: true,
                        ),
                        SizedBox(height: 4.h),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        SizedBox(height: 80.h),
                        CustomButton(
                          title: 'Log In',
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (_) => HomeView()));
                          }),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an Account?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp
                              ),
                            ),
                            SizedBox(width: 2.h,),
                            InkWell(
                                onTap: (){
                                },
                                child: Text('Sign Up',style: TextStyle(color: Colors.teal,fontSize: 16.sp,fontWeight: FontWeight.bold)))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                BannerAdWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
