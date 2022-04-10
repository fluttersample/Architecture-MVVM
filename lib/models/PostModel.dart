

class PostModel{

  final int? userId;
  final int? id;
  final String title;
  final String body;

  const PostModel({
    this.userId,
    this.id,
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': this.userId,
      'id': this.id,
      'title': this.title,
      'body': this.body,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }
}