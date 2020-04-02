import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:frank_martin/providers/model/photon/feature.dart';
import 'package:frank_martin/providers/services/photon/photon_service.dart';

class SearchPage extends StatelessWidget {

  final bool mobile;

  const SearchPage({Key key, this.mobile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            height: 55,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: mobile != true ? MediaQuery.of(context).size.width * 0.05 : MediaQuery.of(context).size.width * 0.1,
                  child: IconButton(
                    icon: Icon(Ionicons.ios_arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop(null);
                    },
                  ),
                ),
                SizedBox(
                  width: mobile != true ? MediaQuery.of(context).size.width * 0.4 : MediaQuery.of(context).size.width * 0.8,
                  child: TypeAheadFormField(
                    textFieldConfiguration: TextFieldConfiguration(
                        autofocus: true,
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: "Ort eingeben",
                          hintStyle: TextStyle(
                              color: Colors.grey
                          ),
                          border: InputBorder.none,
                          fillColor: Colors.transparent,
                        )
                    ),
                    suggestionsCallback: (pattern) async {
                      return await getResults(pattern);
                    },
                    onSuggestionSelected: (Feature itemData) async {

                    },
                    itemBuilder: (BuildContext context, Feature itemData) {
                      return Listener(
                        child: Container(
                          color: Colors.white,
                          child: ListTile(
                            leading: Icon(handleIcon(itemData), color: Colors.black),
                            title: Text(
                              handleFeatureProperly(itemData),
                              style: TextStyle(
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ),
                        onPointerDown: (_) => Navigator.pop(context, itemData),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: mobile != true ? MediaQuery.of(context).size.width * 0.05 : MediaQuery.of(context).size.width * 0.1,
                  child: Icon(
                    Icons.search,
                    color: Colors.grey,
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
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

  IconData handleIcon(Feature itemData) {
    if (itemData.properties.osmValue == null) {
      return Icons.location_on;
    }

    switch(itemData.properties.osmValue) {
      case "station":
        return Icons.directions_bus;
      case "city":
        return Icons.location_city;
      case "aerodrome":
        return MaterialCommunityIcons.airplane_landing;
    }

    switch(itemData.properties.osmKey) {
      case "tourism":
        return MaterialCommunityIcons.nature_people;
    }

    return Icons.location_on;
  }

  Future<List<Feature>> getResults(String query) {
    return PhotonService.get(query);
  }
}
