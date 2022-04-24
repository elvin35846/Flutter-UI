class PasswordChangeRequestModel {
  String? oldPassword;
  String? newPassword;

  PasswordChangeRequestModel({this.oldPassword, this.newPassword});

  PasswordChangeRequestModel.fromJson(Map<String, dynamic> json) {
    oldPassword = json['old_password'];
    newPassword = json['new_password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['old_password'] = oldPassword;
    data['new_password'] = newPassword;
    return data;
  }
}
