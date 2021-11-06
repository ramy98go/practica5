class RickAndMortyModel {
  String? name;
  int? id;
  String? species;
  String? gender;
  String? image;

  RickAndMortyModel({
    this.name,
    this.id,
    this.species,
    this.gender,
    this.image
});

  factory RickAndMortyModel.fromMap(Map<String, dynamic> map){
    return RickAndMortyModel(
          name        : map['name'],
          id          : map['id'],
          species     : map['species'],
          gender      : map['gender'],
          image       : map['image'] ?? "",
    );
  }

}