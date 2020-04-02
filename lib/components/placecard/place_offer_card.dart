import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:frank_martin/pages/search/search_page.dart';
import 'package:frank_martin/providers/model/photon/feature.dart';
import 'package:frank_martin/ui/modal_view/modal_view.dart';

class PlaceOfferCard extends StatefulWidget {
  PlaceOfferCard({Key key}) : super(key: key);

  @override
  _PlaceOfferCardState createState() => _PlaceOfferCardState();
}

class _PlaceOfferCardState extends State<PlaceOfferCard> {
  String finalFromPlace;
  Feature searchFromPlace;
  String finalFromRadius = "0m";

  String finalToPlace;
  Feature searchToPlace;
  String finalToRadius = "0m";

  bool transportTo = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
                Icons.location_on
            ),
            title: Text(
                "Transport von (optional)"
            ),
            trailing: Text(
              finalFromPlace != null ? finalFromPlace : "",
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black
              ),
            ),
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
                  finalFromPlace = null;
                  searchFromPlace = null;
                } else {
                  finalFromPlace = place.properties.name;
                  searchFromPlace = place;
                }
              });
            },
          ),
          finalFromPlace != null ? ListTile(
            leading: Icon(
                MaterialCommunityIcons.radar
            ),
            title: Text(
                "Transportumkreis Abholgebiet (optional)"
            ),
            trailing: DropdownButton<String>(
              value: finalFromRadius,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontSize: 15,
                  decoration: TextDecoration.none
              ),
              underline: Container(
                height: 2,
                color: Colors.black,
              ),
              onChanged: (String newValue) {
                setState(() {
                  finalFromRadius = newValue;
                });
              },
              items: <String>['0m', '100m', '200m', '500m', '1km', '2km', '5km', '10km', '25km', '50km']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ) : Container(),
          ListTile(
            leading: Icon(
                Icons.location_on
            ),
            title: Text(
                "Transport nach (optional)"
            ),
            trailing: Text(
              finalToPlace != null ? finalToPlace : "",
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black
              ),
            ),
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
                  finalToPlace = null;
                  searchToPlace = null;
                } else {
                  finalToPlace = place.properties.name;
                  searchToPlace = place;
                }
              });
            },
          ),
          finalToPlace != null ? ListTile(
            leading: Icon(
                MaterialCommunityIcons.radar
            ),
            title: Text(
                "Transportumkreis Anliefergebiet (optional)"
            ),
            trailing: DropdownButton<String>(
              value: finalToRadius,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontSize: 15,
                  decoration: TextDecoration.none
              ),
              underline: Container(
                height: 2,
                color: Colors.black,
              ),
              onChanged: (String newValue) {
                setState(() {
                  finalToRadius = newValue;
                });
              },
              items: <String>['0m', '100m', '200m', '500m', '1km', '2km', '5km', '10km', '25km', '50km']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ) : Container(),
        ],
      ),
    );
  }
}
