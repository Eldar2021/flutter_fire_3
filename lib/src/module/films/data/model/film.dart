class Film {
  Film({
    required this.title,
    required this.year,
    required this.photos,
  });

  final String title;
  final int year;
  final String photos;

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      title: json['title'] as String,
      year: json['year'] as int,
      photos: json['photos'] as String,
    );
  }

  Map toJson() => <String, dynamic>{
        'title': title,
        'year': year,
        'photos': photos,
      };
}
