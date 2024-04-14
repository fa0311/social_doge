import 'package:twitter_openapi_dart/twitter_openapi_dart.dart';
import 'package:twitter_openapi_dart_generated/twitter_openapi_dart_generated.dart';

abstract class TwitterUser {
  TwitterUser({required this.client});
  final TwitterOpenapiDartClient client;

  Future<TwitterApiUtilsResponse<TimelineApiUtilsResponse<UserApiUtilsData>>> get(
    String userId,
    String? cursor,
    int? count,
  );

  int secondsSinceEpoch() {
    return DateTime.now().millisecondsSinceEpoch ~/ 1000;
  }

  Stream<int> limit(TwitterApiUtilsResponse<void> response) async* {
    while (response.header.rateLimitRemaining < 5 && response.header.rateLimitReset - secondsSinceEpoch() > 0) {
      yield response.header.rateLimitReset - secondsSinceEpoch();
      await Future<void>.delayed(const Duration(seconds: 1));
    }
  }

  Stream<(User?, int?)> stream(String userId) async* {
    final response = await get(userId, null, 200);
    yield* Stream.fromIterable(response.data.data.map((e) => (e.user, null)));
    yield* limit(response).map((event) => (null, event));

    var topCursor = response.data.cursor.top?.value;
    var bottomCursor = response.data.cursor.bottom?.value;
    final userList = <String>{};

    while (topCursor != null) {
      final response = await get(userId, topCursor, 200);
      final userListLen = userList.length;
      userList.addAll(response.data.data.map((e) => e.user.restId));
      topCursor = userListLen < userList.length ? response.data.cursor.top?.value : null;
      yield* Stream.fromIterable(response.data.data.map((e) => (e.user, null)));
      yield* limit(response).map((event) => (null, event));
    }
    while (bottomCursor != null) {
      final response = await get(userId, bottomCursor, 200);
      final userListLen = userList.length;
      userList.addAll(response.data.data.map((e) => e.user.restId));
      bottomCursor = userListLen < userList.length ? response.data.cursor.bottom?.value : null;
      yield* Stream.fromIterable(response.data.data.map((e) => (e.user, null)));
      yield* limit(response).map((event) => (null, event));
    }
  }
}

class TwitterGetFollowers extends TwitterUser {
  TwitterGetFollowers({required super.client});

  @override
  Future<TwitterApiUtilsResponse<TimelineApiUtilsResponse<UserApiUtilsData>>> get(
    String userId,
    String? cursor,
    int? count,
  ) {
    return client.getUserListApi().getFollowers(userId: userId, cursor: cursor, count: count);
  }
}

class TwitterGetFriends extends TwitterUser {
  TwitterGetFriends({required super.client});

  @override
  Future<TwitterApiUtilsResponse<TimelineApiUtilsResponse<UserApiUtilsData>>> get(
    String userId,
    String? cursor,
    int? count,
  ) {
    return client.getUserListApi().getFollowing(userId: userId, cursor: cursor, count: count);
  }
}
