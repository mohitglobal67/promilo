import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promilo/config/color/color.dart';
import 'package:promilo/config/textstyle/text_style.dart';
import 'package:promilo/utils/enum.dart';
import 'package:promilo/utils/flushbar.dart';
import 'package:promilo/utils/routes/routes_name.dart';
import 'package:promilo/view/login/bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();

  late LoginBloc _loginBloc;

  final emailfocusnode = FocusNode();
  final passwordfocusnode = FocusNode();

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("promilo", style: h2TextStyle(AppColors.blackColor)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BlocProvider(
        create: (context) => _loginBloc,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0.sp),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),
                  Center(
                      child: Text('Hi, Welcome Back!',
                          style: h2TextStyle(AppColors.textcolor))),
                  SizedBox(height: 30.h),
                  Text('Please Sign in to continue',
                      style: textRegular(AppColors.textcolor)),
                  SizedBox(height: 8.h),
                  BlocBuilder<LoginBloc, LoginState>(
                    buildWhen: (previous, current) =>
                        current.email != previous.email,
                    builder: (context, state) {
                      return TextFormField(
                        onChanged: (value) {
                          context
                              .read<LoginBloc>()
                              .add(EmailChange(email: value));
                        },
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                        obscureText: false,
                        focusNode: emailfocusnode,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Enter Email Or Mob. No.',
                          hintStyle: text2Regular(AppColors.blackColor),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text('Sign In With OTP',
                        style: textRegular(AppColors.primarymaincolor)),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text("Password", style: textRegular(AppColors.textcolor)),
                  SizedBox(
                    height: 8.h,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    buildWhen: (previous, current) =>
                        current.password != previous.password,
                    builder: (context, state) {
                      return TextFormField(
                        onChanged: (value) {
                          context
                              .read<LoginBloc>()
                              .add(PasswordChange(password: value));
                        },
                        obscureText: true,
                        focusNode: passwordfocusnode,
                        decoration: InputDecoration(
                          hintText: 'Enter Password',
                          hintStyle: text2Regular(AppColors.blackColor),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.greyColor),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.w,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2.w,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(value: false, onChanged: (bool? value) {}),
                          Text('Remember Me',
                              style: text2Regular(AppColors.blackColor)),
                        ],
                      ),
                      Text('Forget Password',
                          style: textRegular(AppColors.primarymaincolor)),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  BlocListener<LoginBloc, LoginState>(
                    listenWhen: (previous, current) =>
                        current.postApiStatus != previous.postApiStatus,
                    listener: (context, state) {
                      if (state.postApiStatus == PostApiStatus.error) {
                        context.flushBarErrorMessage(
                            message: state.message
                                .split("message")[1]
                                .trim()
                                .split("}")[0]
                                .split(":")[1]
                                .toString());
                      }

                      if (state.postApiStatus == PostApiStatus.success) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RoutesName.bottomnav,
                          (routes) => false,
                        );

                        context.flushBarSuccessMessage(
                            message: state.message.toString());
                      }
                    },
                    child: Center(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                        ),
                        child: BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            bool isFormValid = state.email.isNotEmpty &&
                                state.password.isNotEmpty;
                            return ElevatedButton(
                              onPressed: isFormValid
                                  ? () {
                                      if (_formkey.currentState!.validate()) {
                                        context
                                            .read<LoginBloc>()
                                            .add(LoginApi());
                                      }
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isFormValid
                                    ? AppColors.primarymaincolor
                                    : Colors.grey,
                                padding: EdgeInsets.all(15.r),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: state.postApiStatus ==
                                      PostApiStatus.loading
                                  ? const Center(
                                      heightFactor: 0.5,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: AppColors.whiteColor,
                                      ))
                                  : Text("Submit",
                                      style: textRegular(AppColors.whiteColor)),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const Center(child: Text('or')),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 15.h,
                      ),
                      IconButton(
                        icon: Image.asset(
                          'assets/images/google.png',
                          height: 40,
                          width: 40,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Image.asset(
                          'assets/images/linkedin.png',
                          height: 40.h,
                          width: 40.w,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Image.asset(
                          'assets/images/facebook.png',
                          height: 40.h,
                          width: 40.w,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Image.asset(
                          'assets/images/instagram.png',
                          height: 40.h,
                          width: 40.w,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Image.asset(
                          'assets/images/whatsapp.png',
                          height: 40.h,
                          width: 40.w,
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Business User? ',
                            style: text2Regular(AppColors.textcolor)),
                        Text('Don’t have an account?',
                            style: text2Regular(AppColors.textcolor)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Login Here ',
                            style: textRegular(AppColors.primarymaincolor)),
                        Text('Sign Up',
                            style: textRegular(AppColors.primarymaincolor)),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'By continuing, you agree to\n',
                        style: text2Regular(AppColors.greyColor),
                        children: [
                          TextSpan(
                            text: 'Promilo\'s',
                            style: text2Regular(AppColors.greyColor),
                          ),
                          TextSpan(
                            text: 'Terms of Use & Privacy Policy.',
                            style: text2Regular(AppColors.blackColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
