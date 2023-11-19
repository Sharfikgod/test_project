import 'package:json_annotation/json_annotation.dart';
import 'package:test_project/data/models/contact_us.dart';

part 'contact_us_dto.g.dart';

@JsonSerializable()
class ContactUsDTO {
  final String name;
  final String email;
  final String message;
  ContactUsDTO({
    required this.name,
    required this.email,
    required this.message,
  });
  Map<String, dynamic> toJson() => _$ContactUsDTOToJson(this);

  factory ContactUsDTO.fromJson(Map<String, dynamic> json) => _$ContactUsDTOFromJson(json);

  ContactUs toContactUs() => ContactUs(email: email, name: name, message: message);
}
