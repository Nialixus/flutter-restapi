import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

/// Model used in user's authentication.
class LoginInput {
  /// Used to authenticating user. Requires 2 variable inserted by user.
  const LoginInput({required this.email, required this.password});

  final String email;
  final String password;
}

/// [Response] converter.
@JsonSerializable(anyMap: true)
class LoginOutput {
  /// Convert [Response] to readable [LoginOutput].
  const LoginOutput({
    required this.code,
    required this.status,
    required this.message,
    required this.userName,
    required this.userEmail,
    required this.phoneNumber,
    required this.userCreatedDate,
    required this.userCreatedTimezonetype,
    required this.userCreatedTimezone,
    required this.userUuid,
  });

  final int code;
  final bool status;
  final String message;
  final String userName;
  final String userUuid;
  final String userEmail;
  @JsonKey(fromJson: user)
  final String phoneNumber;
  final DateTime userCreatedDate;
  final String userCreatedTimezone;
  final int userCreatedTimezonetype;

  factory LoginOutput.fromJson(Map<String, dynamic> json) =>
      _$LoginOutputFromJson(json);

  Map<String, dynamic> toJson() => _$LoginOutputToJson(this);

  static String user(Map<dynamic, dynamic> user) => user.toString();
}
