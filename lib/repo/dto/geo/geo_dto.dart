import 'package:json_annotation/json_annotation.dart';

import '../../../model/geo.dart';

part 'geo_dto.g.dart';

@JsonSerializable()
class GeoDTO {
  final String lat;
  final String lng;

  GeoDTO({
    required this.lat,
    required this.lng,
  });

  factory GeoDTO.fromJson(Map<String, dynamic> json) => _$GeoDTOFromJson(json);

  factory GeoDTO.fromGeo(Geo geo) => GeoDTO(
        lat: geo.lat,
        lng: geo.lng,
      );

  Geo toGeo() => Geo(
        lat: lat,
        lng: lng,
      );
}
