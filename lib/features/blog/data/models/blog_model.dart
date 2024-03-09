import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_model.freezed.dart';
part 'blog_model.g.dart';

/// An external function to convert the json to DateTime
DateTime _dateFromJson(String? json) =>
    json == null ? DateTime.now() : DateTime.parse(json);

/// An external function to parse the poster name
String? _posterNameFromJson(Map<String, dynamic>? json) =>
    json?['profiles']['name'] as String?;

@Freezed(fromJson: false, toJson: false)
@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class BlogModel with _$BlogModel {
  const BlogModel._();

  const factory BlogModel({
    required String id,
    required String posterId,
    required String title,
    required String content,
    required String imageUrl,
    @Default(<String>[]) List<String> topics,
    @JsonKey(fromJson: _dateFromJson) required DateTime updatedAt,
    @JsonKey(fromJson: _posterNameFromJson, includeToJson: false)
    String? posterName,
  }) = _BlogModel;

  factory BlogModel.fromJson(Map<String, dynamic> json) =>
      _$BlogModelFromJson(json);

  Map<String, dynamic> toJson() => _$BlogModelToJson(this);
}
