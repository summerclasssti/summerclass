import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DetailsController extends GetxController {

  // final _obj = ''.obs;
  // set obj(value) => _obj.value = value;
  // get obj => _obj.value;

  final _likedMovie = false.obs;
  get likedMovie => _likedMovie.value;
  set likedMovie(value) => _likedMovie.value = value;

  void onPreesedBackBtn() {
    Get.back();
  }

  void onPressedLikeBtn() {
    likedMovie = !likedMovie;
  }
}