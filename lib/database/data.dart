import 'package:freezed_annotation/freezed_annotation.dart';
part 'data.freezed.dart';

@freezed
class UserTableData with _$UserTableData {
  const factory UserTableData({
    required String twitterId,
    required String screenName,
    required String name,
    required String description,
    required String profileImageUrl,
    required String? profileBannerUrl,
    required int followersCount,
    required int friendsCount,
    required DateTime createdAt,
    required DateTime lastUpdated,
  }) = _UserTableDataFreezed;
}
