import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mohafez_elwaheen_teacher/persintaion/ui/login_screen/login_screen.dart';

import '../../../core/helpers/helper_functions.dart';
import '../home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      if (isLogin()) {
        pushPage(context, const HomeScreen());
      } else {
        pushPage(context, const LoginScreen());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 100,
            width: 100,
            child: Image.asset(
              "assets/images/logo.png",
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          ),
        )
      ]),
    );
  }
}
