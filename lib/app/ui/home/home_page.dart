import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summer_class_app/app/controllers/home_controller.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';


class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filmes nacionais'), centerTitle: true,),
      body: GetBuilder<HomeController>(
          //init: HomeController(),
          builder: (_) {
            return VerticalCardPager(
              initialPage: 1,
              titles: const <String>["","",""],
              images: controller.images,
              onSelectedItem: controller.onSelectedItem,
            );
          }),
    );
  }
}
