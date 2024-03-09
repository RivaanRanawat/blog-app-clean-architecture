// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blog_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BlogModel {
  String get id => throw _privateConstructorUsedError;
  String get posterId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  List<String> get topics => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dateFromJson)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'profiles', fromJson: _posterNameFromJson, includeToJson: false)
  String? get posterName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BlogModelCopyWith<BlogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogModelCopyWith<$Res> {
  factory $BlogModelCopyWith(BlogModel value, $Res Function(BlogModel) then) =
      _$BlogModelCopyWithImpl<$Res, BlogModel>;
  @useResult
  $Res call(
      {String id,
      String posterId,
      String title,
      String content,
      String imageUrl,
      List<String> topics,
      @JsonKey(fromJson: _dateFromJson) DateTime updatedAt,
      @JsonKey(
          name: 'profiles', fromJson: _posterNameFromJson, includeToJson: false)
      String? posterName});
}

/// @nodoc
class _$BlogModelCopyWithImpl<$Res, $Val extends BlogModel>
    implements $BlogModelCopyWith<$Res> {
  _$BlogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? posterId = null,
    Object? title = null,
    Object? content = null,
    Object? imageUrl = null,
    Object? topics = null,
    Object? updatedAt = null,
    Object? posterName = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      posterId: null == posterId
          ? _value.posterId
          : posterId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      topics: null == topics
          ? _value.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<String>,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      posterName: freezed == posterName
          ? _value.posterName
          : posterName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlogModelImplCopyWith<$Res>
    implements $BlogModelCopyWith<$Res> {
  factory _$$BlogModelImplCopyWith(
          _$BlogModelImpl value, $Res Function(_$BlogModelImpl) then) =
      __$$BlogModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String posterId,
      String title,
      String content,
      String imageUrl,
      List<String> topics,
      @JsonKey(fromJson: _dateFromJson) DateTime updatedAt,
      @JsonKey(
          name: 'profiles', fromJson: _posterNameFromJson, includeToJson: false)
      String? posterName});
}

/// @nodoc
class __$$BlogModelImplCopyWithImpl<$Res>
    extends _$BlogModelCopyWithImpl<$Res, _$BlogModelImpl>
    implements _$$BlogModelImplCopyWith<$Res> {
  __$$BlogModelImplCopyWithImpl(
      _$BlogModelImpl _value, $Res Function(_$BlogModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? posterId = null,
    Object? title = null,
    Object? content = null,
    Object? imageUrl = null,
    Object? topics = null,
    Object? updatedAt = null,
    Object? posterName = freezed,
  }) {
    return _then(_$BlogModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      posterId: null == posterId
          ? _value.posterId
          : posterId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      topics: null == topics
          ? _value._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<String>,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      posterName: freezed == posterName
          ? _value.posterName
          : posterName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BlogModelImpl extends _BlogModel {
  const _$BlogModelImpl(
      {required this.id,
      required this.posterId,
      required this.title,
      required this.content,
      required this.imageUrl,
      final List<String> topics = const <String>[],
      @JsonKey(fromJson: _dateFromJson) required this.updatedAt,
      @JsonKey(
          name: 'profiles', fromJson: _posterNameFromJson, includeToJson: false)
      this.posterName})
      : _topics = topics,
        super._();

  @override
  final String id;
  @override
  final String posterId;
  @override
  final String title;
  @override
  final String content;
  @override
  final String imageUrl;
  final List<String> _topics;
  @override
  @JsonKey()
  List<String> get topics {
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topics);
  }

  @override
  @JsonKey(fromJson: _dateFromJson)
  final DateTime updatedAt;
  @override
  @JsonKey(
      name: 'profiles', fromJson: _posterNameFromJson, includeToJson: false)
  final String? posterName;

  @override
  String toString() {
    return 'BlogModel(id: $id, posterId: $posterId, title: $title, content: $content, imageUrl: $imageUrl, topics: $topics, updatedAt: $updatedAt, posterName: $posterName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlogModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.posterId, posterId) ||
                other.posterId == posterId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._topics, _topics) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.posterName, posterName) ||
                other.posterName == posterName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      posterId,
      title,
      content,
      imageUrl,
      const DeepCollectionEquality().hash(_topics),
      updatedAt,
      posterName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlogModelImplCopyWith<_$BlogModelImpl> get copyWith =>
      __$$BlogModelImplCopyWithImpl<_$BlogModelImpl>(this, _$identity);
}

abstract class _BlogModel extends BlogModel {
  const factory _BlogModel(
      {required final String id,
      required final String posterId,
      required final String title,
      required final String content,
      required final String imageUrl,
      final List<String> topics,
      @JsonKey(fromJson: _dateFromJson) required final DateTime updatedAt,
      @JsonKey(
          name: 'profiles', fromJson: _posterNameFromJson, includeToJson: false)
      final String? posterName}) = _$BlogModelImpl;
  const _BlogModel._() : super._();

  @override
  String get id;
  @override
  String get posterId;
  @override
  String get title;
  @override
  String get content;
  @override
  String get imageUrl;
  @override
  List<String> get topics;
  @override
  @JsonKey(fromJson: _dateFromJson)
  DateTime get updatedAt;
  @override
  @JsonKey(
      name: 'profiles', fromJson: _posterNameFromJson, includeToJson: false)
  String? get posterName;
  @override
  @JsonKey(ignore: true)
  _$$BlogModelImplCopyWith<_$BlogModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
