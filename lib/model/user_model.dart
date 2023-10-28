class UsersList {
  int? id;
  int? userId;
  String? title;
  String? body;
  UsersList({
    required this.id,
    required this.title,
    required this.userId,
    required this.body,
  });

  UsersList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    userId = json['userId'];
    body = json['body'];
  }
}
