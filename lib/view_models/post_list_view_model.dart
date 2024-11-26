
// 리버팟 중에 notifier 계열이 상태 관리를 담당해주는 클래스이다.

import 'package:class_riverpod_mvvm/models/post.dart';
import 'package:class_riverpod_mvvm/repository/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateNotifier
// 1. 멤버 변수로 T state 변수를 가지고 있다.
// 2. 캡슐화에 핵심이다.
class PostListViewModel extends StateNotifier<List<Post>> {

  // 통신 요청을 통해서 데이터를 가져오는 비즈니스 로직을 담당 시킬꺼다.
  final PostRepository _postRepository;
  // T state --> List<Post> <---
  // 맨 처음 부모클래스 StateNotifier 를 가지고 있는 PostListViewModel 에 상태는
  // 당연히 빈 값을 들고 있다.
  PostListViewModel(this._postRepository) : super([]){
    // 통신 요청이 아니라 나의 비즈니스 로직을 호출
    fetchPosts(); // 나의 클래스의 멤버함수 호출
  }

  // 비즈니스 로직
  Future<void> fetchPosts() async {
    // List<Post> = []
    try {
      final posts = await _postRepository.fetchPosts();
      // List<Post>
      state = posts;
    } catch(e) {
      // List<Post>
      state = [];
    }
  }

  // 삭제하는 비즈니스 로직을 만들어 보자.
  Future<void> deletePost(int id) async {
    try {
      await _postRepository.deletePost(id);
      // 리스트 10개중에 1개를 삭제 했음 --> List<Post> 값 상태가 변경이 되었다.
      // state --> [ Post() , Post (), Post () ];
      // 상태가 변경이 되면 새로운 리스트 객체를 state 변수에 넣어 주어야
      // 아 생태가 변경이 되었구나 확인해서 화면을 자동으로 갱신해 준다.
      // state --> [ Post() , '삭제' Post () ];
      state = state.where( (post) => post.id != id ).toList(); // 새로운 리스트 객체가 생성
      print("삭제 완료");
    } catch (e) {
      print('삭제 실패 : $e');
    }

  }



}