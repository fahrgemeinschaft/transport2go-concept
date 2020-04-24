import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frank_martin/pages/filter/filter_page.dart';
import 'package:frank_martin/pages/search/search_page.dart';
import 'package:frank_martin/providers/model/photon/feature.dart';
import 'package:frank_martin/ui/modal_view/modal_view.dart';
import 'package:r2gapi_flutter_sdk/model/geo_location.dart';
import 'package:r2gapi_flutter_sdk/model/search_radius.dart';

class SearchBar extends StatefulWidget {
  final String emptyTitle;
  final String mode;

  SearchBar({Key key, this.emptyTitle, this.mode}) : super(key: key);

  @override
  SearchBarState createState() => SearchBarState(this.emptyTitle);
}

class SearchBarState extends State<SearchBar> {
  final String emptyTitle;

  SearchBarState(this.emptyTitle);

  String finalPlace;
  Feature searchPlace;

  String radius = "25km";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 50,
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: InkWell(
            onTap: () async {
              var place = await ModalView.of(context).open(
                page: SearchPage(
                  mobile: false,
                ),
                mobilePage: SearchPage(
                  mobile: true,
                )
              );

              setState(() {
                if (place == null) {
                  finalPlace = null;
                  searchPlace = null;
                } else {
                  finalPlace = handleFeatureProperly(place);
                  searchPlace = place;
                }
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    Text(
                      finalPlace != null ? finalPlace : emptyTitle,
                      style: TextStyle(
                          color: finalPlace != null ? Colors.black : Colors.grey
                      ),
                    )
                  ]
                ),
                InkWell(
                  onTap: () async {
                    var place = await ModalView.of(context).open(
                        page: FilterPage(
                          radius: radius,
                          onUpdate: (value) {
                            setState(() {
                              radius = value;
                            });
                          },
                        ),
                        mobilePage: FilterPage(),
                    );
                  },
                  child: SizedBox(
                    height: 50,
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          radius,
                          style: TextStyle(
                              color: Colors.black
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Feature getSearchFeature() {
    return searchPlace;
  }

  SearchRadius getRadius() {
    Map<String, dynamic> location = {
      "latitude": searchPlace.geometry.coordinates[0],
      "longitude": searchPlace.geometry.coordinates[1]
    };

    Map<String, dynamic> map = {
      "location": location,
      "radius": 25
    };

    return map as SearchRadius;
  }

  handleFeatureProperly(Feature itemData) {
    if (itemData.properties.street != null) {
      return itemData.properties.street + (itemData.properties.housenumber != null ? " " + itemData.properties.housenumber : "") + (itemData.properties.city != null ? ", " + itemData.properties.city : "");
    }

    if (itemData.properties.name == itemData.properties.city) {
      return itemData.properties.name + (itemData.properties.housenumber != null ? " " + itemData.properties.housenumber : "");
    } else {
      return itemData.properties.name + (itemData.properties.housenumber != null ? " " + itemData.properties.housenumber : "") + (itemData.properties.city != null ? ", " + itemData.properties.city : "");
    }
  }
}
