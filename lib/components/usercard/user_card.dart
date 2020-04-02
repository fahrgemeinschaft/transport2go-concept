import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:frank_martin/components/marquee/marquee_widget.dart';

class UserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 7, top: 5, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    MaterialIcons.people,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Tristan Marsell",
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3),
                    ),
                    Text(
                      "Zuletzt eingeloggt: 21.02.2020",
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3),
                    ),
                    Text(
                      "Mitglied seit: 21.02.2020",
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(
                Foundation.telephone
            ),
            title: Text(
                "Telefonnummer"
            ),
            trailing: MarqueeWidget(
              child: Text(
                "061316961592",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
                Entypo.mobile
            ),
            title: Text(
                "Mobiltelefon"
            ),
            trailing: MarqueeWidget(
              child: Text(
                "017512449122",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
                Fontisto.email
            ),
            title: Text(
                "E-Mail"
            ),
            trailing: MarqueeWidget(
              child: Text(
                "pdesire@test.me",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
