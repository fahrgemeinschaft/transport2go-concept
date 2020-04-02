import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'feature.dart';

class PhotonData {
  List<Feature> features;
  String type;

  PhotonData({
    @required this.features,
    @required this.type,
  });

  factory PhotonData.fromRawJson(String str) => PhotonData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PhotonData.fromJson(Map<String, dynamic> json) => PhotonData(
    features: json["features"] == null ? null : List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
    type: json["type"] == null ? null : json["type"],
  );

  Map<String, dynamic> toJson() => {
    "features": features == null ? null : List<dynamic>.from(features.map((x) => x.toJson())),
    "type": type == null ? null : type,
  };
}
