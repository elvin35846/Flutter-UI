class GetStudentModel {
  String? finNumber;
  String? firstName;
  String? lastName;
  String? fatherName;
  String? phoneNumber;
  int? teacherId;

  GetStudentModel(
      {this.finNumber,
      this.firstName,
      this.lastName,
      this.fatherName,
      this.phoneNumber,
      this.teacherId});

  GetStudentModel.fromJson(Map<String, dynamic> json) {
    finNumber = json['fin_number'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fatherName = json['father_name'];
    phoneNumber = json['phone_number'];
    teacherId = json['teacher_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['fin_number'] = finNumber;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['father_name'] = fatherName;
    data['phone_number'] = phoneNumber;
    data['teacher_id'] = teacherId;
    return data;
  }
}
