import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:frank_martin/ui/query_limiter/query_limiter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:r2gapi_flutter_sdk/model/time_range.dart';


class DateSelector extends StatefulWidget {
  final ValueChanged<DateTime> onUpdate;

  DateSelector({Key key, this.onUpdate}) : super(key: key);

  @override
  DateSelectorState createState() => DateSelectorState(this.onUpdate);
}

class DateSelectorState extends State<DateSelector> {

  final ValueChanged<DateTime> onUpdate;

  DateSelectorState(this.onUpdate);

  DateTime time = DateTime.now();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Card(
          child: InkWell(
            onTap: () {
              prevDate();
            },
            child: Container(
              height: QueryLimiter.of(context).getLimitedHeight(25, 50, 0.5),
              width: MediaQuery.of(context).size.width * 0.1,
              child: Center(
                child: Icon(
                    Ionicons.ios_arrow_back
                ),
              ),
            ),
          ),
          shape: StadiumBorder(),
        ),
        Card(
          child: InkWell(
            child: Container(
              height: QueryLimiter.of(context).getLimitedHeight(25, 50, 0.5),
              width: MediaQuery.of(context).size.width * 0.6,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: generateDateCards(context),
                ),
              ),
            ),
          ),
          shape: StadiumBorder(),
        ),
        Card(
          child: InkWell(
            onTap: () {
              nextDate();
            },
            child: Container(
              height: QueryLimiter.of(context).getLimitedHeight(25, 50, 0.5),
              width: MediaQuery.of(context).size.width * 0.1,
              child: Center(
                child: Icon(
                    Ionicons.ios_arrow_forward
                ),
              ),
            ),
          ),
          shape: StadiumBorder(),
        ),
        Card(
          child: InkWell(
            onTap: () {
              _selectDate(context);
            },
            child: Container(
              height: QueryLimiter.of(context).getLimitedHeight(25, 50, 0.5),
              width: MediaQuery.of(context).size.width * 0.1,
              child: Center(
                child: Icon(
                    MaterialCommunityIcons.calendar
                ),
              ),
            ),
          ),
          shape: StadiumBorder(),
        ),
      ],
    );
  }

  bool getMobile() {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide < 600;
  }

  double fontSizeSelector() {
    return getMobile() ? 12 : 15;
  }

  double cardWidthPaddingSelector() {
    return getMobile() ? 10 : 20;
  }

  double cardWidthSelector() {
    return getMobile() ? 43 : 75;
  }

  nextDate() {
    setState(() {
      time = time.add(Duration(days: 1));
    });

    onUpdate.call(time);
  }

  prevDate() {
    setState(() {
      time = time.add(Duration(days: 1));
    });

    onUpdate.call(time);
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: time,
        firstDate: time.subtract(Duration(days: 365)),
        lastDate: time.add(Duration(days: 365)),
    );
    if (picked != null && picked != time) {
      setState(() {
        time = picked;
      });
    }
  }

  generateDateCards(BuildContext context) {
    DateTime prev = time.subtract(Duration(days: 1));
    DateTime next = time.add(Duration(days: 1));
    return <Widget>[
      Card(
        color: Colors.white,
        elevation: 0,
        shape: StadiumBorder(
            side: BorderSide(width: 2, color: Colors.blue.withOpacity(0.6))
        ),
        child: InkWell(
          onTap: () {
            prevDate();
          },
          child: Container(
            height: QueryLimiter.of(context).getLimitedHeight(25, 50, 0.5),
            padding: EdgeInsets.symmetric(horizontal: cardWidthPaddingSelector()),
            child: SizedBox(
              width: cardWidthSelector(),
              child: Center(
                child: Text(
                  DateFormat.E('de').format(prev) + " " + prev.day.toString().padLeft(2, '0') + "." + prev.month.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: fontSizeSelector()
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
      Card(
        color: Colors.blue,
        elevation: 0,
        shape: StadiumBorder(),
        child: Container(
          height: QueryLimiter.of(context).getLimitedHeight(25, 50, 0.5),
          padding: EdgeInsets.symmetric(horizontal: cardWidthPaddingSelector()),
          child: SizedBox(
            width: cardWidthSelector(),
            child: Center(
              child: Text(
                DateFormat.E('de').format(time) + " " + time.day.toString().padLeft(2, '0') + "." + time.month.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: fontSizeSelector()
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      Card(
        color: Colors.white,
        elevation: 0,
        shape: StadiumBorder(
            side: BorderSide(width: 2, color: Colors.blue.withOpacity(0.6))
        ),
        child: InkWell(
          onTap: () {
            nextDate();
          },
          child: Container(
            height: QueryLimiter.of(context).getLimitedHeight(25, 50, 0.5),
            padding: EdgeInsets.symmetric(horizontal: cardWidthPaddingSelector()),
            child: SizedBox(
              width: cardWidthSelector(),
              child: Center(
                child: Text(
                  DateFormat.E('de').format(next) + " " + next.day.toString().padLeft(2, '0') + "." + next.month.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: fontSizeSelector()
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    ];
  }

  DateTime getCurrentDate() {
    return time;
  }

  TimeRange getTime() {
    Map<String, dynamic> map = {
      "time": time.toIso8601String(),
      "toleranceInDays": 0
    };

    return map as TimeRange;
  }
}
