// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimelineAddEntries _$$_TimelineAddEntriesFromJson(
        Map<String, dynamic> json) =>
    _$_TimelineAddEntries(
      type: const InstructionsTypeConverter().fromJson(json['type'] as String),
      entries: json['entries'] as List<dynamic>,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_TimelineAddEntriesToJson(
        _$_TimelineAddEntries instance) =>
    <String, dynamic>{
      'type': const InstructionsTypeConverter().toJson(instance.type),
      'entries': instance.entries,
      'runtimeType': instance.$type,
    };

_$_TimelineTerminateTimeline _$$_TimelineTerminateTimelineFromJson(
        Map<String, dynamic> json) =>
    _$_TimelineTerminateTimeline(
      type: const InstructionsTypeConverter().fromJson(json['type'] as String),
      direction: json['direction'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_TimelineTerminateTimelineToJson(
        _$_TimelineTerminateTimeline instance) =>
    <String, dynamic>{
      'type': const InstructionsTypeConverter().toJson(instance.type),
      'direction': instance.direction,
      'runtimeType': instance.$type,
    };

_$_TimelineClearCache _$$_TimelineClearCacheFromJson(
        Map<String, dynamic> json) =>
    _$_TimelineClearCache(
      type: const InstructionsTypeConverter().fromJson(json['type'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_TimelineClearCacheToJson(
        _$_TimelineClearCache instance) =>
    <String, dynamic>{
      'type': const InstructionsTypeConverter().toJson(instance.type),
      'runtimeType': instance.$type,
    };

_$_TimelineAddEntry _$$_TimelineAddEntryFromJson(Map<String, dynamic> json) =>
    _$_TimelineAddEntry(
      entryId: json['entryId'] as String,
      entry: json['sortIndex'] as String,
      content: Content.fromJson(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TimelineAddEntryToJson(_$_TimelineAddEntry instance) =>
    <String, dynamic>{
      'entryId': instance.entryId,
      'sortIndex': instance.entry,
      'content': instance.content,
    };

_$_TimelineTimelineItem _$$_TimelineTimelineItemFromJson(
        Map<String, dynamic> json) =>
    _$_TimelineTimelineItem(
      entryType: $enumDecode(_$InstructionsTypeEnumMap, json['entryType']),
      type: $enumDecode(_$InstructionsTypeEnumMap, json['__typename']),
      itemContent: json['itemContent'],
      clientEventInfo: json['clientEventInfo'],
    );

Map<String, dynamic> _$$_TimelineTimelineItemToJson(
        _$_TimelineTimelineItem instance) =>
    <String, dynamic>{
      'entryType': _$InstructionsTypeEnumMap[instance.entryType]!,
      '__typename': _$InstructionsTypeEnumMap[instance.type]!,
      'itemContent': instance.itemContent,
      'clientEventInfo': instance.clientEventInfo,
    };

const _$InstructionsTypeEnumMap = {
  InstructionsType.timelineAddEntries: 'timelineAddEntries',
  InstructionsType.timelineTerminateTimeline: 'timelineTerminateTimeline',
  InstructionsType.timelineReplaceEntry: 'timelineReplaceEntry',
  InstructionsType.timelineShowAlert: 'timelineShowAlert',
  InstructionsType.timelineClearCache: 'timelineClearCache',
  InstructionsType.timelinePinEntry: 'timelinePinEntry',
  InstructionsType.timelineAddToModule: 'timelineAddToModule',
};

_$_TimelineUser _$$_TimelineUserFromJson(Map<String, dynamic> json) =>
    _$_TimelineUser(
      itemType: $enumDecode(_$InstructionsTypeEnumMap, json['itemType']),
      type: $enumDecode(_$InstructionsTypeEnumMap, json['__typename']),
      userResults:
          Result.fromJson(json['user_results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TimelineUserToJson(_$_TimelineUser instance) =>
    <String, dynamic>{
      'itemType': _$InstructionsTypeEnumMap[instance.itemType]!,
      '__typename': _$InstructionsTypeEnumMap[instance.type]!,
      'user_results': instance.userResults,
    };

_$_Result _$$_ResultFromJson(Map<String, dynamic> json) => _$_Result(
      result: User.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'result': instance.result,
    };

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      typename:
          const TypenameConverter().fromJson(json['__typename'] as String),
      affiliatesHighlightedLabel: json['affiliates_highlighted_label'],
      hasGraduatedAccess: json['has_graduated_access'] as bool,
      id: json['id'] as String,
      isBlueVerified: json['is_blue_verified'] as bool,
      legacy: UserLegacy.fromJson(json['legacy'] as Map<String, dynamic>),
      restId: json['rest_id'] as String,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      '__typename': const TypenameConverter().toJson(instance.typename),
      'affiliates_highlighted_label': instance.affiliatesHighlightedLabel,
      'has_graduated_access': instance.hasGraduatedAccess,
      'id': instance.id,
      'is_blue_verified': instance.isBlueVerified,
      'legacy': instance.legacy,
      'rest_id': instance.restId,
    };

_$_UserLegacy _$$_UserLegacyFromJson(Map<String, dynamic> json) =>
    _$_UserLegacy(
      blocking: json['blocking'],
      canDm: json['can_dm'] as bool,
      canMediaTag: json['can_media_tag'] as bool,
      createdAt: json['created_at'] as String,
      defaultProfile: json['default_profile'] as bool,
      defaultProfileImage: json['default_profile_image'] as bool,
      description: json['description'] as String,
      entities: json['entities'],
      fastFollowersCount: json['fast_followers_count'] as int,
      favouritesCount: json['favourites_count'] as int,
      followedBy: json['followed_by'] as bool? ?? false,
      followersCount: json['followers_count'] as int,
      following: json['following'] as bool? ?? false,
      friendsCount: json['friends_count'] as int,
      hasCustomTimelines: json['has_custom_timelines'] as bool,
      isTranslator: json['is_translator'] as bool,
      listedCount: json['listed_count'] as int,
      location: json['location'] as String,
      mediaCount: json['media_count'] as int,
      name: json['name'] as String,
      normalFollowersCount: json['normal_followers_count'] as int,
      pinnedTweetIdsStr: (json['pinned_tweet_ids_str'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      possiblySensitive: json['possibly_sensitive'] as bool,
      profileBannerUrl: json['profile_banner_url'] as String?,
      profileImageUrlHttps: json['profile_image_url_https'] as String,
      profileInterstitialType: json['profile_interstitial_type'] as String,
      screenName: json['screen_name'] as String,
      statusesCount: json['statuses_count'] as int,
      translatorType: json['translator_type'] as String,
      url: json['url'] as String?,
      verified: json['verified'] as bool,
      wantRetweets: json['want_retweets'] as bool,
      withheldInCountries: json['withheld_in_countries'] as List<dynamic>,
    );

Map<String, dynamic> _$$_UserLegacyToJson(_$_UserLegacy instance) =>
    <String, dynamic>{
      'blocking': instance.blocking,
      'can_dm': instance.canDm,
      'can_media_tag': instance.canMediaTag,
      'created_at': instance.createdAt,
      'default_profile': instance.defaultProfile,
      'default_profile_image': instance.defaultProfileImage,
      'description': instance.description,
      'entities': instance.entities,
      'fast_followers_count': instance.fastFollowersCount,
      'favourites_count': instance.favouritesCount,
      'followed_by': instance.followedBy,
      'followers_count': instance.followersCount,
      'following': instance.following,
      'friends_count': instance.friendsCount,
      'has_custom_timelines': instance.hasCustomTimelines,
      'is_translator': instance.isTranslator,
      'listed_count': instance.listedCount,
      'location': instance.location,
      'media_count': instance.mediaCount,
      'name': instance.name,
      'normal_followers_count': instance.normalFollowersCount,
      'pinned_tweet_ids_str': instance.pinnedTweetIdsStr,
      'possibly_sensitive': instance.possiblySensitive,
      'profile_banner_url': instance.profileBannerUrl,
      'profile_image_url_https': instance.profileImageUrlHttps,
      'profile_interstitial_type': instance.profileInterstitialType,
      'screen_name': instance.screenName,
      'statuses_count': instance.statusesCount,
      'translator_type': instance.translatorType,
      'url': instance.url,
      'verified': instance.verified,
      'want_retweets': instance.wantRetweets,
      'withheld_in_countries': instance.withheldInCountries,
    };
