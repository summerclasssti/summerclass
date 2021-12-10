import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summer_class_app/app/data/model/movie_model.dart';
import 'package:summer_class_app/app/data/repository/movie_repository.dart';
import 'package:summer_class_app/app/routes/app_pages.dart';

class HomeController extends GetxController {

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
  bool? isLoading;
  List<MovieModel> movieList = [];
  final MovieRepository? movieRepository;
  HomeController({@required this.movieRepository}) : assert(movieRepository != null);

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  final List<String?> titles = [];
  final List<Widget> images = [];
  final List<String?> imgUrl = [];

  // final List<String> titles = [
  //   "Tropa de Elite",
  //   "O Auto da Compadecida",
  //   "Cidade de Deus"
  // ];
  //
  // final List<Widget> images = [
  //   Hero(
  //     tag: 1,
  //     child: ClipRRect(
  //       borderRadius: BorderRadius.circular(20.0),
  //       child: Image.network(
  //         "https://m.media-amazon.com/images/M/MV5BMDM1MGI1YzktOTEyZS00YzcxLWFmOTQtZjc5OWJhNGZlOTI5XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_FMjpg_UY720_.jpg",
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   ),
  //   Hero(
  //     tag: 2,
  //     child: ClipRRect(
  //       borderRadius: BorderRadius.circular(20.0),
  //       child: Image.network(
  //         "https://br.web.img3.acsta.net/r_1920_1080/pictures/210/416/21041683_20130919124706739.jpg",
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   ),
  //   Hero(
  //     tag: 3,
  //     child: ClipRRect(
  //       borderRadius: BorderRadius.circular(20.0),
  //       child: Image.network(
  //         "https://br.web.img3.acsta.net/r_1920_1080/medias/nmedia/18/87/02/76/19871246.jpg",
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   ),
  // ];
  //
  // final List<String> imgUrlList = [
  //   "https://m.media-amazon.com/images/M/MV5BMDM1MGI1YzktOTEyZS00YzcxLWFmOTQtZjc5OWJhNGZlOTI5XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_FMjpg_UY720_.jpg",
  //   "https://br.web.img3.acsta.net/r_1920_1080/pictures/210/416/21041683_20130919124706739.jpg",
  //   "https://br.web.img3.acsta.net/r_1920_1080/medias/nmedia/18/87/02/76/19871246.jpg"
  // ];

  void onSelectedItem(int index) {
    Get.toNamed(Routes.DETAILS, arguments: {"index":index, "img":imgUrl[index]});
  }

  void fetchData() {
    isLoading = true;
    update();
    // movieList = movieRepository?.getAll();
    movieRepository?.getAll().then((value) {
      movieList = value;

      print("Lista de filmes $movieList");

      fillMovieInfo(movieList);
      isLoading = false;
      update();
    });
    //call repo to fetch data.
    // Future.delayed(const Duration(seconds: 1)).then((value) {
    //   isLoading = false;
    //   update();
    // });
  }

  void fillMovieInfo(List<MovieModel> movieList) {

    int i = 1;

    for(MovieModel movie in movieList ){

      titles.add(movie.titulo);
      imgUrl.add(movie.img);
      images.add(Hero(
              tag: i,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  movie.img!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
      );
      i++;


    }

  }
}
