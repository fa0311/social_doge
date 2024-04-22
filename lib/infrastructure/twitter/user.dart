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
    final userList = <String>{};

    Iterable<User> getDiff(TwitterApiUtilsResponse<TimelineApiUtilsResponse<UserApiUtilsData>> response) {
      return response.data.data.where((e) => userList.add(e.user.restId)).map((e) => e.user);
    }

    final response = await get(userId, null, 200);
    final diff = getDiff(response);

    yield* Stream.fromIterable(diff.map((e) => (e, null)));
    yield* limit(response).map((event) => (null, event));

    var topCursor = response.data.cursor.top?.value;
    var bottomCursor = response.data.cursor.bottom?.value;

    while (topCursor != null) {
      final response = await get(userId, topCursor, 200);
      final diff = getDiff(response);
      topCursor = diff.isEmpty ? null : response.data.cursor.top?.value;
      yield* Stream.fromIterable(diff.map((e) => (e, null)));
      yield* limit(response).map((event) => (null, event));
    }
    while (bottomCursor != null) {
      final response = await get(userId, bottomCursor, 200);
      final diff = getDiff(response);
      bottomCursor = diff.isEmpty ? null : response.data.cursor.bottom?.value;
      yield* Stream.fromIterable(diff.map((e) => (e, null)));
      yield* limit(response).map((event) => (null, event));
    }
  }
}

class TwitterGetFollower extends TwitterUser {
  TwitterGetFollower({required super.client});

  @override
  Future<TwitterApiUtilsResponse<TimelineApiUtilsResponse<UserApiUtilsData>>> get(
    String userId,
    String? cursor,
    int? count,
  ) {
    return client.getUserListApi().getFollowers(userId: userId, cursor: cursor, count: count);
  }
}

class TwitterGetFollowing extends TwitterUser {
  TwitterGetFollowing({required super.client});

  @override
  Future<TwitterApiUtilsResponse<TimelineApiUtilsResponse<UserApiUtilsData>>> get(
    String userId,
    String? cursor,
    int? count,
  ) {
    return client.getUserListApi().getFollowing(userId: userId, cursor: cursor, count: count);
  }
}
