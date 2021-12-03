class MovieModel {

  String? title;
  String? director;
  String? synopsis;
  String? img;

  MovieModel({ this.title, this.director, this.synopsis, this.img });

  MovieModel.fromJson(Map<String, dynamic> json){
      title = json['id'];
      director = json['name'];
      synopsis = json['synopsis'];
      img = json['img'];
  }

  Map<String, dynamic> toJson() => {'id':title, 'director':director, 'synopsis':synopsis, 'img':img };
}