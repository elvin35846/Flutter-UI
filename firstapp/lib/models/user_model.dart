class UsersModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  UsersModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });
  UsersModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId']?.toInt();
    id = json['id']?.toInt();
    title = json['title']?.toString();
    body = json['body']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
