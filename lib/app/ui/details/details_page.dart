import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summer_class_app/app/controllers/details_controller.dart';
import 'package:summer_class_app/app/controllers/home_controller.dart';


class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    //debugPrint(Get.find<HomeController>().titles[Get.arguments["index"]]);
    return Scaffold(
      backgroundColor: const Color(0xff000913),
      appBar: AppBar(title: const Text('Sobre o Filme'), centerTitle: true,),
      body: GetBuilder<DetailsController>(
          init: DetailsController(),
          builder: (_) {
            return ListView(
              children: [
                Stack(
                  children: [
                    Hero(
                      tag: Get.arguments["index"],
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xff000913), Colors.transparent],
                          ).createShader(Rect.fromLTRB(
                              0, 0, rect.width, rect.height));
                        },
                        blendMode: BlendMode.dstIn,
                        child: Image.network(
                          Get.arguments["img"],
                          fit: BoxFit.fitWidth,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Get
                        .find<HomeController>()
                        .titles[Get.arguments["index"]], style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),),
                    IconButton(
                      onPressed: _.onPressedLikeBtn,
                      icon: GetX<DetailsController>(
                        builder: (_) {
                        return Icon(_.likedMovie ? Icons.favorite : Icons
                            .favorite_border);
                      },
                    ), color: Colors.red,)
                  ],
                ),
                const Text("Movie Director", style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                    fontSize: 12)),
                const SizedBox(height: 20,),
                const Text(
                    "Movie info here. THis is a big Text example THis is a big Text example THis is a big Text example THis is a big Text example THis is a big Text example THis is a big Text example THis is a big Text example THis is a big Text example THis is a big Text example THis is a big Text example",
                    style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)
                )
              ],
            );
          }),
    );
  }
}
