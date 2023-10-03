import 'package:biometrics/Controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final splashCntlr = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: GetBuilder<SplashController>(
          builder: (_) {
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.fingerprint,
                      size: 120,
                      color: Colors.greenAccent,
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Biometrics",
                      style: TextStyle(
                          // color: Colors.white,
                          color: Colors.greenAccent,
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 6),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
