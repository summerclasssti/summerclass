import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:summer_class_app/app/data/model/movie_model.dart';

const baseUrl = 'https://script.google.com/macros/s/AKfycbwpshKDbQ2U0czeq9cUGjObtJvUTBjMqt8iW-dKYV8bqWQQB-RDArNEsdCkMjI6rR2X/exec';

class MovieApiClient {
  final http.Client? httpClient;

  MovieApiClient({@required this.httpClient});

  final Map<String, String> _defaultHeaders = {
    'Content-Type': 'application/json'
  };

  Future<List<MovieModel>> getAll() async {
    try {
      final response = await httpClient!.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {

        print("Sem erro do get");

        var jsonResponse = jsonDecode(response.body);

        List<MovieModel> movieList = [];

          for (var jresp in jsonResponse){

            print("movie info ${jresp}");

            MovieModel movieModel = MovieModel();
            movieModel.id = int.parse(jresp["id"]);
            movieModel.titulo = jresp["titulo"]??"";
            movieModel.sinopse = jresp["sinopse"]??"";
            movieModel.img = jresp["img"]??"";
            movieModel.diretor = jresp["diretor"]??"";

            try {
              movieList.add(movieModel);
            } catch (e) {
              print("erro ao adicionar filme na lista");
            }

            print("Adicionados o filme ${movieList}");

          }

          return movieList;

      } else {
        print('Error -getAll');
      }
    } catch (_) {}
    return [];
  }

  // Future getId(id) async {
  //   try {
  //     final response = await httpClient.get(baseUrl);
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> jsonResponse = jsonDecode(response.body);
  //       // TODO: implement methods!
  //     } else{
  //       print('Error -getId');
  //     }
  //   } catch (_) {}
  //   return null;
  // }
  //
  // Future add(obj) async {
  //   try {
  //     final response = await httpClient.post(baseUrl,
  //         headers: _defaultHeaders, body: jsonEncode(obj));
  //     if (response.statusCode == 200) {
  //       // TODO: implement methods!
  //     } else {
  //       print('Error -add');
  //     }
  //   } catch (_) {}
  //   return null;
  // }
  //
  // Future edit(obj) async {
  //   try {
  //     final response = await httpClient.put(baseUrl,
  //         headers: _defaultHeaders, body: jsonEncode(obj));
  //     if (response.statusCode == 200) {
  //       // TODO: implement methods!
  //     } else {
  //       print('Error -edit');
  //     }
  //   } catch (_) {}
  //   return null;
  // }
  //
  // Future delete(obj) async {
  //   try {
  //     final response = await httpClient.delete(baseUrl);
  //     if (response.statusCode == 200) {
  //       // TODO: implement methods!
  //     } else {
  //       print('Error -delete');
  //     }
  //   } catch (_) {}
  //   return null;
  // }
}