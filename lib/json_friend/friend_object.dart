class MenuObject {
  final int id;
  final String name;
  final String rank;
  final String description;
  final String picture;
  MenuObject(
      {required this.id,
      required this.name,
      required this.rank,
      required this.description,
      required this.picture});
  MenuObject.fromJson(Map<String, dynamic> res)
      : id = res['id'],
        name = res['name'],
        rank = res['rank'],
        description = res['description'],
        picture = res['picture'];

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'price': rank,
      'description': description,
      'picture': picture,
    };
  }
}
