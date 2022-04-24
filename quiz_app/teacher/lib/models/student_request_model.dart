class StudentRequestModel {
  String? username;
  String? firstName;
  String? lastName;
  String? fatherName;
  String? phoneNumber;
  bool? isActive;
  int? allowedMobileCount;
  int? allowedPcCount;
  int? remainingDays;

  StudentRequestModel(
      {this.username,
      this.firstName,
      this.lastName,
      this.fatherName,
      this.phoneNumber,
      this.isActive,
      this.allowedMobileCount,
      this.allowedPcCount,
      this.remainingDays});

  StudentRequestModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fatherName = json['father_name'];
    phoneNumber = json['phone_number'];
    isActive = json['is_active'];
    allowedMobileCount = json['allowed_mobile_count'];
    allowedPcCount = json['allowed_pc_count'];
    remainingDays = json['remaining_days'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['father_name'] = fatherName;
    data['phone_number'] = phoneNumber;
    data['is_active'] = isActive;
    data['allowed_mobile_count'] = allowedMobileCount;
    data['allowed_pc_count'] = allowedPcCount;
    data['remaining_days'] = remainingDays;
    return data;
  }
}
