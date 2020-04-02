import 'package:flutter/material.dart';

class DescriptionCard extends StatelessWidget {

  final String text;

  const DescriptionCard({Key key, this.text}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                  text
              ),
            )
          ],
        ),
      ),
    );
  }
}
