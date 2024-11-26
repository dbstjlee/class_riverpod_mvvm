
import 'package:equatable/equatable.dart';

class Post extends Equatable {

  final int? userId;
  final int? id;
  final String title;
  final String body;

  Post({this.userId, this.id, required this.title, required this.body});

  // Json 데이터를 Post 객체로 변환하는 생성자를 생성
  // 이름이 있는 생성자
  Post.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        body = json['body'];

  // Post 객체를 JSON 형식으로 변환하는 메서드를 만들자
  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id' : id, 'title' : title, 'body' : body };
  }

  @override
  List<Object?> get props => [userId, id, title, body];
}