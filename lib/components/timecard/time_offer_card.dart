import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class TimeOfferCard extends StatefulWidget {
  TimeOfferCard({Key key, this.onUpdate}) : super(key: key);

  final ValueChanged<bool> onUpdate;

  @override
  _TimeOfferCardState createState() => _TimeOfferCardState(this.onUpdate);
}

class _TimeOfferCardState extends State<TimeOfferCard> {

  final ValueChanged<bool> onUpdate;

  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  bool reoccur = false;

  _TimeOfferCardState(this.onUpdate);

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date.subtract(Duration(days: 365)),
      lastDate: date.add(Duration(days: 365)),
    );
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
      });
    }
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
              alwaysUse24HourFormat: true
          ),
          child: child,
        );
      },
    );

    if (picked != null && picked != time) {
      setState(() {
        time = picked;
      });
    }
  }

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
                MaterialIcons.date_range
            ),
            title: Text(
                "Datum"
            ),
            trailing: Text(
              date.day.toString().padLeft(2, "0") + "." + date.month.toString().padLeft(2, "0") + "." + date.year.toString().padLeft(4, "0"),
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black
              ),
            ),
            onTap: () async {
              _selectDate(context);
            },
          ),
          ListTile(
            leading: Icon(
                Ionicons.md_time
            ),
            title: Text(
                "Uhrzeit"
            ),
            trailing: Text(
              time.hour.toString().padLeft(2, "0") + ":" + time.minute.toString().padLeft(2, "0"),
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black
              ),
            ),
            onTap: () async {
              _selectTime(context);
            },
          ),
          ListTile(
            leading: Icon(
                AntDesign.retweet
            ),
            title: Text(
                "Wiederholende Fahrt"
            ),
            trailing: Checkbox(
              value: reoccur,
              onChanged: (bool value) {
                setState(() {
                  if (reoccur == true) {
                    reoccur = false;
                    onUpdate.call(false);
                  } else {
                    reoccur = true;
                    onUpdate.call(true);
                  }
                });
              },
            ),
            onTap: () async {
              setState(() {
                if (reoccur == true) {
                  reoccur = false;
                  onUpdate.call(false);
                } else {
                  reoccur = true;
                  onUpdate.call(true);
                }
              });
            },
          )
        ],
      ),
    );
  }

  DateTime getCurrentDate() {
    return date;
  }
}
