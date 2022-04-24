class RegisterDeviceModel {
  String? key;
  String? keyType;
  String? finNumber;

  RegisterDeviceModel({this.key, this.keyType, this.finNumber});

  RegisterDeviceModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    keyType = json['key_type'];
    finNumber = json['fin_number'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['key'] = key;
    data['key_type'] = keyType;
    data['fin_number'] = finNumber;
    return data;
  }
}
