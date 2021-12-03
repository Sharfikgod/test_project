import 'package:json_annotation/json_annotation.dart';
import '../address/address_dto.dart';

import '../../../model/user.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDTO {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final AddressDTO address;

  UserDTO({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.address,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);

  factory UserDTO.fromUser(User user) => UserDTO(
        id: user.id,
        name: user.name,
        username: user.username,
        email: user.email,
        phone: user.phone,
        address: AddressDTO.fromAddres(user.address),
      );

  User toUser() => User(
        id: id,
        name: name,
        username: username,
        email: email,
        phone: phone,
        address: address.toUserAdress(),
      );
}
