/// [Response] converter used in user's authentication.
class LoginResponse {
  /// Convert [Response] to readable [LoginResponse].
  const LoginResponse({
    required this.code,
    required this.status,
    required this.message,
    required this.userName,
    required this.userUuid,
    required this.userEmail,
    required this.userPhonenumber,
    required this.userCreatedDate,
    required this.userCreatedTimezone,
    required this.userCreatedTimezonetype,
  });

  ///```json
  ///{"code": 200, ...}
  ///```
  final int code;

  ///```json
  ///{"status": true, ...}
  ///```
  final bool status;

  ///```json
  ///{"message": "User logged in", ...}
  ///```
  final String message;

  ///```json
  ///{"user":
  ///   {"name": "John Smith", ...}
  ///}
  ///```
  final String userName;

  ///```json
  ///{"user":
  ///   {"uuid": "ec155431-a85b", ...}
  ///}
  ///```
  final String userUuid;

  ///```json
  ///{"user":
  ///   {"email": "sample@mail.com", ...}
  ///}
  ///```
  final String userEmail;

  ///```json
  ///{"user":
  ///   {"phone_number": "+12345678", ...}
  ///}
  ///```
  final String userPhonenumber;

  ///```json
  ///{"user":
  ///   {"created":
  ///       {"date": "1975-01-01", ...}
  ///   }
  ///}
  ///```
  final DateTime userCreatedDate;

  ///```json
  ///{"user":
  ///   {"created":
  ///       {"timezone": "UTC", ...}
  ///   }
  ///}
  ///```
  final String userCreatedTimezone;

  ///```json
  ///{"user":
  ///   {"created":
  ///       {"timezone_type": 3, ...}
  ///   }
  ///}
  ///```
  final int userCreatedTimezonetype;

  /// Decode [Response] to [LoginResponse].
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      code: json['code'] as int,
      status: json['status'] as bool,
      message: json['message'] as String,
      userName: json['user']['name'] as String,
      userUuid: json['user']['uuid'] as String,
      userEmail: json['user']['email'] as String,
      userPhonenumber: json['user']['phone_number'] as String,
      userCreatedTimezone: json['user']['created']['timezone'] as String,
      userCreatedTimezonetype: json['user']['created']['timezone_type'] as int,
      userCreatedDate:
          DateTime.parse(json['user']['created']['date'] as String),
    );
  }
}
