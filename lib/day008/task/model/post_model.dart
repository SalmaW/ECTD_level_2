class Post {
  int? id;
  int? userId;
  String? title;
  String? body;

  Post(
      {required this.id,
      required this.userId,
      required this.title,
      required this.body});

  // Post(this.id, this.userId, this.title, this.body);

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'title': title,
        'body': body,
      };
}
