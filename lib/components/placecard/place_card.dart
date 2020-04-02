import 'package:flutter/material.dart';
import 'package:frank_martin/components/marquee/marquee_widget.dart';

class PlaceCard extends StatelessWidget {
  final String time;
  final String name;

  const PlaceCard({Key key, this.time, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
              time,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
              ),
              Icon(
                Icons.location_on,
                color: Colors.grey,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: MarqueeWidget(
                  child: Text(
                    name,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15
                    ),
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}
