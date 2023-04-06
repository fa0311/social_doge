// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../main.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Instruction _$InstructionFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'timelineAddEntry':
      return _TimelineAddEntries.fromJson(json);
    case 'timelineTerminateTimeline':
      return _TimelineTerminateTimeline.fromJson(json);
    case 'timelineClearCache':
      return _TimelineClearCache.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Instruction',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Instruction {
  @JsonKey(name: 'type')
  @InstructionsTypeConverter()
  InstructionsType get type => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'entries')
                List<dynamic> entries)
        timelineAddEntry,
    required TResult Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'direction')
            @InstructionsTypeConverter()
                String direction)
        timelineTerminateTimeline,
    required TResult Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type)
        timelineClearCache,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'entries')
                List<dynamic> entries)?
        timelineAddEntry,
    TResult? Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'direction')
            @InstructionsTypeConverter()
                String direction)?
        timelineTerminateTimeline,
    TResult? Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type)?
        timelineClearCache,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'entries')
                List<dynamic> entries)?
        timelineAddEntry,
    TResult Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'direction')
            @InstructionsTypeConverter()
                String direction)?
        timelineTerminateTimeline,
    TResult Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type)?
        timelineClearCache,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TimelineAddEntries value) timelineAddEntry,
    required TResult Function(_TimelineTerminateTimeline value)
        timelineTerminateTimeline,
    required TResult Function(_TimelineClearCache value) timelineClearCache,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TimelineAddEntries value)? timelineAddEntry,
    TResult? Function(_TimelineTerminateTimeline value)?
        timelineTerminateTimeline,
    TResult? Function(_TimelineClearCache value)? timelineClearCache,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TimelineAddEntries value)? timelineAddEntry,
    TResult Function(_TimelineTerminateTimeline value)?
        timelineTerminateTimeline,
    TResult Function(_TimelineClearCache value)? timelineClearCache,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InstructionCopyWith<Instruction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstructionCopyWith<$Res> {
  factory $InstructionCopyWith(
          Instruction value, $Res Function(Instruction) then) =
      _$InstructionCopyWithImpl<$Res, Instruction>;
  @useResult
  $Res call(
      {@JsonKey(name: 'type')
      @InstructionsTypeConverter()
          InstructionsType type});
}

/// @nodoc
class _$InstructionCopyWithImpl<$Res, $Val extends Instruction>
    implements $InstructionCopyWith<$Res> {
  _$InstructionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InstructionsType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimelineAddEntriesCopyWith<$Res>
    implements $InstructionCopyWith<$Res> {
  factory _$$_TimelineAddEntriesCopyWith(_$_TimelineAddEntries value,
          $Res Function(_$_TimelineAddEntries) then) =
      __$$_TimelineAddEntriesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'type')
      @InstructionsTypeConverter()
          InstructionsType type,
      @JsonKey(name: 'entries')
          List<dynamic> entries});
}

/// @nodoc
class __$$_TimelineAddEntriesCopyWithImpl<$Res>
    extends _$InstructionCopyWithImpl<$Res, _$_TimelineAddEntries>
    implements _$$_TimelineAddEntriesCopyWith<$Res> {
  __$$_TimelineAddEntriesCopyWithImpl(
      _$_TimelineAddEntries _value, $Res Function(_$_TimelineAddEntries) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? entries = null,
  }) {
    return _then(_$_TimelineAddEntries(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InstructionsType,
      entries: null == entries
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimelineAddEntries extends _TimelineAddEntries {
  const _$_TimelineAddEntries(
      {@JsonKey(name: 'type') @InstructionsTypeConverter() required this.type,
      @JsonKey(name: 'entries') required final List<dynamic> entries,
      final String? $type})
      : _entries = entries,
        $type = $type ?? 'timelineAddEntry',
        super._();

  factory _$_TimelineAddEntries.fromJson(Map<String, dynamic> json) =>
      _$$_TimelineAddEntriesFromJson(json);

  @override
  @JsonKey(name: 'type')
  @InstructionsTypeConverter()
  final InstructionsType type;
  final List<dynamic> _entries;
  @override
  @JsonKey(name: 'entries')
  List<dynamic> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Instruction.timelineAddEntry(type: $type, entries: $entries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimelineAddEntries &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._entries, _entries));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_entries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimelineAddEntriesCopyWith<_$_TimelineAddEntries> get copyWith =>
      __$$_TimelineAddEntriesCopyWithImpl<_$_TimelineAddEntries>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'entries')
                List<dynamic> entries)
        timelineAddEntry,
    required TResult Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'direction')
            @InstructionsTypeConverter()
                String direction)
        timelineTerminateTimeline,
    required TResult Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type)
        timelineClearCache,
  }) {
    return timelineAddEntry(type, entries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'entries')
                List<dynamic> entries)?
        timelineAddEntry,
    TResult? Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'direction')
            @InstructionsTypeConverter()
                String direction)?
        timelineTerminateTimeline,
    TResult? Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type)?
        timelineClearCache,
  }) {
    return timelineAddEntry?.call(type, entries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'entries')
                List<dynamic> entries)?
        timelineAddEntry,
    TResult Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'direction')
            @InstructionsTypeConverter()
                String direction)?
        timelineTerminateTimeline,
    TResult Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type)?
        timelineClearCache,
    required TResult orElse(),
  }) {
    if (timelineAddEntry != null) {
      return timelineAddEntry(type, entries);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TimelineAddEntries value) timelineAddEntry,
    required TResult Function(_TimelineTerminateTimeline value)
        timelineTerminateTimeline,
    required TResult Function(_TimelineClearCache value) timelineClearCache,
  }) {
    return timelineAddEntry(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TimelineAddEntries value)? timelineAddEntry,
    TResult? Function(_TimelineTerminateTimeline value)?
        timelineTerminateTimeline,
    TResult? Function(_TimelineClearCache value)? timelineClearCache,
  }) {
    return timelineAddEntry?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TimelineAddEntries value)? timelineAddEntry,
    TResult Function(_TimelineTerminateTimeline value)?
        timelineTerminateTimeline,
    TResult Function(_TimelineClearCache value)? timelineClearCache,
    required TResult orElse(),
  }) {
    if (timelineAddEntry != null) {
      return timelineAddEntry(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimelineAddEntriesToJson(
      this,
    );
  }
}

abstract class _TimelineAddEntries extends Instruction {
  const factory _TimelineAddEntries(
      {@JsonKey(name: 'type')
      @InstructionsTypeConverter()
          required final InstructionsType type,
      @JsonKey(name: 'entries')
          required final List<dynamic> entries}) = _$_TimelineAddEntries;
  const _TimelineAddEntries._() : super._();

  factory _TimelineAddEntries.fromJson(Map<String, dynamic> json) =
      _$_TimelineAddEntries.fromJson;

  @override
  @JsonKey(name: 'type')
  @InstructionsTypeConverter()
  InstructionsType get type;
  @JsonKey(name: 'entries')
  List<dynamic> get entries;
  @override
  @JsonKey(ignore: true)
  _$$_TimelineAddEntriesCopyWith<_$_TimelineAddEntries> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_TimelineTerminateTimelineCopyWith<$Res>
    implements $InstructionCopyWith<$Res> {
  factory _$$_TimelineTerminateTimelineCopyWith(
          _$_TimelineTerminateTimeline value,
          $Res Function(_$_TimelineTerminateTimeline) then) =
      __$$_TimelineTerminateTimelineCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'type')
      @InstructionsTypeConverter()
          InstructionsType type,
      @JsonKey(name: 'direction')
      @InstructionsTypeConverter()
          String direction});
}

/// @nodoc
class __$$_TimelineTerminateTimelineCopyWithImpl<$Res>
    extends _$InstructionCopyWithImpl<$Res, _$_TimelineTerminateTimeline>
    implements _$$_TimelineTerminateTimelineCopyWith<$Res> {
  __$$_TimelineTerminateTimelineCopyWithImpl(
      _$_TimelineTerminateTimeline _value,
      $Res Function(_$_TimelineTerminateTimeline) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? direction = null,
  }) {
    return _then(_$_TimelineTerminateTimeline(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InstructionsType,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimelineTerminateTimeline extends _TimelineTerminateTimeline {
  const _$_TimelineTerminateTimeline(
      {@JsonKey(name: 'type')
      @InstructionsTypeConverter()
          required this.type,
      @JsonKey(name: 'direction')
      @InstructionsTypeConverter()
          required this.direction,
      final String? $type})
      : $type = $type ?? 'timelineTerminateTimeline',
        super._();

  factory _$_TimelineTerminateTimeline.fromJson(Map<String, dynamic> json) =>
      _$$_TimelineTerminateTimelineFromJson(json);

  @override
  @JsonKey(name: 'type')
  @InstructionsTypeConverter()
  final InstructionsType type;
  @override
  @JsonKey(name: 'direction')
  @InstructionsTypeConverter()
  final String direction;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Instruction.timelineTerminateTimeline(type: $type, direction: $direction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimelineTerminateTimeline &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.direction, direction) ||
                other.direction == direction));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, direction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimelineTerminateTimelineCopyWith<_$_TimelineTerminateTimeline>
      get copyWith => __$$_TimelineTerminateTimelineCopyWithImpl<
          _$_TimelineTerminateTimeline>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'entries')
                List<dynamic> entries)
        timelineAddEntry,
    required TResult Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'direction')
            @InstructionsTypeConverter()
                String direction)
        timelineTerminateTimeline,
    required TResult Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type)
        timelineClearCache,
  }) {
    return timelineTerminateTimeline(type, direction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'entries')
                List<dynamic> entries)?
        timelineAddEntry,
    TResult? Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'direction')
            @InstructionsTypeConverter()
                String direction)?
        timelineTerminateTimeline,
    TResult? Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type)?
        timelineClearCache,
  }) {
    return timelineTerminateTimeline?.call(type, direction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'entries')
                List<dynamic> entries)?
        timelineAddEntry,
    TResult Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'direction')
            @InstructionsTypeConverter()
                String direction)?
        timelineTerminateTimeline,
    TResult Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type)?
        timelineClearCache,
    required TResult orElse(),
  }) {
    if (timelineTerminateTimeline != null) {
      return timelineTerminateTimeline(type, direction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TimelineAddEntries value) timelineAddEntry,
    required TResult Function(_TimelineTerminateTimeline value)
        timelineTerminateTimeline,
    required TResult Function(_TimelineClearCache value) timelineClearCache,
  }) {
    return timelineTerminateTimeline(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TimelineAddEntries value)? timelineAddEntry,
    TResult? Function(_TimelineTerminateTimeline value)?
        timelineTerminateTimeline,
    TResult? Function(_TimelineClearCache value)? timelineClearCache,
  }) {
    return timelineTerminateTimeline?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TimelineAddEntries value)? timelineAddEntry,
    TResult Function(_TimelineTerminateTimeline value)?
        timelineTerminateTimeline,
    TResult Function(_TimelineClearCache value)? timelineClearCache,
    required TResult orElse(),
  }) {
    if (timelineTerminateTimeline != null) {
      return timelineTerminateTimeline(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimelineTerminateTimelineToJson(
      this,
    );
  }
}

abstract class _TimelineTerminateTimeline extends Instruction {
  const factory _TimelineTerminateTimeline(
      {@JsonKey(name: 'type')
      @InstructionsTypeConverter()
          required final InstructionsType type,
      @JsonKey(name: 'direction')
      @InstructionsTypeConverter()
          required final String direction}) = _$_TimelineTerminateTimeline;
  const _TimelineTerminateTimeline._() : super._();

  factory _TimelineTerminateTimeline.fromJson(Map<String, dynamic> json) =
      _$_TimelineTerminateTimeline.fromJson;

  @override
  @JsonKey(name: 'type')
  @InstructionsTypeConverter()
  InstructionsType get type;
  @JsonKey(name: 'direction')
  @InstructionsTypeConverter()
  String get direction;
  @override
  @JsonKey(ignore: true)
  _$$_TimelineTerminateTimelineCopyWith<_$_TimelineTerminateTimeline>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_TimelineClearCacheCopyWith<$Res>
    implements $InstructionCopyWith<$Res> {
  factory _$$_TimelineClearCacheCopyWith(_$_TimelineClearCache value,
          $Res Function(_$_TimelineClearCache) then) =
      __$$_TimelineClearCacheCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'type')
      @InstructionsTypeConverter()
          InstructionsType type});
}

/// @nodoc
class __$$_TimelineClearCacheCopyWithImpl<$Res>
    extends _$InstructionCopyWithImpl<$Res, _$_TimelineClearCache>
    implements _$$_TimelineClearCacheCopyWith<$Res> {
  __$$_TimelineClearCacheCopyWithImpl(
      _$_TimelineClearCache _value, $Res Function(_$_TimelineClearCache) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$_TimelineClearCache(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InstructionsType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimelineClearCache extends _TimelineClearCache {
  const _$_TimelineClearCache(
      {@JsonKey(name: 'type') @InstructionsTypeConverter() required this.type,
      final String? $type})
      : $type = $type ?? 'timelineClearCache',
        super._();

  factory _$_TimelineClearCache.fromJson(Map<String, dynamic> json) =>
      _$$_TimelineClearCacheFromJson(json);

  @override
  @JsonKey(name: 'type')
  @InstructionsTypeConverter()
  final InstructionsType type;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Instruction.timelineClearCache(type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimelineClearCache &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimelineClearCacheCopyWith<_$_TimelineClearCache> get copyWith =>
      __$$_TimelineClearCacheCopyWithImpl<_$_TimelineClearCache>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'entries')
                List<dynamic> entries)
        timelineAddEntry,
    required TResult Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'direction')
            @InstructionsTypeConverter()
                String direction)
        timelineTerminateTimeline,
    required TResult Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type)
        timelineClearCache,
  }) {
    return timelineClearCache(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'entries')
                List<dynamic> entries)?
        timelineAddEntry,
    TResult? Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'direction')
            @InstructionsTypeConverter()
                String direction)?
        timelineTerminateTimeline,
    TResult? Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type)?
        timelineClearCache,
  }) {
    return timelineClearCache?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'entries')
                List<dynamic> entries)?
        timelineAddEntry,
    TResult Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'direction')
            @InstructionsTypeConverter()
                String direction)?
        timelineTerminateTimeline,
    TResult Function(
            @JsonKey(name: 'type')
            @InstructionsTypeConverter()
                InstructionsType type)?
        timelineClearCache,
    required TResult orElse(),
  }) {
    if (timelineClearCache != null) {
      return timelineClearCache(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TimelineAddEntries value) timelineAddEntry,
    required TResult Function(_TimelineTerminateTimeline value)
        timelineTerminateTimeline,
    required TResult Function(_TimelineClearCache value) timelineClearCache,
  }) {
    return timelineClearCache(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TimelineAddEntries value)? timelineAddEntry,
    TResult? Function(_TimelineTerminateTimeline value)?
        timelineTerminateTimeline,
    TResult? Function(_TimelineClearCache value)? timelineClearCache,
  }) {
    return timelineClearCache?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TimelineAddEntries value)? timelineAddEntry,
    TResult Function(_TimelineTerminateTimeline value)?
        timelineTerminateTimeline,
    TResult Function(_TimelineClearCache value)? timelineClearCache,
    required TResult orElse(),
  }) {
    if (timelineClearCache != null) {
      return timelineClearCache(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimelineClearCacheToJson(
      this,
    );
  }
}

abstract class _TimelineClearCache extends Instruction {
  const factory _TimelineClearCache(
      {@JsonKey(name: 'type')
      @InstructionsTypeConverter()
          required final InstructionsType type}) = _$_TimelineClearCache;
  const _TimelineClearCache._() : super._();

  factory _TimelineClearCache.fromJson(Map<String, dynamic> json) =
      _$_TimelineClearCache.fromJson;

  @override
  @JsonKey(name: 'type')
  @InstructionsTypeConverter()
  InstructionsType get type;
  @override
  @JsonKey(ignore: true)
  _$$_TimelineClearCacheCopyWith<_$_TimelineClearCache> get copyWith =>
      throw _privateConstructorUsedError;
}

TimelineAddEntry _$TimelineAddEntryFromJson(Map<String, dynamic> json) {
  return _TimelineAddEntry.fromJson(json);
}

/// @nodoc
mixin _$TimelineAddEntry {
  @JsonKey(name: 'entryId')
  String get entryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sortIndex')
  String get entry => throw _privateConstructorUsedError;
  @JsonKey(name: 'content')
  Content get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimelineAddEntryCopyWith<TimelineAddEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineAddEntryCopyWith<$Res> {
  factory $TimelineAddEntryCopyWith(
          TimelineAddEntry value, $Res Function(TimelineAddEntry) then) =
      _$TimelineAddEntryCopyWithImpl<$Res, TimelineAddEntry>;
  @useResult
  $Res call(
      {@JsonKey(name: 'entryId') String entryId,
      @JsonKey(name: 'sortIndex') String entry,
      @JsonKey(name: 'content') Content content});

  $ContentCopyWith<$Res> get content;
}

/// @nodoc
class _$TimelineAddEntryCopyWithImpl<$Res, $Val extends TimelineAddEntry>
    implements $TimelineAddEntryCopyWith<$Res> {
  _$TimelineAddEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entryId = null,
    Object? entry = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      entryId: null == entryId
          ? _value.entryId
          : entryId // ignore: cast_nullable_to_non_nullable
              as String,
      entry: null == entry
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContentCopyWith<$Res> get content {
    return $ContentCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TimelineAddEntryCopyWith<$Res>
    implements $TimelineAddEntryCopyWith<$Res> {
  factory _$$_TimelineAddEntryCopyWith(
          _$_TimelineAddEntry value, $Res Function(_$_TimelineAddEntry) then) =
      __$$_TimelineAddEntryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'entryId') String entryId,
      @JsonKey(name: 'sortIndex') String entry,
      @JsonKey(name: 'content') Content content});

  @override
  $ContentCopyWith<$Res> get content;
}

/// @nodoc
class __$$_TimelineAddEntryCopyWithImpl<$Res>
    extends _$TimelineAddEntryCopyWithImpl<$Res, _$_TimelineAddEntry>
    implements _$$_TimelineAddEntryCopyWith<$Res> {
  __$$_TimelineAddEntryCopyWithImpl(
      _$_TimelineAddEntry _value, $Res Function(_$_TimelineAddEntry) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entryId = null,
    Object? entry = null,
    Object? content = null,
  }) {
    return _then(_$_TimelineAddEntry(
      entryId: null == entryId
          ? _value.entryId
          : entryId // ignore: cast_nullable_to_non_nullable
              as String,
      entry: null == entry
          ? _value.entry
          : entry // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimelineAddEntry implements _TimelineAddEntry {
  const _$_TimelineAddEntry(
      {@JsonKey(name: 'entryId') required this.entryId,
      @JsonKey(name: 'sortIndex') required this.entry,
      @JsonKey(name: 'content') required this.content});

  factory _$_TimelineAddEntry.fromJson(Map<String, dynamic> json) =>
      _$$_TimelineAddEntryFromJson(json);

  @override
  @JsonKey(name: 'entryId')
  final String entryId;
  @override
  @JsonKey(name: 'sortIndex')
  final String entry;
  @override
  @JsonKey(name: 'content')
  final Content content;

  @override
  String toString() {
    return 'TimelineAddEntry(entryId: $entryId, entry: $entry, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimelineAddEntry &&
            (identical(other.entryId, entryId) || other.entryId == entryId) &&
            (identical(other.entry, entry) || other.entry == entry) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, entryId, entry, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimelineAddEntryCopyWith<_$_TimelineAddEntry> get copyWith =>
      __$$_TimelineAddEntryCopyWithImpl<_$_TimelineAddEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimelineAddEntryToJson(
      this,
    );
  }
}

abstract class _TimelineAddEntry implements TimelineAddEntry {
  const factory _TimelineAddEntry(
          {@JsonKey(name: 'entryId') required final String entryId,
          @JsonKey(name: 'sortIndex') required final String entry,
          @JsonKey(name: 'content') required final Content content}) =
      _$_TimelineAddEntry;

  factory _TimelineAddEntry.fromJson(Map<String, dynamic> json) =
      _$_TimelineAddEntry.fromJson;

  @override
  @JsonKey(name: 'entryId')
  String get entryId;
  @override
  @JsonKey(name: 'sortIndex')
  String get entry;
  @override
  @JsonKey(name: 'content')
  Content get content;
  @override
  @JsonKey(ignore: true)
  _$$_TimelineAddEntryCopyWith<_$_TimelineAddEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

Content _$ContentFromJson(Map<String, dynamic> json) {
  return _TimelineTimelineItem.fromJson(json);
}

/// @nodoc
mixin _$Content {
  @JsonKey(name: 'entryType')
  @EntryTypeConverter()
  InstructionsType get entryType => throw _privateConstructorUsedError;
  @JsonKey(name: '__typename')
  @EntryTypeConverter()
  InstructionsType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemContent')
  dynamic get itemContent => throw _privateConstructorUsedError;
  @JsonKey(name: 'clientEventInfo')
  dynamic get clientEventInfo => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'entryType')
            @EntryTypeConverter()
                InstructionsType entryType,
            @JsonKey(name: '__typename')
            @EntryTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'itemContent')
                dynamic itemContent,
            @JsonKey(name: 'clientEventInfo')
                dynamic clientEventInfo)
        timelineTimelineItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(name: 'entryType')
            @EntryTypeConverter()
                InstructionsType entryType,
            @JsonKey(name: '__typename')
            @EntryTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'itemContent')
                dynamic itemContent,
            @JsonKey(name: 'clientEventInfo')
                dynamic clientEventInfo)?
        timelineTimelineItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'entryType')
            @EntryTypeConverter()
                InstructionsType entryType,
            @JsonKey(name: '__typename')
            @EntryTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'itemContent')
                dynamic itemContent,
            @JsonKey(name: 'clientEventInfo')
                dynamic clientEventInfo)?
        timelineTimelineItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TimelineTimelineItem value) timelineTimelineItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TimelineTimelineItem value)? timelineTimelineItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TimelineTimelineItem value)? timelineTimelineItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentCopyWith<Content> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentCopyWith<$Res> {
  factory $ContentCopyWith(Content value, $Res Function(Content) then) =
      _$ContentCopyWithImpl<$Res, Content>;
  @useResult
  $Res call(
      {@JsonKey(name: 'entryType')
      @EntryTypeConverter()
          InstructionsType entryType,
      @JsonKey(name: '__typename')
      @EntryTypeConverter()
          InstructionsType type,
      @JsonKey(name: 'itemContent')
          dynamic itemContent,
      @JsonKey(name: 'clientEventInfo')
          dynamic clientEventInfo});
}

/// @nodoc
class _$ContentCopyWithImpl<$Res, $Val extends Content>
    implements $ContentCopyWith<$Res> {
  _$ContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entryType = null,
    Object? type = null,
    Object? itemContent = freezed,
    Object? clientEventInfo = freezed,
  }) {
    return _then(_value.copyWith(
      entryType: null == entryType
          ? _value.entryType
          : entryType // ignore: cast_nullable_to_non_nullable
              as InstructionsType,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InstructionsType,
      itemContent: freezed == itemContent
          ? _value.itemContent
          : itemContent // ignore: cast_nullable_to_non_nullable
              as dynamic,
      clientEventInfo: freezed == clientEventInfo
          ? _value.clientEventInfo
          : clientEventInfo // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimelineTimelineItemCopyWith<$Res>
    implements $ContentCopyWith<$Res> {
  factory _$$_TimelineTimelineItemCopyWith(_$_TimelineTimelineItem value,
          $Res Function(_$_TimelineTimelineItem) then) =
      __$$_TimelineTimelineItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'entryType')
      @EntryTypeConverter()
          InstructionsType entryType,
      @JsonKey(name: '__typename')
      @EntryTypeConverter()
          InstructionsType type,
      @JsonKey(name: 'itemContent')
          dynamic itemContent,
      @JsonKey(name: 'clientEventInfo')
          dynamic clientEventInfo});
}

/// @nodoc
class __$$_TimelineTimelineItemCopyWithImpl<$Res>
    extends _$ContentCopyWithImpl<$Res, _$_TimelineTimelineItem>
    implements _$$_TimelineTimelineItemCopyWith<$Res> {
  __$$_TimelineTimelineItemCopyWithImpl(_$_TimelineTimelineItem _value,
      $Res Function(_$_TimelineTimelineItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entryType = null,
    Object? type = null,
    Object? itemContent = freezed,
    Object? clientEventInfo = freezed,
  }) {
    return _then(_$_TimelineTimelineItem(
      entryType: null == entryType
          ? _value.entryType
          : entryType // ignore: cast_nullable_to_non_nullable
              as InstructionsType,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InstructionsType,
      itemContent: freezed == itemContent
          ? _value.itemContent
          : itemContent // ignore: cast_nullable_to_non_nullable
              as dynamic,
      clientEventInfo: freezed == clientEventInfo
          ? _value.clientEventInfo
          : clientEventInfo // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimelineTimelineItem extends _TimelineTimelineItem {
  const _$_TimelineTimelineItem(
      {@JsonKey(name: 'entryType')
      @EntryTypeConverter()
          required this.entryType,
      @JsonKey(name: '__typename')
      @EntryTypeConverter()
          required this.type,
      @JsonKey(name: 'itemContent')
          required this.itemContent,
      @JsonKey(name: 'clientEventInfo')
          required this.clientEventInfo})
      : super._();

  factory _$_TimelineTimelineItem.fromJson(Map<String, dynamic> json) =>
      _$$_TimelineTimelineItemFromJson(json);

  @override
  @JsonKey(name: 'entryType')
  @EntryTypeConverter()
  final InstructionsType entryType;
  @override
  @JsonKey(name: '__typename')
  @EntryTypeConverter()
  final InstructionsType type;
  @override
  @JsonKey(name: 'itemContent')
  final dynamic itemContent;
  @override
  @JsonKey(name: 'clientEventInfo')
  final dynamic clientEventInfo;

  @override
  String toString() {
    return 'Content.timelineTimelineItem(entryType: $entryType, type: $type, itemContent: $itemContent, clientEventInfo: $clientEventInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimelineTimelineItem &&
            (identical(other.entryType, entryType) ||
                other.entryType == entryType) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other.itemContent, itemContent) &&
            const DeepCollectionEquality()
                .equals(other.clientEventInfo, clientEventInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      entryType,
      type,
      const DeepCollectionEquality().hash(itemContent),
      const DeepCollectionEquality().hash(clientEventInfo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimelineTimelineItemCopyWith<_$_TimelineTimelineItem> get copyWith =>
      __$$_TimelineTimelineItemCopyWithImpl<_$_TimelineTimelineItem>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'entryType')
            @EntryTypeConverter()
                InstructionsType entryType,
            @JsonKey(name: '__typename')
            @EntryTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'itemContent')
                dynamic itemContent,
            @JsonKey(name: 'clientEventInfo')
                dynamic clientEventInfo)
        timelineTimelineItem,
  }) {
    return timelineTimelineItem(entryType, type, itemContent, clientEventInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(name: 'entryType')
            @EntryTypeConverter()
                InstructionsType entryType,
            @JsonKey(name: '__typename')
            @EntryTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'itemContent')
                dynamic itemContent,
            @JsonKey(name: 'clientEventInfo')
                dynamic clientEventInfo)?
        timelineTimelineItem,
  }) {
    return timelineTimelineItem?.call(
        entryType, type, itemContent, clientEventInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'entryType')
            @EntryTypeConverter()
                InstructionsType entryType,
            @JsonKey(name: '__typename')
            @EntryTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'itemContent')
                dynamic itemContent,
            @JsonKey(name: 'clientEventInfo')
                dynamic clientEventInfo)?
        timelineTimelineItem,
    required TResult orElse(),
  }) {
    if (timelineTimelineItem != null) {
      return timelineTimelineItem(
          entryType, type, itemContent, clientEventInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TimelineTimelineItem value) timelineTimelineItem,
  }) {
    return timelineTimelineItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TimelineTimelineItem value)? timelineTimelineItem,
  }) {
    return timelineTimelineItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TimelineTimelineItem value)? timelineTimelineItem,
    required TResult orElse(),
  }) {
    if (timelineTimelineItem != null) {
      return timelineTimelineItem(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimelineTimelineItemToJson(
      this,
    );
  }
}

abstract class _TimelineTimelineItem extends Content {
  const factory _TimelineTimelineItem(
      {@JsonKey(name: 'entryType')
      @EntryTypeConverter()
          required final InstructionsType entryType,
      @JsonKey(name: '__typename')
      @EntryTypeConverter()
          required final InstructionsType type,
      @JsonKey(name: 'itemContent')
          required final dynamic itemContent,
      @JsonKey(name: 'clientEventInfo')
          required final dynamic clientEventInfo}) = _$_TimelineTimelineItem;
  const _TimelineTimelineItem._() : super._();

  factory _TimelineTimelineItem.fromJson(Map<String, dynamic> json) =
      _$_TimelineTimelineItem.fromJson;

  @override
  @JsonKey(name: 'entryType')
  @EntryTypeConverter()
  InstructionsType get entryType;
  @override
  @JsonKey(name: '__typename')
  @EntryTypeConverter()
  InstructionsType get type;
  @override
  @JsonKey(name: 'itemContent')
  dynamic get itemContent;
  @override
  @JsonKey(name: 'clientEventInfo')
  dynamic get clientEventInfo;
  @override
  @JsonKey(ignore: true)
  _$$_TimelineTimelineItemCopyWith<_$_TimelineTimelineItem> get copyWith =>
      throw _privateConstructorUsedError;
}

ItemContent _$ItemContentFromJson(Map<String, dynamic> json) {
  return _TimelineUser.fromJson(json);
}

/// @nodoc
mixin _$ItemContent {
  @JsonKey(name: 'itemType')
  @ItemTypeConverter()
  InstructionsType get itemType => throw _privateConstructorUsedError;
  @JsonKey(name: '__typename')
  @ItemTypeConverter()
  InstructionsType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_results')
  Result get userResults => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'itemType')
            @ItemTypeConverter()
                InstructionsType itemType,
            @JsonKey(name: '__typename')
            @ItemTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'user_results')
                Result userResults)
        timelineUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(name: 'itemType')
            @ItemTypeConverter()
                InstructionsType itemType,
            @JsonKey(name: '__typename')
            @ItemTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'user_results')
                Result userResults)?
        timelineUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'itemType')
            @ItemTypeConverter()
                InstructionsType itemType,
            @JsonKey(name: '__typename')
            @ItemTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'user_results')
                Result userResults)?
        timelineUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TimelineUser value) timelineUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TimelineUser value)? timelineUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TimelineUser value)? timelineUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemContentCopyWith<ItemContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemContentCopyWith<$Res> {
  factory $ItemContentCopyWith(
          ItemContent value, $Res Function(ItemContent) then) =
      _$ItemContentCopyWithImpl<$Res, ItemContent>;
  @useResult
  $Res call(
      {@JsonKey(name: 'itemType')
      @ItemTypeConverter()
          InstructionsType itemType,
      @JsonKey(name: '__typename')
      @ItemTypeConverter()
          InstructionsType type,
      @JsonKey(name: 'user_results')
          Result userResults});

  $ResultCopyWith<$Res> get userResults;
}

/// @nodoc
class _$ItemContentCopyWithImpl<$Res, $Val extends ItemContent>
    implements $ItemContentCopyWith<$Res> {
  _$ItemContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemType = null,
    Object? type = null,
    Object? userResults = null,
  }) {
    return _then(_value.copyWith(
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as InstructionsType,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InstructionsType,
      userResults: null == userResults
          ? _value.userResults
          : userResults // ignore: cast_nullable_to_non_nullable
              as Result,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<$Res> get userResults {
    return $ResultCopyWith<$Res>(_value.userResults, (value) {
      return _then(_value.copyWith(userResults: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TimelineUserCopyWith<$Res>
    implements $ItemContentCopyWith<$Res> {
  factory _$$_TimelineUserCopyWith(
          _$_TimelineUser value, $Res Function(_$_TimelineUser) then) =
      __$$_TimelineUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'itemType')
      @ItemTypeConverter()
          InstructionsType itemType,
      @JsonKey(name: '__typename')
      @ItemTypeConverter()
          InstructionsType type,
      @JsonKey(name: 'user_results')
          Result userResults});

  @override
  $ResultCopyWith<$Res> get userResults;
}

/// @nodoc
class __$$_TimelineUserCopyWithImpl<$Res>
    extends _$ItemContentCopyWithImpl<$Res, _$_TimelineUser>
    implements _$$_TimelineUserCopyWith<$Res> {
  __$$_TimelineUserCopyWithImpl(
      _$_TimelineUser _value, $Res Function(_$_TimelineUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemType = null,
    Object? type = null,
    Object? userResults = null,
  }) {
    return _then(_$_TimelineUser(
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as InstructionsType,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InstructionsType,
      userResults: null == userResults
          ? _value.userResults
          : userResults // ignore: cast_nullable_to_non_nullable
              as Result,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimelineUser extends _TimelineUser {
  const _$_TimelineUser(
      {@JsonKey(name: 'itemType') @ItemTypeConverter() required this.itemType,
      @JsonKey(name: '__typename') @ItemTypeConverter() required this.type,
      @JsonKey(name: 'user_results') required this.userResults})
      : super._();

  factory _$_TimelineUser.fromJson(Map<String, dynamic> json) =>
      _$$_TimelineUserFromJson(json);

  @override
  @JsonKey(name: 'itemType')
  @ItemTypeConverter()
  final InstructionsType itemType;
  @override
  @JsonKey(name: '__typename')
  @ItemTypeConverter()
  final InstructionsType type;
  @override
  @JsonKey(name: 'user_results')
  final Result userResults;

  @override
  String toString() {
    return 'ItemContent.timelineUser(itemType: $itemType, type: $type, userResults: $userResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimelineUser &&
            (identical(other.itemType, itemType) ||
                other.itemType == itemType) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.userResults, userResults) ||
                other.userResults == userResults));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, itemType, type, userResults);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimelineUserCopyWith<_$_TimelineUser> get copyWith =>
      __$$_TimelineUserCopyWithImpl<_$_TimelineUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            @JsonKey(name: 'itemType')
            @ItemTypeConverter()
                InstructionsType itemType,
            @JsonKey(name: '__typename')
            @ItemTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'user_results')
                Result userResults)
        timelineUser,
  }) {
    return timelineUser(itemType, type, userResults);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            @JsonKey(name: 'itemType')
            @ItemTypeConverter()
                InstructionsType itemType,
            @JsonKey(name: '__typename')
            @ItemTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'user_results')
                Result userResults)?
        timelineUser,
  }) {
    return timelineUser?.call(itemType, type, userResults);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            @JsonKey(name: 'itemType')
            @ItemTypeConverter()
                InstructionsType itemType,
            @JsonKey(name: '__typename')
            @ItemTypeConverter()
                InstructionsType type,
            @JsonKey(name: 'user_results')
                Result userResults)?
        timelineUser,
    required TResult orElse(),
  }) {
    if (timelineUser != null) {
      return timelineUser(itemType, type, userResults);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TimelineUser value) timelineUser,
  }) {
    return timelineUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TimelineUser value)? timelineUser,
  }) {
    return timelineUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TimelineUser value)? timelineUser,
    required TResult orElse(),
  }) {
    if (timelineUser != null) {
      return timelineUser(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimelineUserToJson(
      this,
    );
  }
}

abstract class _TimelineUser extends ItemContent {
  const factory _TimelineUser(
      {@JsonKey(name: 'itemType')
      @ItemTypeConverter()
          required final InstructionsType itemType,
      @JsonKey(name: '__typename')
      @ItemTypeConverter()
          required final InstructionsType type,
      @JsonKey(name: 'user_results')
          required final Result userResults}) = _$_TimelineUser;
  const _TimelineUser._() : super._();

  factory _TimelineUser.fromJson(Map<String, dynamic> json) =
      _$_TimelineUser.fromJson;

  @override
  @JsonKey(name: 'itemType')
  @ItemTypeConverter()
  InstructionsType get itemType;
  @override
  @JsonKey(name: '__typename')
  @ItemTypeConverter()
  InstructionsType get type;
  @override
  @JsonKey(name: 'user_results')
  Result get userResults;
  @override
  @JsonKey(ignore: true)
  _$$_TimelineUserCopyWith<_$_TimelineUser> get copyWith =>
      throw _privateConstructorUsedError;
}

Result _$ResultFromJson(Map<String, dynamic> json) {
  return _Result.fromJson(json);
}

/// @nodoc
mixin _$Result {
  @JsonKey(name: 'result')
  User get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultCopyWith<Result> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<$Res> {
  factory $ResultCopyWith(Result value, $Res Function(Result) then) =
      _$ResultCopyWithImpl<$Res, Result>;
  @useResult
  $Res call({@JsonKey(name: 'result') User result});

  $UserCopyWith<$Res> get result;
}

/// @nodoc
class _$ResultCopyWithImpl<$Res, $Val extends Result>
    implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get result {
    return $UserCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ResultCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$$_ResultCopyWith(_$_Result value, $Res Function(_$_Result) then) =
      __$$_ResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'result') User result});

  @override
  $UserCopyWith<$Res> get result;
}

/// @nodoc
class __$$_ResultCopyWithImpl<$Res>
    extends _$ResultCopyWithImpl<$Res, _$_Result>
    implements _$$_ResultCopyWith<$Res> {
  __$$_ResultCopyWithImpl(_$_Result _value, $Res Function(_$_Result) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_Result(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Result implements _Result {
  const _$_Result({@JsonKey(name: 'result') required this.result});

  factory _$_Result.fromJson(Map<String, dynamic> json) =>
      _$$_ResultFromJson(json);

  @override
  @JsonKey(name: 'result')
  final User result;

  @override
  String toString() {
    return 'Result(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Result &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      __$$_ResultCopyWithImpl<_$_Result>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResultToJson(
      this,
    );
  }
}

abstract class _Result implements Result {
  const factory _Result({@JsonKey(name: 'result') required final User result}) =
      _$_Result;

  factory _Result.fromJson(Map<String, dynamic> json) = _$_Result.fromJson;

  @override
  @JsonKey(name: 'result')
  User get result;
  @override
  @JsonKey(ignore: true)
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: '__typename')
  @TypenameConverter()
  Typename get typename => throw _privateConstructorUsedError;
  @JsonKey(name: 'affiliates_highlighted_label')
  dynamic get affiliatesHighlightedLabel => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_graduated_access')
  bool get hasGraduatedAccess =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'has_nft_avatar') required bool hasNftAvatar,
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_blue_verified')
  bool get isBlueVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'legacy')
  UserLegacy get legacy => throw _privateConstructorUsedError;
  @JsonKey(name: 'rest_id')
  String get restId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: '__typename')
      @TypenameConverter()
          Typename typename,
      @JsonKey(name: 'affiliates_highlighted_label')
          dynamic affiliatesHighlightedLabel,
      @JsonKey(name: 'has_graduated_access')
          bool hasGraduatedAccess,
      @JsonKey(name: 'id')
          String id,
      @JsonKey(name: 'is_blue_verified')
          bool isBlueVerified,
      @JsonKey(name: 'legacy')
          UserLegacy legacy,
      @JsonKey(name: 'rest_id')
          String restId});

  $UserLegacyCopyWith<$Res> get legacy;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typename = null,
    Object? affiliatesHighlightedLabel = freezed,
    Object? hasGraduatedAccess = null,
    Object? id = null,
    Object? isBlueVerified = null,
    Object? legacy = null,
    Object? restId = null,
  }) {
    return _then(_value.copyWith(
      typename: null == typename
          ? _value.typename
          : typename // ignore: cast_nullable_to_non_nullable
              as Typename,
      affiliatesHighlightedLabel: freezed == affiliatesHighlightedLabel
          ? _value.affiliatesHighlightedLabel
          : affiliatesHighlightedLabel // ignore: cast_nullable_to_non_nullable
              as dynamic,
      hasGraduatedAccess: null == hasGraduatedAccess
          ? _value.hasGraduatedAccess
          : hasGraduatedAccess // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isBlueVerified: null == isBlueVerified
          ? _value.isBlueVerified
          : isBlueVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      legacy: null == legacy
          ? _value.legacy
          : legacy // ignore: cast_nullable_to_non_nullable
              as UserLegacy,
      restId: null == restId
          ? _value.restId
          : restId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserLegacyCopyWith<$Res> get legacy {
    return $UserLegacyCopyWith<$Res>(_value.legacy, (value) {
      return _then(_value.copyWith(legacy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '__typename')
      @TypenameConverter()
          Typename typename,
      @JsonKey(name: 'affiliates_highlighted_label')
          dynamic affiliatesHighlightedLabel,
      @JsonKey(name: 'has_graduated_access')
          bool hasGraduatedAccess,
      @JsonKey(name: 'id')
          String id,
      @JsonKey(name: 'is_blue_verified')
          bool isBlueVerified,
      @JsonKey(name: 'legacy')
          UserLegacy legacy,
      @JsonKey(name: 'rest_id')
          String restId});

  @override
  $UserLegacyCopyWith<$Res> get legacy;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typename = null,
    Object? affiliatesHighlightedLabel = freezed,
    Object? hasGraduatedAccess = null,
    Object? id = null,
    Object? isBlueVerified = null,
    Object? legacy = null,
    Object? restId = null,
  }) {
    return _then(_$_User(
      typename: null == typename
          ? _value.typename
          : typename // ignore: cast_nullable_to_non_nullable
              as Typename,
      affiliatesHighlightedLabel: freezed == affiliatesHighlightedLabel
          ? _value.affiliatesHighlightedLabel
          : affiliatesHighlightedLabel // ignore: cast_nullable_to_non_nullable
              as dynamic,
      hasGraduatedAccess: null == hasGraduatedAccess
          ? _value.hasGraduatedAccess
          : hasGraduatedAccess // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isBlueVerified: null == isBlueVerified
          ? _value.isBlueVerified
          : isBlueVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      legacy: null == legacy
          ? _value.legacy
          : legacy // ignore: cast_nullable_to_non_nullable
              as UserLegacy,
      restId: null == restId
          ? _value.restId
          : restId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User(
      {@JsonKey(name: '__typename')
      @TypenameConverter()
          required this.typename,
      @JsonKey(name: 'affiliates_highlighted_label')
          required this.affiliatesHighlightedLabel,
      @JsonKey(name: 'has_graduated_access')
          required this.hasGraduatedAccess,
      @JsonKey(name: 'id')
          required this.id,
      @JsonKey(name: 'is_blue_verified')
          required this.isBlueVerified,
      @JsonKey(name: 'legacy')
          required this.legacy,
      @JsonKey(name: 'rest_id')
          required this.restId});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  @JsonKey(name: '__typename')
  @TypenameConverter()
  final Typename typename;
  @override
  @JsonKey(name: 'affiliates_highlighted_label')
  final dynamic affiliatesHighlightedLabel;
  @override
  @JsonKey(name: 'has_graduated_access')
  final bool hasGraduatedAccess;
// @JsonKey(name: 'has_nft_avatar') required bool hasNftAvatar,
  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'is_blue_verified')
  final bool isBlueVerified;
  @override
  @JsonKey(name: 'legacy')
  final UserLegacy legacy;
  @override
  @JsonKey(name: 'rest_id')
  final String restId;

  @override
  String toString() {
    return 'User(typename: $typename, affiliatesHighlightedLabel: $affiliatesHighlightedLabel, hasGraduatedAccess: $hasGraduatedAccess, id: $id, isBlueVerified: $isBlueVerified, legacy: $legacy, restId: $restId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.typename, typename) ||
                other.typename == typename) &&
            const DeepCollectionEquality().equals(
                other.affiliatesHighlightedLabel, affiliatesHighlightedLabel) &&
            (identical(other.hasGraduatedAccess, hasGraduatedAccess) ||
                other.hasGraduatedAccess == hasGraduatedAccess) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isBlueVerified, isBlueVerified) ||
                other.isBlueVerified == isBlueVerified) &&
            (identical(other.legacy, legacy) || other.legacy == legacy) &&
            (identical(other.restId, restId) || other.restId == restId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      typename,
      const DeepCollectionEquality().hash(affiliatesHighlightedLabel),
      hasGraduatedAccess,
      id,
      isBlueVerified,
      legacy,
      restId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(name: '__typename')
      @TypenameConverter()
          required final Typename typename,
      @JsonKey(name: 'affiliates_highlighted_label')
          required final dynamic affiliatesHighlightedLabel,
      @JsonKey(name: 'has_graduated_access')
          required final bool hasGraduatedAccess,
      @JsonKey(name: 'id')
          required final String id,
      @JsonKey(name: 'is_blue_verified')
          required final bool isBlueVerified,
      @JsonKey(name: 'legacy')
          required final UserLegacy legacy,
      @JsonKey(name: 'rest_id')
          required final String restId}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  @JsonKey(name: '__typename')
  @TypenameConverter()
  Typename get typename;
  @override
  @JsonKey(name: 'affiliates_highlighted_label')
  dynamic get affiliatesHighlightedLabel;
  @override
  @JsonKey(name: 'has_graduated_access')
  bool get hasGraduatedAccess;
  @override // @JsonKey(name: 'has_nft_avatar') required bool hasNftAvatar,
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'is_blue_verified')
  bool get isBlueVerified;
  @override
  @JsonKey(name: 'legacy')
  UserLegacy get legacy;
  @override
  @JsonKey(name: 'rest_id')
  String get restId;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}

UserLegacy _$UserLegacyFromJson(Map<String, dynamic> json) {
  return _UserLegacy.fromJson(json);
}

/// @nodoc
mixin _$UserLegacy {
// @JsonKey(name: 'blocked_by') required bool blockedBy,
  @JsonKey(name: 'blocking')
  dynamic get blocking => throw _privateConstructorUsedError;
  @JsonKey(name: 'can_dm')
  bool get canDm => throw _privateConstructorUsedError;
  @JsonKey(name: 'can_media_tag')
  bool get canMediaTag => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt =>
      throw _privateConstructorUsedError; // Sun Sep 19 10:49:08 +0000 2021
  @JsonKey(name: 'default_profile')
  bool get defaultProfile => throw _privateConstructorUsedError;
  @JsonKey(name: 'default_profile_image')
  bool get defaultProfileImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'entities')
  dynamic get entities => throw _privateConstructorUsedError;
  @JsonKey(name: 'fast_followers_count')
  int get fastFollowersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'favourites_count')
  int get favouritesCount =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'follow_request_sent') required bool followRequestSent,
  @JsonKey(name: 'followed_by', defaultValue: false)
  bool get followedBy => throw _privateConstructorUsedError; // ?
  @JsonKey(name: 'followers_count')
  int get followersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'following', defaultValue: false)
  bool get following => throw _privateConstructorUsedError; // ?
  @JsonKey(name: 'friends_count')
  int get friendsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_custom_timelines')
  bool get hasCustomTimelines => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_translator')
  bool get isTranslator => throw _privateConstructorUsedError;
  @JsonKey(name: 'listed_count')
  int get listedCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'location')
  String get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_count')
  int get mediaCount =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'muting') required bool muting,
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'normal_followers_count')
  int get normalFollowersCount =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'notifications') required bool notifications,
  @JsonKey(name: 'pinned_tweet_ids_str')
  List<String> get pinnedTweetIdsStr => throw _privateConstructorUsedError;
  @JsonKey(name: 'possibly_sensitive')
  bool get possiblySensitive =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'profile_banner_extensions') required dynamic profileBannerExtensions,
  @JsonKey(name: 'profile_banner_url')
  String? get profileBannerUrl =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'profile_image_extensions') required dynamic profileImageExtensions,
  @JsonKey(name: 'profile_image_url_https')
  String get profileImageUrlHttps => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_interstitial_type')
  String get profileInterstitialType =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'protected') required bool protected,
  @JsonKey(name: 'screen_name')
  String get screenName => throw _privateConstructorUsedError;
  @JsonKey(name: 'statuses_count')
  int get statusesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'translator_type')
  String get translatorType => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'verified')
  bool get verified => throw _privateConstructorUsedError;
  @JsonKey(name: 'want_retweets')
  bool get wantRetweets => throw _privateConstructorUsedError;
  @JsonKey(name: 'withheld_in_countries')
  List<dynamic> get withheldInCountries => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserLegacyCopyWith<UserLegacy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLegacyCopyWith<$Res> {
  factory $UserLegacyCopyWith(
          UserLegacy value, $Res Function(UserLegacy) then) =
      _$UserLegacyCopyWithImpl<$Res, UserLegacy>;
  @useResult
  $Res call(
      {@JsonKey(name: 'blocking')
          dynamic blocking,
      @JsonKey(name: 'can_dm')
          bool canDm,
      @JsonKey(name: 'can_media_tag')
          bool canMediaTag,
      @JsonKey(name: 'created_at')
          String createdAt,
      @JsonKey(name: 'default_profile')
          bool defaultProfile,
      @JsonKey(name: 'default_profile_image')
          bool defaultProfileImage,
      @JsonKey(name: 'description')
          String description,
      @JsonKey(name: 'entities')
          dynamic entities,
      @JsonKey(name: 'fast_followers_count')
          int fastFollowersCount,
      @JsonKey(name: 'favourites_count')
          int favouritesCount,
      @JsonKey(name: 'followed_by', defaultValue: false)
          bool followedBy,
      @JsonKey(name: 'followers_count')
          int followersCount,
      @JsonKey(name: 'following', defaultValue: false)
          bool following,
      @JsonKey(name: 'friends_count')
          int friendsCount,
      @JsonKey(name: 'has_custom_timelines')
          bool hasCustomTimelines,
      @JsonKey(name: 'is_translator')
          bool isTranslator,
      @JsonKey(name: 'listed_count')
          int listedCount,
      @JsonKey(name: 'location')
          String location,
      @JsonKey(name: 'media_count')
          int mediaCount,
      @JsonKey(name: 'name')
          String name,
      @JsonKey(name: 'normal_followers_count')
          int normalFollowersCount,
      @JsonKey(name: 'pinned_tweet_ids_str')
          List<String> pinnedTweetIdsStr,
      @JsonKey(name: 'possibly_sensitive')
          bool possiblySensitive,
      @JsonKey(name: 'profile_banner_url')
          String? profileBannerUrl,
      @JsonKey(name: 'profile_image_url_https')
          String profileImageUrlHttps,
      @JsonKey(name: 'profile_interstitial_type')
          String profileInterstitialType,
      @JsonKey(name: 'screen_name')
          String screenName,
      @JsonKey(name: 'statuses_count')
          int statusesCount,
      @JsonKey(name: 'translator_type')
          String translatorType,
      @JsonKey(name: 'url')
          String? url,
      @JsonKey(name: 'verified')
          bool verified,
      @JsonKey(name: 'want_retweets')
          bool wantRetweets,
      @JsonKey(name: 'withheld_in_countries')
          List<dynamic> withheldInCountries});
}

/// @nodoc
class _$UserLegacyCopyWithImpl<$Res, $Val extends UserLegacy>
    implements $UserLegacyCopyWith<$Res> {
  _$UserLegacyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blocking = freezed,
    Object? canDm = null,
    Object? canMediaTag = null,
    Object? createdAt = null,
    Object? defaultProfile = null,
    Object? defaultProfileImage = null,
    Object? description = null,
    Object? entities = freezed,
    Object? fastFollowersCount = null,
    Object? favouritesCount = null,
    Object? followedBy = null,
    Object? followersCount = null,
    Object? following = null,
    Object? friendsCount = null,
    Object? hasCustomTimelines = null,
    Object? isTranslator = null,
    Object? listedCount = null,
    Object? location = null,
    Object? mediaCount = null,
    Object? name = null,
    Object? normalFollowersCount = null,
    Object? pinnedTweetIdsStr = null,
    Object? possiblySensitive = null,
    Object? profileBannerUrl = freezed,
    Object? profileImageUrlHttps = null,
    Object? profileInterstitialType = null,
    Object? screenName = null,
    Object? statusesCount = null,
    Object? translatorType = null,
    Object? url = freezed,
    Object? verified = null,
    Object? wantRetweets = null,
    Object? withheldInCountries = null,
  }) {
    return _then(_value.copyWith(
      blocking: freezed == blocking
          ? _value.blocking
          : blocking // ignore: cast_nullable_to_non_nullable
              as dynamic,
      canDm: null == canDm
          ? _value.canDm
          : canDm // ignore: cast_nullable_to_non_nullable
              as bool,
      canMediaTag: null == canMediaTag
          ? _value.canMediaTag
          : canMediaTag // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      defaultProfile: null == defaultProfile
          ? _value.defaultProfile
          : defaultProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultProfileImage: null == defaultProfileImage
          ? _value.defaultProfileImage
          : defaultProfileImage // ignore: cast_nullable_to_non_nullable
              as bool,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      entities: freezed == entities
          ? _value.entities
          : entities // ignore: cast_nullable_to_non_nullable
              as dynamic,
      fastFollowersCount: null == fastFollowersCount
          ? _value.fastFollowersCount
          : fastFollowersCount // ignore: cast_nullable_to_non_nullable
              as int,
      favouritesCount: null == favouritesCount
          ? _value.favouritesCount
          : favouritesCount // ignore: cast_nullable_to_non_nullable
              as int,
      followedBy: null == followedBy
          ? _value.followedBy
          : followedBy // ignore: cast_nullable_to_non_nullable
              as bool,
      followersCount: null == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      following: null == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as bool,
      friendsCount: null == friendsCount
          ? _value.friendsCount
          : friendsCount // ignore: cast_nullable_to_non_nullable
              as int,
      hasCustomTimelines: null == hasCustomTimelines
          ? _value.hasCustomTimelines
          : hasCustomTimelines // ignore: cast_nullable_to_non_nullable
              as bool,
      isTranslator: null == isTranslator
          ? _value.isTranslator
          : isTranslator // ignore: cast_nullable_to_non_nullable
              as bool,
      listedCount: null == listedCount
          ? _value.listedCount
          : listedCount // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      mediaCount: null == mediaCount
          ? _value.mediaCount
          : mediaCount // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      normalFollowersCount: null == normalFollowersCount
          ? _value.normalFollowersCount
          : normalFollowersCount // ignore: cast_nullable_to_non_nullable
              as int,
      pinnedTweetIdsStr: null == pinnedTweetIdsStr
          ? _value.pinnedTweetIdsStr
          : pinnedTweetIdsStr // ignore: cast_nullable_to_non_nullable
              as List<String>,
      possiblySensitive: null == possiblySensitive
          ? _value.possiblySensitive
          : possiblySensitive // ignore: cast_nullable_to_non_nullable
              as bool,
      profileBannerUrl: freezed == profileBannerUrl
          ? _value.profileBannerUrl
          : profileBannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageUrlHttps: null == profileImageUrlHttps
          ? _value.profileImageUrlHttps
          : profileImageUrlHttps // ignore: cast_nullable_to_non_nullable
              as String,
      profileInterstitialType: null == profileInterstitialType
          ? _value.profileInterstitialType
          : profileInterstitialType // ignore: cast_nullable_to_non_nullable
              as String,
      screenName: null == screenName
          ? _value.screenName
          : screenName // ignore: cast_nullable_to_non_nullable
              as String,
      statusesCount: null == statusesCount
          ? _value.statusesCount
          : statusesCount // ignore: cast_nullable_to_non_nullable
              as int,
      translatorType: null == translatorType
          ? _value.translatorType
          : translatorType // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      wantRetweets: null == wantRetweets
          ? _value.wantRetweets
          : wantRetweets // ignore: cast_nullable_to_non_nullable
              as bool,
      withheldInCountries: null == withheldInCountries
          ? _value.withheldInCountries
          : withheldInCountries // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserLegacyCopyWith<$Res>
    implements $UserLegacyCopyWith<$Res> {
  factory _$$_UserLegacyCopyWith(
          _$_UserLegacy value, $Res Function(_$_UserLegacy) then) =
      __$$_UserLegacyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'blocking')
          dynamic blocking,
      @JsonKey(name: 'can_dm')
          bool canDm,
      @JsonKey(name: 'can_media_tag')
          bool canMediaTag,
      @JsonKey(name: 'created_at')
          String createdAt,
      @JsonKey(name: 'default_profile')
          bool defaultProfile,
      @JsonKey(name: 'default_profile_image')
          bool defaultProfileImage,
      @JsonKey(name: 'description')
          String description,
      @JsonKey(name: 'entities')
          dynamic entities,
      @JsonKey(name: 'fast_followers_count')
          int fastFollowersCount,
      @JsonKey(name: 'favourites_count')
          int favouritesCount,
      @JsonKey(name: 'followed_by', defaultValue: false)
          bool followedBy,
      @JsonKey(name: 'followers_count')
          int followersCount,
      @JsonKey(name: 'following', defaultValue: false)
          bool following,
      @JsonKey(name: 'friends_count')
          int friendsCount,
      @JsonKey(name: 'has_custom_timelines')
          bool hasCustomTimelines,
      @JsonKey(name: 'is_translator')
          bool isTranslator,
      @JsonKey(name: 'listed_count')
          int listedCount,
      @JsonKey(name: 'location')
          String location,
      @JsonKey(name: 'media_count')
          int mediaCount,
      @JsonKey(name: 'name')
          String name,
      @JsonKey(name: 'normal_followers_count')
          int normalFollowersCount,
      @JsonKey(name: 'pinned_tweet_ids_str')
          List<String> pinnedTweetIdsStr,
      @JsonKey(name: 'possibly_sensitive')
          bool possiblySensitive,
      @JsonKey(name: 'profile_banner_url')
          String? profileBannerUrl,
      @JsonKey(name: 'profile_image_url_https')
          String profileImageUrlHttps,
      @JsonKey(name: 'profile_interstitial_type')
          String profileInterstitialType,
      @JsonKey(name: 'screen_name')
          String screenName,
      @JsonKey(name: 'statuses_count')
          int statusesCount,
      @JsonKey(name: 'translator_type')
          String translatorType,
      @JsonKey(name: 'url')
          String? url,
      @JsonKey(name: 'verified')
          bool verified,
      @JsonKey(name: 'want_retweets')
          bool wantRetweets,
      @JsonKey(name: 'withheld_in_countries')
          List<dynamic> withheldInCountries});
}

/// @nodoc
class __$$_UserLegacyCopyWithImpl<$Res>
    extends _$UserLegacyCopyWithImpl<$Res, _$_UserLegacy>
    implements _$$_UserLegacyCopyWith<$Res> {
  __$$_UserLegacyCopyWithImpl(
      _$_UserLegacy _value, $Res Function(_$_UserLegacy) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blocking = freezed,
    Object? canDm = null,
    Object? canMediaTag = null,
    Object? createdAt = null,
    Object? defaultProfile = null,
    Object? defaultProfileImage = null,
    Object? description = null,
    Object? entities = freezed,
    Object? fastFollowersCount = null,
    Object? favouritesCount = null,
    Object? followedBy = null,
    Object? followersCount = null,
    Object? following = null,
    Object? friendsCount = null,
    Object? hasCustomTimelines = null,
    Object? isTranslator = null,
    Object? listedCount = null,
    Object? location = null,
    Object? mediaCount = null,
    Object? name = null,
    Object? normalFollowersCount = null,
    Object? pinnedTweetIdsStr = null,
    Object? possiblySensitive = null,
    Object? profileBannerUrl = freezed,
    Object? profileImageUrlHttps = null,
    Object? profileInterstitialType = null,
    Object? screenName = null,
    Object? statusesCount = null,
    Object? translatorType = null,
    Object? url = freezed,
    Object? verified = null,
    Object? wantRetweets = null,
    Object? withheldInCountries = null,
  }) {
    return _then(_$_UserLegacy(
      blocking: freezed == blocking
          ? _value.blocking
          : blocking // ignore: cast_nullable_to_non_nullable
              as dynamic,
      canDm: null == canDm
          ? _value.canDm
          : canDm // ignore: cast_nullable_to_non_nullable
              as bool,
      canMediaTag: null == canMediaTag
          ? _value.canMediaTag
          : canMediaTag // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      defaultProfile: null == defaultProfile
          ? _value.defaultProfile
          : defaultProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultProfileImage: null == defaultProfileImage
          ? _value.defaultProfileImage
          : defaultProfileImage // ignore: cast_nullable_to_non_nullable
              as bool,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      entities: freezed == entities
          ? _value.entities
          : entities // ignore: cast_nullable_to_non_nullable
              as dynamic,
      fastFollowersCount: null == fastFollowersCount
          ? _value.fastFollowersCount
          : fastFollowersCount // ignore: cast_nullable_to_non_nullable
              as int,
      favouritesCount: null == favouritesCount
          ? _value.favouritesCount
          : favouritesCount // ignore: cast_nullable_to_non_nullable
              as int,
      followedBy: null == followedBy
          ? _value.followedBy
          : followedBy // ignore: cast_nullable_to_non_nullable
              as bool,
      followersCount: null == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      following: null == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as bool,
      friendsCount: null == friendsCount
          ? _value.friendsCount
          : friendsCount // ignore: cast_nullable_to_non_nullable
              as int,
      hasCustomTimelines: null == hasCustomTimelines
          ? _value.hasCustomTimelines
          : hasCustomTimelines // ignore: cast_nullable_to_non_nullable
              as bool,
      isTranslator: null == isTranslator
          ? _value.isTranslator
          : isTranslator // ignore: cast_nullable_to_non_nullable
              as bool,
      listedCount: null == listedCount
          ? _value.listedCount
          : listedCount // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      mediaCount: null == mediaCount
          ? _value.mediaCount
          : mediaCount // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      normalFollowersCount: null == normalFollowersCount
          ? _value.normalFollowersCount
          : normalFollowersCount // ignore: cast_nullable_to_non_nullable
              as int,
      pinnedTweetIdsStr: null == pinnedTweetIdsStr
          ? _value._pinnedTweetIdsStr
          : pinnedTweetIdsStr // ignore: cast_nullable_to_non_nullable
              as List<String>,
      possiblySensitive: null == possiblySensitive
          ? _value.possiblySensitive
          : possiblySensitive // ignore: cast_nullable_to_non_nullable
              as bool,
      profileBannerUrl: freezed == profileBannerUrl
          ? _value.profileBannerUrl
          : profileBannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageUrlHttps: null == profileImageUrlHttps
          ? _value.profileImageUrlHttps
          : profileImageUrlHttps // ignore: cast_nullable_to_non_nullable
              as String,
      profileInterstitialType: null == profileInterstitialType
          ? _value.profileInterstitialType
          : profileInterstitialType // ignore: cast_nullable_to_non_nullable
              as String,
      screenName: null == screenName
          ? _value.screenName
          : screenName // ignore: cast_nullable_to_non_nullable
              as String,
      statusesCount: null == statusesCount
          ? _value.statusesCount
          : statusesCount // ignore: cast_nullable_to_non_nullable
              as int,
      translatorType: null == translatorType
          ? _value.translatorType
          : translatorType // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      wantRetweets: null == wantRetweets
          ? _value.wantRetweets
          : wantRetweets // ignore: cast_nullable_to_non_nullable
              as bool,
      withheldInCountries: null == withheldInCountries
          ? _value._withheldInCountries
          : withheldInCountries // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserLegacy extends _UserLegacy {
  const _$_UserLegacy(
      {@JsonKey(name: 'blocking')
          required this.blocking,
      @JsonKey(name: 'can_dm')
          required this.canDm,
      @JsonKey(name: 'can_media_tag')
          required this.canMediaTag,
      @JsonKey(name: 'created_at')
          required this.createdAt,
      @JsonKey(name: 'default_profile')
          required this.defaultProfile,
      @JsonKey(name: 'default_profile_image')
          required this.defaultProfileImage,
      @JsonKey(name: 'description')
          required this.description,
      @JsonKey(name: 'entities')
          required this.entities,
      @JsonKey(name: 'fast_followers_count')
          required this.fastFollowersCount,
      @JsonKey(name: 'favourites_count')
          required this.favouritesCount,
      @JsonKey(name: 'followed_by', defaultValue: false)
          required this.followedBy,
      @JsonKey(name: 'followers_count')
          required this.followersCount,
      @JsonKey(name: 'following', defaultValue: false)
          required this.following,
      @JsonKey(name: 'friends_count')
          required this.friendsCount,
      @JsonKey(name: 'has_custom_timelines')
          required this.hasCustomTimelines,
      @JsonKey(name: 'is_translator')
          required this.isTranslator,
      @JsonKey(name: 'listed_count')
          required this.listedCount,
      @JsonKey(name: 'location')
          required this.location,
      @JsonKey(name: 'media_count')
          required this.mediaCount,
      @JsonKey(name: 'name')
          required this.name,
      @JsonKey(name: 'normal_followers_count')
          required this.normalFollowersCount,
      @JsonKey(name: 'pinned_tweet_ids_str')
          required final List<String> pinnedTweetIdsStr,
      @JsonKey(name: 'possibly_sensitive')
          required this.possiblySensitive,
      @JsonKey(name: 'profile_banner_url')
          required this.profileBannerUrl,
      @JsonKey(name: 'profile_image_url_https')
          required this.profileImageUrlHttps,
      @JsonKey(name: 'profile_interstitial_type')
          required this.profileInterstitialType,
      @JsonKey(name: 'screen_name')
          required this.screenName,
      @JsonKey(name: 'statuses_count')
          required this.statusesCount,
      @JsonKey(name: 'translator_type')
          required this.translatorType,
      @JsonKey(name: 'url')
          required this.url,
      @JsonKey(name: 'verified')
          required this.verified,
      @JsonKey(name: 'want_retweets')
          required this.wantRetweets,
      @JsonKey(name: 'withheld_in_countries')
          required final List<dynamic> withheldInCountries})
      : _pinnedTweetIdsStr = pinnedTweetIdsStr,
        _withheldInCountries = withheldInCountries,
        super._();

  factory _$_UserLegacy.fromJson(Map<String, dynamic> json) =>
      _$$_UserLegacyFromJson(json);

// @JsonKey(name: 'blocked_by') required bool blockedBy,
  @override
  @JsonKey(name: 'blocking')
  final dynamic blocking;
  @override
  @JsonKey(name: 'can_dm')
  final bool canDm;
  @override
  @JsonKey(name: 'can_media_tag')
  final bool canMediaTag;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
// Sun Sep 19 10:49:08 +0000 2021
  @override
  @JsonKey(name: 'default_profile')
  final bool defaultProfile;
  @override
  @JsonKey(name: 'default_profile_image')
  final bool defaultProfileImage;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'entities')
  final dynamic entities;
  @override
  @JsonKey(name: 'fast_followers_count')
  final int fastFollowersCount;
  @override
  @JsonKey(name: 'favourites_count')
  final int favouritesCount;
// @JsonKey(name: 'follow_request_sent') required bool followRequestSent,
  @override
  @JsonKey(name: 'followed_by', defaultValue: false)
  final bool followedBy;
// ?
  @override
  @JsonKey(name: 'followers_count')
  final int followersCount;
  @override
  @JsonKey(name: 'following', defaultValue: false)
  final bool following;
// ?
  @override
  @JsonKey(name: 'friends_count')
  final int friendsCount;
  @override
  @JsonKey(name: 'has_custom_timelines')
  final bool hasCustomTimelines;
  @override
  @JsonKey(name: 'is_translator')
  final bool isTranslator;
  @override
  @JsonKey(name: 'listed_count')
  final int listedCount;
  @override
  @JsonKey(name: 'location')
  final String location;
  @override
  @JsonKey(name: 'media_count')
  final int mediaCount;
// @JsonKey(name: 'muting') required bool muting,
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'normal_followers_count')
  final int normalFollowersCount;
// @JsonKey(name: 'notifications') required bool notifications,
  final List<String> _pinnedTweetIdsStr;
// @JsonKey(name: 'notifications') required bool notifications,
  @override
  @JsonKey(name: 'pinned_tweet_ids_str')
  List<String> get pinnedTweetIdsStr {
    if (_pinnedTweetIdsStr is EqualUnmodifiableListView)
      return _pinnedTweetIdsStr;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pinnedTweetIdsStr);
  }

  @override
  @JsonKey(name: 'possibly_sensitive')
  final bool possiblySensitive;
// @JsonKey(name: 'profile_banner_extensions') required dynamic profileBannerExtensions,
  @override
  @JsonKey(name: 'profile_banner_url')
  final String? profileBannerUrl;
// @JsonKey(name: 'profile_image_extensions') required dynamic profileImageExtensions,
  @override
  @JsonKey(name: 'profile_image_url_https')
  final String profileImageUrlHttps;
  @override
  @JsonKey(name: 'profile_interstitial_type')
  final String profileInterstitialType;
// @JsonKey(name: 'protected') required bool protected,
  @override
  @JsonKey(name: 'screen_name')
  final String screenName;
  @override
  @JsonKey(name: 'statuses_count')
  final int statusesCount;
  @override
  @JsonKey(name: 'translator_type')
  final String translatorType;
  @override
  @JsonKey(name: 'url')
  final String? url;
  @override
  @JsonKey(name: 'verified')
  final bool verified;
  @override
  @JsonKey(name: 'want_retweets')
  final bool wantRetweets;
  final List<dynamic> _withheldInCountries;
  @override
  @JsonKey(name: 'withheld_in_countries')
  List<dynamic> get withheldInCountries {
    if (_withheldInCountries is EqualUnmodifiableListView)
      return _withheldInCountries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_withheldInCountries);
  }

  @override
  String toString() {
    return 'UserLegacy(blocking: $blocking, canDm: $canDm, canMediaTag: $canMediaTag, createdAt: $createdAt, defaultProfile: $defaultProfile, defaultProfileImage: $defaultProfileImage, description: $description, entities: $entities, fastFollowersCount: $fastFollowersCount, favouritesCount: $favouritesCount, followedBy: $followedBy, followersCount: $followersCount, following: $following, friendsCount: $friendsCount, hasCustomTimelines: $hasCustomTimelines, isTranslator: $isTranslator, listedCount: $listedCount, location: $location, mediaCount: $mediaCount, name: $name, normalFollowersCount: $normalFollowersCount, pinnedTweetIdsStr: $pinnedTweetIdsStr, possiblySensitive: $possiblySensitive, profileBannerUrl: $profileBannerUrl, profileImageUrlHttps: $profileImageUrlHttps, profileInterstitialType: $profileInterstitialType, screenName: $screenName, statusesCount: $statusesCount, translatorType: $translatorType, url: $url, verified: $verified, wantRetweets: $wantRetweets, withheldInCountries: $withheldInCountries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserLegacy &&
            const DeepCollectionEquality().equals(other.blocking, blocking) &&
            (identical(other.canDm, canDm) || other.canDm == canDm) &&
            (identical(other.canMediaTag, canMediaTag) ||
                other.canMediaTag == canMediaTag) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.defaultProfile, defaultProfile) ||
                other.defaultProfile == defaultProfile) &&
            (identical(other.defaultProfileImage, defaultProfileImage) ||
                other.defaultProfileImage == defaultProfileImage) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.entities, entities) &&
            (identical(other.fastFollowersCount, fastFollowersCount) ||
                other.fastFollowersCount == fastFollowersCount) &&
            (identical(other.favouritesCount, favouritesCount) ||
                other.favouritesCount == favouritesCount) &&
            (identical(other.followedBy, followedBy) ||
                other.followedBy == followedBy) &&
            (identical(other.followersCount, followersCount) ||
                other.followersCount == followersCount) &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.friendsCount, friendsCount) ||
                other.friendsCount == friendsCount) &&
            (identical(other.hasCustomTimelines, hasCustomTimelines) ||
                other.hasCustomTimelines == hasCustomTimelines) &&
            (identical(other.isTranslator, isTranslator) ||
                other.isTranslator == isTranslator) &&
            (identical(other.listedCount, listedCount) ||
                other.listedCount == listedCount) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.mediaCount, mediaCount) ||
                other.mediaCount == mediaCount) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.normalFollowersCount, normalFollowersCount) ||
                other.normalFollowersCount == normalFollowersCount) &&
            const DeepCollectionEquality()
                .equals(other._pinnedTweetIdsStr, _pinnedTweetIdsStr) &&
            (identical(other.possiblySensitive, possiblySensitive) ||
                other.possiblySensitive == possiblySensitive) &&
            (identical(other.profileBannerUrl, profileBannerUrl) ||
                other.profileBannerUrl == profileBannerUrl) &&
            (identical(other.profileImageUrlHttps, profileImageUrlHttps) ||
                other.profileImageUrlHttps == profileImageUrlHttps) &&
            (identical(
                    other.profileInterstitialType, profileInterstitialType) ||
                other.profileInterstitialType == profileInterstitialType) &&
            (identical(other.screenName, screenName) ||
                other.screenName == screenName) &&
            (identical(other.statusesCount, statusesCount) ||
                other.statusesCount == statusesCount) &&
            (identical(other.translatorType, translatorType) ||
                other.translatorType == translatorType) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.wantRetweets, wantRetweets) ||
                other.wantRetweets == wantRetweets) &&
            const DeepCollectionEquality()
                .equals(other._withheldInCountries, _withheldInCountries));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(blocking),
        canDm,
        canMediaTag,
        createdAt,
        defaultProfile,
        defaultProfileImage,
        description,
        const DeepCollectionEquality().hash(entities),
        fastFollowersCount,
        favouritesCount,
        followedBy,
        followersCount,
        following,
        friendsCount,
        hasCustomTimelines,
        isTranslator,
        listedCount,
        location,
        mediaCount,
        name,
        normalFollowersCount,
        const DeepCollectionEquality().hash(_pinnedTweetIdsStr),
        possiblySensitive,
        profileBannerUrl,
        profileImageUrlHttps,
        profileInterstitialType,
        screenName,
        statusesCount,
        translatorType,
        url,
        verified,
        wantRetweets,
        const DeepCollectionEquality().hash(_withheldInCountries)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserLegacyCopyWith<_$_UserLegacy> get copyWith =>
      __$$_UserLegacyCopyWithImpl<_$_UserLegacy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserLegacyToJson(
      this,
    );
  }
}

abstract class _UserLegacy extends UserLegacy {
  const factory _UserLegacy(
      {@JsonKey(name: 'blocking')
          required final dynamic blocking,
      @JsonKey(name: 'can_dm')
          required final bool canDm,
      @JsonKey(name: 'can_media_tag')
          required final bool canMediaTag,
      @JsonKey(name: 'created_at')
          required final String createdAt,
      @JsonKey(name: 'default_profile')
          required final bool defaultProfile,
      @JsonKey(name: 'default_profile_image')
          required final bool defaultProfileImage,
      @JsonKey(name: 'description')
          required final String description,
      @JsonKey(name: 'entities')
          required final dynamic entities,
      @JsonKey(name: 'fast_followers_count')
          required final int fastFollowersCount,
      @JsonKey(name: 'favourites_count')
          required final int favouritesCount,
      @JsonKey(name: 'followed_by', defaultValue: false)
          required final bool followedBy,
      @JsonKey(name: 'followers_count')
          required final int followersCount,
      @JsonKey(name: 'following', defaultValue: false)
          required final bool following,
      @JsonKey(name: 'friends_count')
          required final int friendsCount,
      @JsonKey(name: 'has_custom_timelines')
          required final bool hasCustomTimelines,
      @JsonKey(name: 'is_translator')
          required final bool isTranslator,
      @JsonKey(name: 'listed_count')
          required final int listedCount,
      @JsonKey(name: 'location')
          required final String location,
      @JsonKey(name: 'media_count')
          required final int mediaCount,
      @JsonKey(name: 'name')
          required final String name,
      @JsonKey(name: 'normal_followers_count')
          required final int normalFollowersCount,
      @JsonKey(name: 'pinned_tweet_ids_str')
          required final List<String> pinnedTweetIdsStr,
      @JsonKey(name: 'possibly_sensitive')
          required final bool possiblySensitive,
      @JsonKey(name: 'profile_banner_url')
          required final String? profileBannerUrl,
      @JsonKey(name: 'profile_image_url_https')
          required final String profileImageUrlHttps,
      @JsonKey(name: 'profile_interstitial_type')
          required final String profileInterstitialType,
      @JsonKey(name: 'screen_name')
          required final String screenName,
      @JsonKey(name: 'statuses_count')
          required final int statusesCount,
      @JsonKey(name: 'translator_type')
          required final String translatorType,
      @JsonKey(name: 'url')
          required final String? url,
      @JsonKey(name: 'verified')
          required final bool verified,
      @JsonKey(name: 'want_retweets')
          required final bool wantRetweets,
      @JsonKey(name: 'withheld_in_countries')
          required final List<dynamic> withheldInCountries}) = _$_UserLegacy;
  const _UserLegacy._() : super._();

  factory _UserLegacy.fromJson(Map<String, dynamic> json) =
      _$_UserLegacy.fromJson;

  @override // @JsonKey(name: 'blocked_by') required bool blockedBy,
  @JsonKey(name: 'blocking')
  dynamic get blocking;
  @override
  @JsonKey(name: 'can_dm')
  bool get canDm;
  @override
  @JsonKey(name: 'can_media_tag')
  bool get canMediaTag;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override // Sun Sep 19 10:49:08 +0000 2021
  @JsonKey(name: 'default_profile')
  bool get defaultProfile;
  @override
  @JsonKey(name: 'default_profile_image')
  bool get defaultProfileImage;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'entities')
  dynamic get entities;
  @override
  @JsonKey(name: 'fast_followers_count')
  int get fastFollowersCount;
  @override
  @JsonKey(name: 'favourites_count')
  int get favouritesCount;
  @override // @JsonKey(name: 'follow_request_sent') required bool followRequestSent,
  @JsonKey(name: 'followed_by', defaultValue: false)
  bool get followedBy;
  @override // ?
  @JsonKey(name: 'followers_count')
  int get followersCount;
  @override
  @JsonKey(name: 'following', defaultValue: false)
  bool get following;
  @override // ?
  @JsonKey(name: 'friends_count')
  int get friendsCount;
  @override
  @JsonKey(name: 'has_custom_timelines')
  bool get hasCustomTimelines;
  @override
  @JsonKey(name: 'is_translator')
  bool get isTranslator;
  @override
  @JsonKey(name: 'listed_count')
  int get listedCount;
  @override
  @JsonKey(name: 'location')
  String get location;
  @override
  @JsonKey(name: 'media_count')
  int get mediaCount;
  @override // @JsonKey(name: 'muting') required bool muting,
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'normal_followers_count')
  int get normalFollowersCount;
  @override // @JsonKey(name: 'notifications') required bool notifications,
  @JsonKey(name: 'pinned_tweet_ids_str')
  List<String> get pinnedTweetIdsStr;
  @override
  @JsonKey(name: 'possibly_sensitive')
  bool get possiblySensitive;
  @override // @JsonKey(name: 'profile_banner_extensions') required dynamic profileBannerExtensions,
  @JsonKey(name: 'profile_banner_url')
  String? get profileBannerUrl;
  @override // @JsonKey(name: 'profile_image_extensions') required dynamic profileImageExtensions,
  @JsonKey(name: 'profile_image_url_https')
  String get profileImageUrlHttps;
  @override
  @JsonKey(name: 'profile_interstitial_type')
  String get profileInterstitialType;
  @override // @JsonKey(name: 'protected') required bool protected,
  @JsonKey(name: 'screen_name')
  String get screenName;
  @override
  @JsonKey(name: 'statuses_count')
  int get statusesCount;
  @override
  @JsonKey(name: 'translator_type')
  String get translatorType;
  @override
  @JsonKey(name: 'url')
  String? get url;
  @override
  @JsonKey(name: 'verified')
  bool get verified;
  @override
  @JsonKey(name: 'want_retweets')
  bool get wantRetweets;
  @override
  @JsonKey(name: 'withheld_in_countries')
  List<dynamic> get withheldInCountries;
  @override
  @JsonKey(ignore: true)
  _$$_UserLegacyCopyWith<_$_UserLegacy> get copyWith =>
      throw _privateConstructorUsedError;
}
