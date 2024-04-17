import 'package:freezed_annotation/freezed_annotation.dart';

part 'data.freezed.dart';

enum SynchronizeMode { following, follower }

@freezed
class UserTableData with _$UserTableData {
  const factory UserTableData({
    required String twitterId,
    required String screenName,
    required String name,
    required String description,
    required String profileImageUrl,
    required String? profileBannerUrl,
    required int followerCount,
    required int followingCount,
    required DateTime createdAt,
    required DateTime lastUpdated,
  }) = _UserTableDataFreezed;
}

@freezed
class UserStatusData with _$UserStatusData {
  const factory UserStatusData({
    required int key,
    required String twitterId,
    required String selfTwitterId,
    required DateTime time,
  }) = _UserStatusDataFreezed;
}

@freezed
class SyncStatusData with _$SyncStatusData {
  const factory SyncStatusData({
    required int key,
    required String selfTwitterId,
    required DateTime time,
    required int count,
  }) = _SyncStatusDataFreezed;
}
