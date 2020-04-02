import 'dart:convert';

import 'package:flutter/foundation.dart';

class Geometry {
  List<double> coordinates;
  String type;

  Geometry({
    @required this.coordinates,
    @required this.type,
  });

  factory Geometry.fromRawJson(String str) => Geometry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
    coordinates: json["coordinates"] == null ? null : List<double>.from(json["coordinates"].map((x) => x.toDouble())),
    type: json["type"] == null ? null : json["type"],
  );

  Map<String, dynamic> toJson() => {
    "coordinates": coordinates == null ? null : List<dynamic>.from(coordinates.map((x) => x)),
    "type": type == null ? null : type,
  };
}
