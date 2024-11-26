




import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Http 통신을 위한 Dio 인스턴스를 굳이 매번 생성할 필요가 없다
/// 그래서 싱글톤 인스턴을 생성해서 애플리케이션 전역에서 재사용 하기로 한다.

//전역에서 재사용 가능한 Dio  싱글톤 인스턴스를 제공합니다.
final dioProvider = Provider<Dio>((ref){
  return _dioInstance;
});
final Dio _dioInstance =  Dio(
  BaseOptions(
    baseUrl: 'https://jsonpalceholder.typicode.com',
    connectTimeout: const Duration(seconds: 5), // 연결 시간 초과
    receiveTimeout: const Duration(seconds: 3), // 응답 시간 초과
    validateStatus: (status) => true, // 모든 상태 코드를 허용하여 예외를 발생시키지 않음
    headers: {
      'Content-Type' : 'application/json',// 요청 헤더 설정
  // 필요한 경우 'Autorization' : Be ...... 토큰 값
  }
  )
);