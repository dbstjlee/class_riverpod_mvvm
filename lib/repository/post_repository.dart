

import 'package:class_riverpod_mvvm/models/post.dart';

abstract class PostRepository{

  // 모든 게시글 모록을 가져온다.
  Future<List<Post>> fetchPosts();
  // 새로운 게시글을 생성한다.
  Future<Post> createPost(Post post);
  // 기본게시글을 수정한다.
  Future<Post> updatePost(Post post);
  // 특정 게시글을 삭제한다. 게시글 pk
  Future<void> deletePost(int id);
  // 특정 게시글 하나를 요청한다. 게시글 Pk
  Future<Post> fetchPostById(int id);

}