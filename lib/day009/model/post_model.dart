class Post {
  int? id;
  int? userId;
  String? title;
  String? body;

  Post();

  // Post(this.id, this.userId, this.title, this.body);

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'title': title,
        'body': body,
      };
}
