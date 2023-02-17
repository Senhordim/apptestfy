class PostModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel(this.userId, this.id, this.title, this.body);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      json['userId'],
      json['id'],
      json['title'],
      json['body'],
    );
  }

  @override
  String toString() {
    return "UserId -> $userId, Id -> $id, Title -> $title, body -> $body"
        .toString();
  }
}
