import 'dart:convert';

import 'package:flutter/foundation.dart';

class Properties {
  int osmId;
  String osmType;
  String country;
  String osmKey;
  String city;
  String osmValue;
  String postcode;
  String name;
  String state;
  List<double> extent;
  String street;
  String housenumber;

  Properties({
    @required this.osmId,
    @required this.osmType,
    @required this.country,
    @required this.osmKey,
    @required this.city,
    @required this.osmValue,
    @required this.postcode,
    @required this.name,
    @required this.state,
    @required this.extent,
    @required this.street,
    @required this.housenumber,
  });

  factory Properties.fromRawJson(String str) => Properties.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    osmId: json["osm_id"] == null ? null : json["osm_id"],
    osmType: json["osm_type"] == null ? null : json["osm_type"],
    country: json["country"] == null ? null : json["country"],
    osmKey: json["osm_key"] == null ? null : json["osm_key"],
    city: json["city"] == null ? null : json["city"],
    osmValue: json["osm_value"] == null ? null : json["osm_value"],
    postcode: json["postcode"] == null ? null : json["postcode"],
    name: json["name"] == null ? null : json["name"],
    state: json["state"] == null ? null : json["state"],
    extent: json["extent"] == null ? null : List<double>.from(json["extent"].map((x) => x.toDouble())),
    street: json["street"] == null ? null : json["street"],
    housenumber: json["housenumber"] == null ? null : json["housenumber"],
  );

  Map<String, dynamic> toJson() => {
    "osm_id": osmId == null ? null : osmId,
    "osm_type": osmType == null ? null : osmType,
    "country": country == null ? null : country,
    "osm_key": osmKey == null ? null : osmKey,
    "city": city == null ? null : city,
    "osm_value": osmValue == null ? null : osmValue,
    "postcode": postcode == null ? null : postcode,
    "name": name == null ? null : name,
    "state": state == null ? null : state,
    "extent": extent == null ? null : List<dynamic>.from(extent.map((x) => x)),
    "street": street == null ? null : street,
    "housenumber": housenumber == null ? null : housenumber,
  };
}
