class Superhero {
  final String id;
  final String name;
  final Powerstats powerstats;
  final Appearance appearance;
  final Image image;

  Superhero(
      {required this.id,
      required this.name,
      required this.powerstats,
      required this.appearance,
      required this.image});

  Superhero.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        powerstats = Powerstats.fromJson(json['powerstats']),
        appearance = Appearance.fromJson(json['appearance']),
        image = Image.fromJson(json['image']);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'intelligence': powerstats.intelligence,
      'gender': appearance.gender,
      'url': image.url
    };
  }

  static Superhero fromMap(Map<String, dynamic> map) {
    return Superhero(
        id: map['id'],
        name: map['name'],
        powerstats: Powerstats(intelligence: map['intelligence']),
        appearance: Appearance(gender: map['gender']),
        image: Image(url: map['url']));
  }
}

class Powerstats {
  final String intelligence;

  const Powerstats({
    required this.intelligence,
  });

  Powerstats.fromJson(Map<String, dynamic> json)
      : intelligence = json['intelligence'];
}

class Appearance {
  final String gender;

  const Appearance({
    required this.gender,
  });

  Appearance.fromJson(Map<String, dynamic> json) : gender = json['gender'];
}

class Image {
  final String url;

  const Image({
    required this.url,
  });

  Image.fromJson(Map<String, dynamic> json) : url = json['url'];
}
