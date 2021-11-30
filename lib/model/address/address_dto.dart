import 'package:json_annotation/json_annotation.dart';

import '../geo/geo_dto.dart';
import 'address.dart';

part 'address_dto.g.dart';

@JsonSerializable()
class AddressDTO {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoDTO geo;

  AddressDTO({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory AddressDTO.fromJson(Map<String, dynamic> json) => _$AddressDTOFromJson(json);

  factory AddressDTO.fromAddres(Address addres) => AddressDTO(
        street: addres.street,
        suite: addres.suite,
        city: addres.city,
        zipcode: addres.zipcode,
        geo: GeoDTO.fromGeo(addres.geo),
      );

  Address toUserAdress() => Address(
        street: street,
        suite: suite,
        city: city,
        zipcode: zipcode,
        geo: geo.toGeo(),
      );
}
