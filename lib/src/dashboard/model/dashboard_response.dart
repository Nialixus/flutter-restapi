/// A model to decde [Response] and used in [Dashboard].
class DashboardResponse {
  /// Decode [Response] to readable class.
  DashboardResponse({
    required this.code,
    required this.status,
    required this.message,
    required this.articles,
  });

  ///```json
  ///{
  ///   "code" : 200, ...
  ///}
  ///```
  final int code;

  ///```json
  ///{
  ///   "status" : true, ...
  ///}
  ///```
  final bool status;

  ///```json
  ///{
  ///   "message" : "Showing a list ..", ...
  ///}
  ///```
  final String message;

  ///```json
  ///{
  ///   "articles" : [], ...
  ///}
  ///```
  final List<DashboardArticle> articles;

  /// Decode [Response] to [DashboardResponse].
  ///
  /// ```dart
  /// DashboardResponse dashboardResponse = DashboardResponse.fromJson(jsonDecode(response));
  /// ```
  factory DashboardResponse.fromJson(Map<String, dynamic> json) {
    return DashboardResponse(
        code: json['code'] as int,
        status: json['status'] as bool,
        message: json['message'] as String,
        articles: (json['articles'] as List)
            .map((e) => DashboardArticle.fromJson(e))
            .toList());
  }
}

/// A model to decode article from [DashboardResponse]'s article.
class DashboardArticle {
  /// Decode [Response] to readable class.
  DashboardArticle({
    required this.uuid,
    required this.title,
    required this.image,
    required this.views,
    required this.content,
    required this.userUuid,
    required this.userName,
    required this.userEmail,
    required this.createdDate,
    required this.createdTimezone,
    required this.userPhonenumber,
    required this.userCreatedDate,
    required this.createdTimezonetype,
    required this.userCreatedTimezone,
    required this.userCreatedTimezonetype,
  });

  ///```json
  ///{
  ///   "views" : 12678, ...
  ///}
  ///```
  final int views;

  ///```json
  ///{
  ///   "uuid" : "a4751de1", ...
  ///}
  ///```
  final String uuid;

  ///```json
  ///{
  ///   "title" : "Tempora qui id", ...
  ///}
  ///```
  final String title;

  ///```json
  ///{
  ///   "image" : "https://via.place ..", ...
  ///}
  ///```
  final String image;

  ///```json
  ///{
  ///   "content" : "Lorem ipsum dol ..", ...
  ///}
  ///```
  final String content;

  ///```json
  ///{
  ///   "user" : {
  ///       "name" : "John Smith", ...
  ///   }
  ///}
  ///```
  final String userName;

  ///```json
  ///{
  ///   "user" : {
  ///       "uuid" : "a4751de1-2 ..", ...
  ///   }
  ///}
  ///```
  final String userUuid;

  ///```json
  ///{
  ///   "user" : {
  ///       "email" : "sample@mail.com", ...
  ///   }
  ///}
  ///```
  final String userEmail;

  ///```json
  ///{
  ///   "created" : {
  ///       "date" : "1975-01-01", ...
  ///   }
  ///}
  ///```
  final DateTime createdDate;

  ///```json
  ///{
  ///   "created" : {
  ///       "timezone" : "UTC", ...
  ///   }
  ///}
  ///```
  final String createdTimezone;

  ///```json
  ///{
  ///   "user" : {
  ///       "phone_number" : "+123456", ...
  ///   }
  ///}
  ///```
  final String userPhonenumber;

  ///```json
  ///{
  ///   "created" : {
  ///       "timezone_type" : 3, ...
  ///   }
  ///}
  ///```
  final int createdTimezonetype;

  ///```json
  ///{
  ///   "user" : {
  ///       "created" : {
  ///           "date" : "1975-01-01", ...
  ///       }
  ///   }
  ///}
  ///```
  final DateTime userCreatedDate;

  ///```json
  ///{
  ///   "user" : {
  ///       "created" : {
  ///           "timezone" : "UTC", ...
  ///       }
  ///   }
  ///}
  ///```
  final String userCreatedTimezone;

  ///```json
  ///{
  ///   "user" : {
  ///       "created" : {
  ///           "timezone_type" : 3, ...
  ///       }
  ///   }
  ///}
  ///```
  final int userCreatedTimezonetype;

  /// Decode [Response] to [DashboardArticle].
  ///
  /// ```dart
  /// DashboardArticle article = DashboardArticle.fromJson(jsonDecode(response));
  /// ```
  factory DashboardArticle.fromJson(Map<String, dynamic> json) {
    return DashboardArticle(
      views: json['views'] as int,
      uuid: json['uuid'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
      content: json['content'] as String,
      userUuid: json['user']['uuid'] as String,
      userName: json['user']['name'] as String,
      userEmail: json['user']['email'] as String,
      createdTimezone: json['created']['timezone'] as String,
      userPhonenumber: json['user']['phone_number'] as String,
      createdTimezonetype: json['created']['timezone_type'] as int,
      userCreatedDate:
          DateTime.parse(json['user']['created']['date'] as String),
      createdDate: DateTime.parse(json['created']['date'] as String),
      userCreatedTimezone: json['user']['created']['timezone'] as String,
      userCreatedTimezonetype: json['user']['created']['timezone_type'] as int,
    );
  }
}
