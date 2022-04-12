class ChangePasswordRewuestModel {
  String? oldPassword;
  String? newPassword;

  ChangePasswordRewuestModel({this.oldPassword, this.newPassword});

  ChangePasswordRewuestModel.fromJson(Map<String, dynamic> json) {
    oldPassword = json['old_password'];
    newPassword = json['new_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['old_password'] = oldPassword;
    data['new_password'] = newPassword;
    return data;
  }
}