import 'package:flutter/material.dart';

class IconLongButton extends StatelessWidget {

  final Function onPressed;
  final String text;
  final IconData icon;

  const IconLongButton({Key key, this.onPressed, this.text, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      shape: StadiumBorder(),
      color: Colors.blue,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.only(left: 7),
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white
            ),
          )
        ],
      ),
    );
  }
}
