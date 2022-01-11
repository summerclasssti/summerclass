import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summer_class_app/app/data/model/movie_model.dart';
import 'package:summer_class_app/app/data/repository/movie_repository.dart';
import 'package:summer_class_app/app/routes/app_pages.dart';

class HomeController extends GetxController {

  //Usada para mostrar circular progress na HomePage.
  bool isLoading = true;

  //Lista de filmes (MovieModel)
  List<MovieModel> movieList = [];
  final MovieRepository? movieRepository;
  HomeController({@required this.movieRepository}) : assert(movieRepository != null);

  //Função executada assim que o controlador é iniciado.
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  //Lista de imagens utilizada no VerticalCardPager
  List<Widget> images = [];

  void onSelectedItem(int index) {
    Get.toNamed(Routes.DETAILS, arguments: {"movie_info":movieList[index], "tag": index+1});
  }

  void fetchData() {
    movieRepository?.getAll().then((value) {
      movieList = value;
      fillMovieInfo(movieList);
      isLoading = false;
      update();
    });
  }

  void fillMovieInfo(List<MovieModel> movieList) {
    int i = 1;
    for(MovieModel movie in movieList ){
      images.add(
        Hero(
              tag: i,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  movie.img,
                  fit: BoxFit.cover,
                ),
              ),
            ),);
      i++;

    }

  }

  void reloadData() {
    isLoading = true;
    update();
    images = [];
    fetchData();
  }
}
