import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class DetailCard extends StatelessWidget {
  final String price;

  const DetailCard({Key key, this.price}) : super(key: key);

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
                MaterialCommunityIcons.forklift
            ),
            title: Text(
                "Transportkapazität"
            ),
            trailing: Text(
              "Groß",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue
              ),
            ),
          ),
          ListTile(
            leading: Icon(
                FontAwesome5Solid.money_check_alt
            ),
            title: Text(
                "Liefergebühr"
            ),
            trailing: Text(
              price,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue
              ),
            ),
          ),
          ListTile(
            leading: Icon(
                MaterialCommunityIcons.dog_side
            ),
            title: Text(
                "Tiere"
            ),
            trailing: Text(
              "Erlaubt",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue
              ),
            ),
          ),
        ],
      ),
    );
  }
}
