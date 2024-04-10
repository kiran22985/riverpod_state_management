class UserModel {
  UserModel({
    required this.name,
    required this.email,
    required this.phone,
  });

  final String name;
  final String email;
  final String phone;

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      name: data['name'],
      email: data['email'],
      phone: data['phone'],
    );
  }
}
