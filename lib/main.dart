import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/main_navigation.dart';
import 'package:flutter_application_2/widgets/auth_screens/forget_password.dart';
import 'package:flutter_application_2/widgets/auth_screens/new_password.dart';
import 'package:flutter_application_2/widgets/auth_screens/otp_code_verification.dart';
import 'package:flutter_application_2/widgets/auth_screens/sign_in.dart';
import 'package:flutter_application_2/widgets/auth_screens/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Leaderboord ',
      theme: ThemeData(primaryColor: Colors.black, brightness: Brightness.dark),
      home: MainNavigation(),
      initialRoute: '',
      routes: {
        '/login': (context) => const SignIn(),
        '/signup': (context) => const SignUp(),
        '/forgot-password': (context) => const ForgetPassword(),
        '/new-password': (context) => const NewPassword(),
        '/otp-code-verification':(context)=> const OtpCodeVerification()
      },
    );
  }
}
