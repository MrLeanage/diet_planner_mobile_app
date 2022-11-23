import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/Pages/IT19204062/home.dart';
import 'package:mobile_app/Pages/IT19204062/login.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(children: [Image.asset("images/logo_icon.png")]),
      backgroundColor: Color(int.parse('0xff01C0BB')),
      nextScreen: const Login(),
      splashIconSize: 300,
      duration: 3000,
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds: 1),
    );
  }
}
