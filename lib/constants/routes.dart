import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/auth_screens/sign_in.dart';
import 'package:flutter_application_2/widgets/auth_screens/sign_up.dart';


class AppRoutes {
  static const String signIn = '/signin';
  static const String signUp = '/signup';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      signIn: (context) => const SignIn(),
      signUp: (context) => const SignUp(),
    };
  }
}
