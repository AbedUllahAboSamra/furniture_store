import 'package:equatable/equatable.dart';

class User extends Equatable {
  String id;
  final String fullName;
  final String email;
  final String phone;
  final String country;
  final String password;
  final String imageUrl;

   User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.country,
    required this.password,
    required this.imageUrl,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        fullName,
        email,
        phone,
        country,
        password,
        imageUrl,
      ];
}
