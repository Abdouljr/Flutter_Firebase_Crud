class Film {
  String nom;
  String image;
  String annee;
  int like;
  List<String> categories;

  Film(
      {required this.nom,
      required this.image,
      required this.like,
      required this.annee,
      this.categories = const []});

  Map<String, dynamic> toJson() {
    return {
      "nom": nom,
      "image": image,
      "annee": annee,
      "likes": like,
      "categories": categories,
    };
  }
}
