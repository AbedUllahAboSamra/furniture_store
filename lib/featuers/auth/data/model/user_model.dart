import 'package:equatable/equatable.dart';
import 'package:furniture_store/featuers/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required super.id,
      required super.fullName,
      required super.email,
      required super.phone,
      required super.country,
      required super.password,
      required super.imageUrl});

  factory UserModel.fromJson({required Map<String, dynamic> json}) {
    return UserModel(
        id: json['id'],
        fullName: json['fullName'],
        email: json['email'],
        phone: json['phone'],
        country: json['country'],
        password: json['password'],
        imageUrl: json['imageUrl']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'country': country,
      'password': password,
      'imageUrl': imageUrl,
    };
  }
}
