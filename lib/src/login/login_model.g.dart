// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginOutput _$LoginOutputFromJson(Map json) => LoginOutput(
      code: json['code'] as int,
      status: json['status'] as bool,
      message: json['message'] as String,
      userName: json['userName'] as String,
      userEmail: json['userEmail'] as String,
      phoneNumber: LoginOutput.user(json['phoneNumber'] as Map),
      userCreatedDate: DateTime.parse(json['userCreatedDate'] as String),
      userCreatedTimezonetype: json['userCreatedTimezonetype'] as int,
      userCreatedTimezone: json['userCreatedTimezone'] as String,
      userUuid: json['userUuid'] as String,
    );

Map<String, dynamic> _$LoginOutputToJson(LoginOutput instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'message': instance.message,
      'userName': instance.userName,
      'userUuid': instance.userUuid,
      'userEmail': instance.userEmail,
      'phoneNumber': instance.phoneNumber,
      'userCreatedDate': instance.userCreatedDate.toIso8601String(),
      'userCreatedTimezone': instance.userCreatedTimezone,
      'userCreatedTimezonetype': instance.userCreatedTimezonetype,
    };
