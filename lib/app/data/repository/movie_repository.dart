import 'package:meta/meta.dart';
import 'package:summer_class_app/app/data/providers/api.dart';

class MovieRepository {
  final MovieApiClient? apiClient;

  MovieRepository({@required this.apiClient}) : assert(apiClient != null);

  Future getAll() {
    return apiClient!.getAll();
  }

  // getId(id) {
  //   return apiClient.getId(id);
  // }
  //
  // delete(id) {
  //   return apiClient.delete(id);
  // }
  //
  // edit(obj) {
  //   return apiClient.edit(obj);
  // }
  //
  // add(obj) {
  //   return apiClient.add(obj);
  // }
}

