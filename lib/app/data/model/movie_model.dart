// class MovieModel {
//
//   String? title;
//   String? director;
//   String? synopsis;
//   String? img;
//
//   MovieModel({ this.title, this.director, this.synopsis, this.img });
//
//   MovieModel.fromJson(Map<String, dynamic> json){
//       title = json['id'];
//       director = json['name'];
//       synopsis = json['synopsis'];
//       img = json['img'];
//   }
//
//   Map<String, dynamic> toJson() => {'id':title, 'director':director, 'synopsis':synopsis, 'img':img };
// }

//JSON para capturar dados da planilha

class MovieModel {
  int? id;
  String? titulo;
  String? sinopse;
  String? img;
  String? diretor;

  MovieModel({this.id, this.titulo, this.sinopse, this.img});

  MovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    sinopse = json['sinopse'];
    img = json['img'];
    diretor = json['diretor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['sinopse'] = this.sinopse;
    data['img'] = this.img;
    data['diretor'] = this.diretor;
    return data;
  }
}