class Community {
  int? id;
  String? title;
  String? content;
  String? name;

  Community({this.id, this.title, this.content, this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'title': title,
      'content': content,
    };
  }
}
