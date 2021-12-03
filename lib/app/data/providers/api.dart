import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:summer_class_app/app/data/model/movie_model.dart';

const baseUrl = 'http://gerador-nomes.herokuapp.com/nomes/10';

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
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        return jsonResponse['data']
            .map((json) => MovieModel.fromJson(json))
            .toList();
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