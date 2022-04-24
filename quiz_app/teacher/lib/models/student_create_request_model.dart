class StudentCreateRequestModel {
  String? finNumber;
  String? firstName;
  String? lastName;
  String? fatherName;
  String? phoneNumber;

  StudentCreateRequestModel(
      {this.finNumber,
      this.firstName,
      this.lastName,
      this.fatherName,
      this.phoneNumber});

  StudentCreateRequestModel.fromJson(Map<String, dynamic> json) {
    finNumber = json['fin_number'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fatherName = json['father_name'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['fin_number'] = finNumber;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['father_name'] = fatherName;
    data['phone_number'] = phoneNumber;
    return data;
  }
}
