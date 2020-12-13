class Movie {
  Movie({this.title, this.rating, this.year, this.runtime, this.iconLink});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json['title'] as String,
        rating: json['rating'] as num,
        year: json['year'] as num,
        runtime: json['runtime'] as num,
        iconLink: json['medium_cover_image'] as String);
  }

  String title;
  num rating;
  num year;
  num runtime;
  String iconLink;
}
