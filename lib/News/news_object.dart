class MenuObject {
  final int id;
  final String title;
  final String description;
  final String picture;
  final String note;
  MenuObject(
      {required this.id,
      required this.title,
      required this.description,
      required this.picture,
      required this.note,
      });
  MenuObject.fromJson(Map<String, dynamic> res)
      : id = res['id'],
        title = res['title'],
        description = res['description'],
        picture = res['picture'],
        note = res['note'];

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'picture': picture,
      'note' : note,
    };
  }
}
