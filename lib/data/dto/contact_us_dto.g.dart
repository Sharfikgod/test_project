// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_us_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactUsDTO _$ContactUsDTOFromJson(Map<String, dynamic> json) => ContactUsDTO(
      name: json['name'] as String,
      email: json['email'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ContactUsDTOToJson(ContactUsDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'message': instance.message,
    };
