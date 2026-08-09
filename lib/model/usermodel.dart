class UserModel {
  final String name;
  final String email;
  final String? bio;
  final String? phone;

  UserModel({
    required this.name,
    required this.email,
    this.bio = "",
    this.phone = "",
  });

  Map<String, dynamic> toMap() {
    return {"name": name, "email": email,"bio":bio,"phone":phone};
  }
}
