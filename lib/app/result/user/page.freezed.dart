// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalcParam {
  List<UserTableData> get left => throw _privateConstructorUsedError;
  List<UserTableData> get right => throw _privateConstructorUsedError;
  OperatorType get operator => throw _privateConstructorUsedError;
  SortType get sortType => throw _privateConstructorUsedError;
  SortBy get sortBy => throw _privateConstructorUsedError;
  String get search => throw _privateConstructorUsedError;
  SearchType get searchType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalcParamCopyWith<CalcParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalcParamCopyWith<$Res> {
  factory $CalcParamCopyWith(CalcParam value, $Res Function(CalcParam) then) =
      _$CalcParamCopyWithImpl<$Res, CalcParam>;
  @useResult
  $Res call(
      {List<UserTableData> left,
      List<UserTableData> right,
      OperatorType operator,
      SortType sortType,
      SortBy sortBy,
      String search,
      SearchType searchType});
}

/// @nodoc
class _$CalcParamCopyWithImpl<$Res, $Val extends CalcParam>
    implements $CalcParamCopyWith<$Res> {
  _$CalcParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? left = null,
    Object? right = null,
    Object? operator = null,
    Object? sortType = null,
    Object? sortBy = null,
    Object? search = null,
    Object? searchType = null,
  }) {
    return _then(_value.copyWith(
      left: null == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as List<UserTableData>,
      right: null == right
          ? _value.right
          : right // ignore: cast_nullable_to_non_nullable
              as List<UserTableData>,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as OperatorType,
      sortType: null == sortType
          ? _value.sortType
          : sortType // ignore: cast_nullable_to_non_nullable
              as SortType,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as SortBy,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      searchType: null == searchType
          ? _value.searchType
          : searchType // ignore: cast_nullable_to_non_nullable
              as SearchType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalcParamImplCopyWith<$Res>
    implements $CalcParamCopyWith<$Res> {
  factory _$$CalcParamImplCopyWith(
          _$CalcParamImpl value, $Res Function(_$CalcParamImpl) then) =
      __$$CalcParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<UserTableData> left,
      List<UserTableData> right,
      OperatorType operator,
      SortType sortType,
      SortBy sortBy,
      String search,
      SearchType searchType});
}

/// @nodoc
class __$$CalcParamImplCopyWithImpl<$Res>
    extends _$CalcParamCopyWithImpl<$Res, _$CalcParamImpl>
    implements _$$CalcParamImplCopyWith<$Res> {
  __$$CalcParamImplCopyWithImpl(
      _$CalcParamImpl _value, $Res Function(_$CalcParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? left = null,
    Object? right = null,
    Object? operator = null,
    Object? sortType = null,
    Object? sortBy = null,
    Object? search = null,
    Object? searchType = null,
  }) {
    return _then(_$CalcParamImpl(
      left: null == left
          ? _value._left
          : left // ignore: cast_nullable_to_non_nullable
              as List<UserTableData>,
      right: null == right
          ? _value._right
          : right // ignore: cast_nullable_to_non_nullable
              as List<UserTableData>,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as OperatorType,
      sortType: null == sortType
          ? _value.sortType
          : sortType // ignore: cast_nullable_to_non_nullable
              as SortType,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as SortBy,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      searchType: null == searchType
          ? _value.searchType
          : searchType // ignore: cast_nullable_to_non_nullable
              as SearchType,
    ));
  }
}

/// @nodoc

class _$CalcParamImpl with DiagnosticableTreeMixin implements _CalcParam {
  const _$CalcParamImpl(
      {required final List<UserTableData> left,
      required final List<UserTableData> right,
      required this.operator,
      required this.sortType,
      required this.sortBy,
      required this.search,
      required this.searchType})
      : _left = left,
        _right = right;

  final List<UserTableData> _left;
  @override
  List<UserTableData> get left {
    if (_left is EqualUnmodifiableListView) return _left;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_left);
  }

  final List<UserTableData> _right;
  @override
  List<UserTableData> get right {
    if (_right is EqualUnmodifiableListView) return _right;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_right);
  }

  @override
  final OperatorType operator;
  @override
  final SortType sortType;
  @override
  final SortBy sortBy;
  @override
  final String search;
  @override
  final SearchType searchType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CalcParam(left: $left, right: $right, operator: $operator, sortType: $sortType, sortBy: $sortBy, search: $search, searchType: $searchType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CalcParam'))
      ..add(DiagnosticsProperty('left', left))
      ..add(DiagnosticsProperty('right', right))
      ..add(DiagnosticsProperty('operator', operator))
      ..add(DiagnosticsProperty('sortType', sortType))
      ..add(DiagnosticsProperty('sortBy', sortBy))
      ..add(DiagnosticsProperty('search', search))
      ..add(DiagnosticsProperty('searchType', searchType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalcParamImpl &&
            const DeepCollectionEquality().equals(other._left, _left) &&
            const DeepCollectionEquality().equals(other._right, _right) &&
            (identical(other.operator, operator) ||
                other.operator == operator) &&
            (identical(other.sortType, sortType) ||
                other.sortType == sortType) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.searchType, searchType) ||
                other.searchType == searchType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_left),
      const DeepCollectionEquality().hash(_right),
      operator,
      sortType,
      sortBy,
      search,
      searchType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalcParamImplCopyWith<_$CalcParamImpl> get copyWith =>
      __$$CalcParamImplCopyWithImpl<_$CalcParamImpl>(this, _$identity);
}

abstract class _CalcParam implements CalcParam {
  const factory _CalcParam(
      {required final List<UserTableData> left,
      required final List<UserTableData> right,
      required final OperatorType operator,
      required final SortType sortType,
      required final SortBy sortBy,
      required final String search,
      required final SearchType searchType}) = _$CalcParamImpl;

  @override
  List<UserTableData> get left;
  @override
  List<UserTableData> get right;
  @override
  OperatorType get operator;
  @override
  SortType get sortType;
  @override
  SortBy get sortBy;
  @override
  String get search;
  @override
  SearchType get searchType;
  @override
  @JsonKey(ignore: true)
  _$$CalcParamImplCopyWith<_$CalcParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
