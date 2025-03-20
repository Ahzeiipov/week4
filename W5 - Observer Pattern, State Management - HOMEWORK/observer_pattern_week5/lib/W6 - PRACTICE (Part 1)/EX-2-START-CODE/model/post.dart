class Post {
  final int id;
  final String title;
  final String description;

  Post({required this.id, required this.title, required this.description});

  factory Post.fromJson(Map<String, dynamic> json) {
    assert(json['id'] is int);
    assert(json['title'] is String);
    assert(json['body'] is String);

    return Post(
        id: json['id'], title: json['title'], description: json['body']);
  }
}
