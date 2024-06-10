class UserModel {
  String? id;
  String? name;
  String? email;
  String? prfoileImage;
  String? phoneNumber;

  UserModel(
      {this.id, this.name, this.email, this.prfoileImage, this.phoneNumber});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    prfoileImage = json["prfoileImage"];
    phoneNumber = json["phoneNumber"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["email"] = email;
    data["prfoileImage"] = prfoileImage;
    data["phoneNumber"] = phoneNumber;
    return data;
  }
}
