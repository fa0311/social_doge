// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:social_doge/infrastructure/social_doge_api/converter/type.dart';

part 'generated/main.freezed.dart';
part 'generated/main.g.dart';

@freezed
class Instruction with _$Instruction {
  const Instruction._();

  const factory Instruction.timelineAddEntry({
    @JsonKey(name: 'type') @InstructionsTypeConverter() required InstructionsType type,
    @JsonKey(name: 'entries') required List<dynamic> entries,
  }) = _TimelineAddEntries;

  const factory Instruction.timelineTerminateTimeline({
    @JsonKey(name: 'type') @InstructionsTypeConverter() required InstructionsType type,
    @JsonKey(name: 'direction') @InstructionsTypeConverter() required String direction, //enum
  }) = _TimelineTerminateTimeline;

  const factory Instruction.timelineClearCache({
    @JsonKey(name: 'type') @InstructionsTypeConverter() required InstructionsType type,
  }) = _TimelineClearCache;

  factory Instruction.fromJson(Map<String, dynamic> json) => _$InstructionFromJson(json);
}

@freezed
class TimelineAddEntry with _$TimelineAddEntry {
  const factory TimelineAddEntry({
    @JsonKey(name: 'entryId') required String entryId,
    @JsonKey(name: 'sortIndex') required String entry,
    @JsonKey(name: 'content') required Content content,
  }) = _TimelineAddEntry;

  factory TimelineAddEntry.fromJson(Map<String, dynamic> json) => _$TimelineAddEntryFromJson(json);
}

@freezed
class Content with _$Content {
  const Content._();

  const factory Content.timelineTimelineItem({
    @JsonKey(name: 'entryType') @EntryTypeConverter() required InstructionsType entryType,
    @JsonKey(name: '__typename') @EntryTypeConverter() required InstructionsType type,
    @JsonKey(name: 'itemContent') required dynamic itemContent,
    @JsonKey(name: 'clientEventInfo') required dynamic clientEventInfo,
  }) = _TimelineTimelineItem;

  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);
}

@freezed
class ItemContent with _$ItemContent {
  const ItemContent._();

  const factory ItemContent.timelineUser({
    @JsonKey(name: 'itemType') @ItemTypeConverter() required InstructionsType itemType,
    @JsonKey(name: '__typename') @ItemTypeConverter() required InstructionsType type,
    @JsonKey(name: 'user_results') required Result userResults,
  }) = _TimelineUser;

  factory ItemContent.fromJson(Map<String, dynamic> json) => _$ItemContentFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    @JsonKey(name: 'result') required User result,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: '__typename') @TypenameConverter() required Typename typename,
    @JsonKey(name: 'affiliates_highlighted_label') required dynamic affiliatesHighlightedLabel,
    @JsonKey(name: 'has_graduated_access') required bool hasGraduatedAccess,
    // @JsonKey(name: 'has_nft_avatar') required bool hasNftAvatar,
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'is_blue_verified') required bool isBlueVerified,
    @JsonKey(name: 'legacy') required UserLegacy legacy,
    @JsonKey(name: 'rest_id') required String restId,
    // @JsonKey(name: 'super_follow_eligible') required bool superFollowEligible,
    // @JsonKey(name: 'super_followed_by') required bool superFollowedBy,
    // @JsonKey(name: 'super_following') required bool superFollowing,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class UserLegacy with _$UserLegacy {
  const UserLegacy._();
  const factory UserLegacy({
    // @JsonKey(name: 'blocked_by') required bool blockedBy,
    @JsonKey(name: 'blocking') required dynamic blocking,
    @JsonKey(name: 'can_dm') required bool canDm,
    @JsonKey(name: 'can_media_tag') required bool canMediaTag,
    @JsonKey(name: 'created_at') required String createdAt, // Sun Sep 19 10:49:08 +0000 2021
    @JsonKey(name: 'default_profile') required bool defaultProfile,
    @JsonKey(name: 'default_profile_image') required bool defaultProfileImage,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'entities') required dynamic entities,
    @JsonKey(name: 'fast_followers_count') required int fastFollowersCount,
    @JsonKey(name: 'favourites_count') required int favouritesCount,
    // @JsonKey(name: 'follow_request_sent') required bool followRequestSent,
    @JsonKey(name: 'followed_by', defaultValue: false) required bool followedBy, // ?
    @JsonKey(name: 'followers_count') required int followersCount,
    @JsonKey(name: 'following', defaultValue: false) required bool following, // ?
    @JsonKey(name: 'friends_count') required int friendsCount,
    @JsonKey(name: 'has_custom_timelines') required bool hasCustomTimelines,
    @JsonKey(name: 'is_translator') required bool isTranslator,
    @JsonKey(name: 'listed_count') required int listedCount,
    @JsonKey(name: 'location') required String location,
    @JsonKey(name: 'media_count') required int mediaCount,
    // @JsonKey(name: 'muting') required bool muting,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'normal_followers_count') required int normalFollowersCount,
    // @JsonKey(name: 'notifications') required bool notifications,
    @JsonKey(name: 'pinned_tweet_ids_str') required List<String> pinnedTweetIdsStr,
    @JsonKey(name: 'possibly_sensitive') required bool possiblySensitive,
    // @JsonKey(name: 'profile_banner_extensions') required dynamic profileBannerExtensions,
    @JsonKey(name: 'profile_banner_url') required String? profileBannerUrl,
    // @JsonKey(name: 'profile_image_extensions') required dynamic profileImageExtensions,
    @JsonKey(name: 'profile_image_url_https') required String profileImageUrlHttps,
    @JsonKey(name: 'profile_interstitial_type') required String profileInterstitialType,
    // @JsonKey(name: 'protected') required bool protected,
    @JsonKey(name: 'screen_name') required String screenName,
    @JsonKey(name: 'statuses_count') required int statusesCount,
    @JsonKey(name: 'translator_type') required String translatorType,
    @JsonKey(name: 'url') required String? url,
    @JsonKey(name: 'verified') required bool verified,
    @JsonKey(name: 'want_retweets') required bool wantRetweets,
    @JsonKey(name: 'withheld_in_countries') required List withheldInCountries,
  }) = _UserLegacy;

  String get profileImageUrlHttpsSource => profileImageUrlHttps.replaceAll(RegExp(r'_[a-zA-Z0-9]+?.jpg$'), '.jpg');

  factory UserLegacy.fromJson(Map<String, dynamic> json) => _$UserLegacyFromJson(json);
}
