import 'package:flutter/material.dart';
import 'package:guess_number/Util/extension.dart';
import 'package:guess_number/Util/sharePref.dart';
import 'package:guess_number/main.dart';
import 'package:guess_number/ui/root.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        SharedPref.getLang().then((value) {
          debugPrint(" lang is $value");
          MyApp.setLocal(context, value);
          context.navigateAndRemove(const Root());
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Image.asset(
      'assets/images/guessnumber.webp',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fitWidth,
    ));
  }
}
