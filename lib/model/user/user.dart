import '../address/address.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final Address address;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.address,
  });
}
