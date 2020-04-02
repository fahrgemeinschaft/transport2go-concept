import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'geometry.dart';
import 'properties.dart';

class Feature {
  Geometry geometry;
  String type;
  Properties properties;

  Feature({
    @required this.geometry,
    @required this.type,
    @required this.properties,
  });

  factory Feature.fromRawJson(String str) => Feature.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
    geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
    type: json["type"] == null ? null : json["type"],
    properties: json["properties"] == null ? null : Properties.fromJson(json["properties"]),
  );

  Map<String, dynamic> toJson() => {
    "geometry": geometry == null ? null : geometry.toJson(),
    "type": type == null ? null : type,
    "properties": properties == null ? null : properties.toJson(),
  };
}
