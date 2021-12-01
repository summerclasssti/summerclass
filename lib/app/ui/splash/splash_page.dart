import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summer_class_app/app/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Splash Page')),
      body: GetBuilder<SplashController>(
          init: SplashController(),
          builder: (_) {
            return Container();
          }),
    );
  }
}
