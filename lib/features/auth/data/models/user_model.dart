import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// Parse the user_metadata from the json and return the name
String _nameReader(Map<dynamic, dynamic> json, String key) {
  if (json.containsKey(key)) return json[key]['name'] as String;
  return json['name'] as String;
}

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    String? email,
    @JsonKey(name: 'user_metadata', readValue: _nameReader)
    required String name,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
