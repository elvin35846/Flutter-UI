class StudentRequestModel {
  String? finNumber;
  String? firstName;
  String? lastName;
  String? fatherName;
  String? phoneNumber;
  int? teacher;

  StudentRequestModel(
      {this.finNumber,
      this.firstName,
      this.lastName,
      this.fatherName,
      this.phoneNumber,
      this.teacher = 2});

  StudentRequestModel.fromJson(Map<String, dynamic> json) {
    finNumber = json['fin_number'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fatherName = json['father_name'];
    phoneNumber = json['phone_number'];
    teacher = json['teacher'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fin_number'] = this.finNumber;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['father_name'] = this.fatherName;
    data['phone_number'] = this.phoneNumber;
    data['teacher'] = this.teacher;
    return data;
  }
}
