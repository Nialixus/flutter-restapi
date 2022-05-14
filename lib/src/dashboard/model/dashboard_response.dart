class DashboardResponse {
  DashboardResponse(
      {required this.code,
      required this.status,
      required this.message,
      required this.articles});

  final int code;
  final bool status;
  final String message;
  final List<DashboardArticle> articles;

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

class DashboardArticle {
  DashboardArticle(
      {required this.uuid,
      required this.title,
      required this.content,
      required this.image,
      required this.views,
      required this.createdDate,
      required this.createdTimezonetype,
      required this.createdTimezone,
      required this.userName,
      required this.userEmail,
      required this.userPhonenumber,
      required this.userCreatedDate,
      required this.userCreatedTimezonetype,
      required this.userCreatedTimezone,
      required this.userUuid});
  final String uuid;
  final String title;
  final String content;
  final String image;
  final int views;
  final DateTime createdDate;
  final int createdTimezonetype;
  final String createdTimezone;
  final String userName;
  final String userEmail;
  final String userPhonenumber;
  final DateTime userCreatedDate;
  final int userCreatedTimezonetype;
  final String userCreatedTimezone;
  final String userUuid;

  factory DashboardArticle.fromJson(Map<String, dynamic> json) {
    return DashboardArticle(
      uuid: json['uuid'],
      title: json['title'],
      content: json['content'],
      image: json['image'],
      views: json['views'] as int,
      createdDate: DateTime.parse(json['created']['date'] as String),
      createdTimezonetype: json['created']['timezone_type'] as int,
      createdTimezone: json['created']['timezone'] as String,
      userName: json['user']['name'] as String,
      userEmail: json['user']['email'] as String,
      userPhonenumber: json['user']['phone_number'] as String,
      userCreatedDate:
          DateTime.parse(json['user']['created']['date'] as String),
      userCreatedTimezonetype: json['user']['created']['timezone_type'] as int,
      userCreatedTimezone: json['user']['created']['timezone'] as String,
      userUuid: json['user']['uuid'] as String,
    );
  }
}
