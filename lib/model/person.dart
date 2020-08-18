
class Person {
  final int id;
  final String name;
  final String popularity;
  final String profileImg;
  final String known;

  Person(this.id,
      this.name,
      this.popularity,
      this.profileImg,
      this.known);

  Person.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        popularity = json["popularity"],
        name = json["name"],
        profileImg = json["profile_path"],
        known = json["knwon_for_department"];

}