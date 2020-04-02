import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class FilterPage extends StatefulWidget {
  FilterPage({Key key, this.radius, this.onUpdate}) : super(key: key);

  final String radius;
  final ValueChanged<String> onUpdate;

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  int animationOffset = 300;

  String finalRadius = "25km";

  int _currentIndex = 4;
  String animals = "irrelevant";

  bool reoccur = false;
  bool adac = false;

  @override
  void initState() {
    super.initState();

    if (widget.radius != null) {
      finalRadius = widget.radius;
    }
  }

  _displayAnimalDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Tiere erlaubt'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RadioListTile(
                  title: Text("Erlaubt"),
                  groupValue: animals,
                  value: "yes",
                  onChanged: (val) {
                    setState(() {
                      animals = val;
                    });
                    Navigator.of(context).pop();
                  },
                ),
                RadioListTile(
                  title: Text("Nicht erlaubt"),
                  groupValue: animals,
                  value: "no",
                  onChanged: (val) {
                    setState(() {
                      animals = val;
                    });
                    Navigator.of(context).pop();
                  },
                ),
                RadioListTile(
                  title: Text("Egal"),
                  groupValue: animals,
                  value: "irrelevant",
                  onChanged: (val) {
                    setState(() {
                      animals = val;
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  _displayBaggageDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Transportkapazität'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RadioListTile(
                  title: Text("Klein"),
                  groupValue: _currentIndex,
                  value: 0,
                  onChanged: (val) {
                    setState(() {
                      _currentIndex = val;
                    });
                    Navigator.of(context).pop();
                  },
                ),
                RadioListTile(
                  title: Text("Mittel"),
                  groupValue: _currentIndex,
                  value: 1,
                  onChanged: (val) {
                    setState(() {
                      _currentIndex = val;
                    });
                    Navigator.of(context).pop();
                  },
                ),
                RadioListTile(
                  title: Text("Groß"),
                  groupValue: _currentIndex,
                  value: 2,
                  onChanged: (val) {
                    setState(() {
                      _currentIndex = val;
                    });
                    Navigator.of(context).pop();
                  },
                ),
                RadioListTile(
                  title: Text("Sehr Groß"),
                  groupValue: _currentIndex,
                  value: 3,
                  onChanged: (val) {
                    setState(() {
                      _currentIndex = val;
                    });
                    Navigator.of(context).pop();
                  },
                ),
                RadioListTile(
                  title: Text("Egal"),
                  groupValue: _currentIndex,
                  value: 4,
                  onChanged: (val) {
                    setState(() {
                      _currentIndex = val;
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "Umkreis",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          ListTile(
            leading: Icon(
                MaterialCommunityIcons.radar
            ),
            title: Text(
                "Transportumkreis"
            ),
            trailing: DropdownButton<String>(
              value: finalRadius,
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
                  finalRadius = newValue;
                  widget.onUpdate(finalRadius);
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
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Container(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "Details",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          ListTile(
            leading: Icon(
                MaterialCommunityIcons.forklift
            ),
            title: Text(
                "Transportkapazität"
            ),
            trailing: Text(
              getBaggageString(),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue
              ),
            ),
            onTap: () async {
              _displayBaggageDialog(context);
            },
          ),
          ListTile(
            leading: Icon(
                MaterialCommunityIcons.dog_side
            ),
            title: Text(
                "Tiertransport"
            ),
            trailing: Text(
              getAnimalString(),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue
              ),
            ),
            onTap: () async {
              _displayAnimalDialog(context);
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
                  } else {
                    reoccur = true;
                  }
                });
              },
            ),
            onTap: () async {
              setState(() {
                if (reoccur == true) {
                  reoccur = false;
                } else {
                  reoccur = true;
                }
              });
            },
          ),
          ListTile(
            leading: Icon(
                Icons.lock
            ),
            title: Text(
                "Nur ADAC-verifizierte Fahrer"
            ),
            trailing: Checkbox(
              value: reoccur,
              onChanged: (bool value) {
                setState(() {
                  if (reoccur == true) {
                    adac = false;
                  } else {
                    adac = true;
                  }
                });
              },
            ),
            onTap: () async {
              setState(() {
                if (reoccur == true) {
                  adac = false;
                } else {
                  adac = true;
                }
              });
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 40),
          ),
        ],
      ),
    );
  }

  String getBaggageString() {
    switch(_currentIndex) {
      case 0:
        return "Klein";
      case 1:
        return "Mittel";
      case 2:
        return "Groß";
      case 3:
        return "Sehr Groß";
      case 4:
        return "Egal";
      default:
        return "Egal";
    }
  }

  String getAnimalString() {
    if (animals == "yes") {
      return "Erlaubt";
    } else if (animals == "no") {
      return "Nicht erlaubt";
    } else {
      return "Egal";
    }
  }
}
