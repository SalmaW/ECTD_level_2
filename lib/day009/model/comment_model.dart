class Comment {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  Comment();

  Comment.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() =>
      {'postId': postId, 'id': id, 'name': name, 'email': email, 'body': body};
}
