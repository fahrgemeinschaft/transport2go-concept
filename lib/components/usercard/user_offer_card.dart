import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:frank_martin/components/marquee/marquee_widget.dart';

class UserOfferCard extends StatefulWidget {
  UserOfferCard({Key key}) : super(key: key);

  @override
  UserOfferCardState createState() => UserOfferCardState();
}

class UserOfferCardState extends State<UserOfferCard> {

  Map<String, dynamic> telMap = {
    "privacy": 0,
    "value": null
  };

  Map<String, dynamic> mobileMap = {
    "privacy": 0,
    "value": null
  };

  Map<String, dynamic> contactMap = {
    "privacy": 0,
    "value": null
  };

  Map<String, dynamic> emailMap = {
    "privacy": 0,
    "value": null
  };

  Map<String, dynamic> carPlateMap = {
    "privacy": 0,
    "value": null
  };

  Map<String, dynamic> carMap = {
    "privacy": 0,
    "value": null
  };

  TextEditingController _telTextController = TextEditingController();
  TextEditingController _mobileTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _contactNameController = TextEditingController();
  TextEditingController _carController = TextEditingController();
  TextEditingController _carPlateController = TextEditingController();

  _displayTelDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Telefonnummer'),
            content: TextField(
              controller: _telTextController,
              decoration: InputDecoration(hintText: "Telefonnummer eingeben"),
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly
              ],
              keyboardType: TextInputType.number,
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Abbrechen'),
                onPressed: () {
                  setState(() {
                    telMap['value'] = null;
                  });
                  Navigator.of(context).pop(null);
                },
              ),
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  setState(() {
                    telMap['value'] = _telTextController.text;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  _displayMobileDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Mobiltelefon'),
            content: TextField(
              controller: _mobileTextController,
              decoration: InputDecoration(hintText: "Mobilnummer eingeben"),
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly
              ],
              keyboardType: TextInputType.number,
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Abbrechen'),
                onPressed: () {
                  setState(() {
                    telMap['value'] = null;
                  });
                  Navigator.of(context).pop(null);
                },
              ),
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  setState(() {
                    mobileMap['value'] = _mobileTextController.text;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  _displayContactNameDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Kontaktname'),
            content: TextField(
              controller: _contactNameController,
              decoration: InputDecoration(hintText: "Kontaktname eingeben"),
              keyboardType: TextInputType.emailAddress,
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Abbrechen'),
                onPressed: () {
                  setState(() {
                    contactMap['value'] = null;
                  });
                  Navigator.of(context).pop(null);
                },
              ),
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  setState(() {
                    contactMap['value'] = _contactNameController.text;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  _displayEmailDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('E-Mail Adresse'),
            content: TextField(
              controller: _emailTextController,
              decoration: InputDecoration(hintText: "E-Mail Adresse eingeben"),
              keyboardType: TextInputType.emailAddress,
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Abbrechen'),
                onPressed: () {
                  setState(() {
                    emailMap['value'] = null;
                  });
                  Navigator.of(context).pop(null);
                },
              ),
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  setState(() {
                    emailMap['value'] = _emailTextController.text;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  _displayCarDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Auto'),
            content: TextField(
              controller: _carController,
              decoration: InputDecoration(hintText: "Auto eingeben"),
              keyboardType: TextInputType.emailAddress,
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Abbrechen'),
                onPressed: () {
                  setState(() {
                    carMap['value'] = null;
                  });
                  Navigator.of(context).pop(null);
                },
              ),
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  setState(() {
                    carMap['value'] = _carController.text;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  _displayCarPlateDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('KFZ-Kennzeichen'),
            content: TextField(
              controller: _carPlateController,
              decoration: InputDecoration(hintText: "KFZ-Kennzeichen eingeben"),
              keyboardType: TextInputType.emailAddress,
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Abbrechen'),
                onPressed: () {
                  setState(() {
                    carPlateMap['value'] = null;
                  });
                  Navigator.of(context).pop(null);
                },
              ),
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  setState(() {
                    carPlateMap['value'] = _carPlateController.text;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  _displayPrivacyDialog(BuildContext context, String mode) async {
    Map<String, dynamic> map = getMap(mode);

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Privatsphäre'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RadioListTile(
                  title: Text("Für alle sichtbar"),
                  groupValue: map['privacy'],
                  value: 0,
                  onChanged: (val) {
                    setState(() {
                      map['privacy'] = 0;
                      setMap(mode, map);
                    });
                    Navigator.of(context).pop();
                  },
                ),
                RadioListTile(
                  title: Text("Für Mitglieder sichtbar"),
                  groupValue: map['privacy'],
                  value: 1,
                  onChanged: (val) {
                    setState(() {
                      map['privacy'] = 1;
                      setMap(mode, map);
                    });
                    Navigator.of(context).pop();
                  },
                ),
                RadioListTile(
                  title: Text("Für keinen sichtbar"),
                  groupValue: map['privacy'],
                  value: 2,
                  onChanged: (val) {
                    setState(() {
                      map['privacy'] = 2;
                      setMap(mode, map);
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
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
                Ionicons.md_contact
            ),
            title: Text(
                "Kontaktname"
            ),
            trailing: MarqueeWidget(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    contactMap['value'] != null ? contactMap['value'] : "Keine Angabe",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        _displayPrivacyDialog(context, "contact");
                      },
                      icon: selectPrivacyIcon(contactMap)
                  ),
                ],
              ),
            ),
            onTap: () {
              _displayContactNameDialog(context);
            },
          ),
          ListTile(
            leading: Icon(
                Fontisto.email
            ),
            title: Text(
                "E-Mail"
            ),
            trailing: MarqueeWidget(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    emailMap['value'] != null ? emailMap['value'] : "Keine Angabe",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        _displayPrivacyDialog(context, "email");
                      },
                      icon: selectPrivacyIcon(emailMap)
                  ),
                ],
              ),
            ),
            onTap: () {
              _displayEmailDialog(context);
            },
          ),
          ListTile(
            leading: Icon(
                Foundation.telephone
            ),
            title: Text(
                "Telefonnummer"
            ),
            trailing: MarqueeWidget(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    telMap['value'] != null ? telMap['value'] : "Keine Angabe",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _displayPrivacyDialog(context, "tel");
                    },
                    icon: selectPrivacyIcon(telMap)
                  ),
                ],
              ),
            ),
            onTap: () {
              _displayTelDialog(context);
            },
          ),
          ListTile(
            leading: Icon(
                Entypo.mobile
            ),
            title: Text(
                "Mobiltelefon"
            ),
            trailing: MarqueeWidget(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    mobileMap['value'] != null ? mobileMap['value'] : "Keine Angabe",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _displayPrivacyDialog(context, "mobile");
                    },
                    icon: selectPrivacyIcon(mobileMap)
                  ),
                ],
              ),
            ),
            onTap: () {
              _displayMobileDialog(context);
            },
          ),
          ListTile(
            leading: Icon(
                Ionicons.md_car
            ),
            title: Text(
                "Auto"
            ),
            trailing: MarqueeWidget(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    carMap['value'] != null ? carMap['value'] : "Keine Angabe",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        _displayPrivacyDialog(context, "car");
                      },
                      icon: selectPrivacyIcon(carMap)
                  ),
                ],
              ),
            ),
            onTap: () {
              _displayCarDialog(context);
            },
          ),
          ListTile(
            leading: Icon(
                MaterialCommunityIcons.shield_car
            ),
            title: Text(
                "KFZ-Kennzeichen"
            ),
            trailing: MarqueeWidget(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    carPlateMap['value'] != null ? carPlateMap['value'] : "Keine Angabe",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        _displayPrivacyDialog(context, "carPlate");
                      },
                      icon: selectPrivacyIcon(carPlateMap)
                  ),
                ],
              ),
            ),
            onTap: () {
              _displayCarPlateDialog(context);
            },
          ),
        ],
      ),
    );
  }

  Icon selectPrivacyIcon(Map<String, dynamic> map) {
    if (map['privacy'] == 0) {
      return Icon(
        MaterialCommunityIcons.eye_circle,
        color: Colors.black,
      );
    } else if (map['privacy'] == 1) {
      return Icon(
        MaterialCommunityIcons.eye_circle_outline,
        color: Colors.black,
      );
    } else {
      return Icon(
        MaterialCommunityIcons.eye_circle_outline,
        color: Colors.grey,
      );
    }
  }

  getMap(String mode) {
    switch(mode) {
      case "tel":
        return telMap;
      case "mobile":
        return mobileMap;
      case "email":
        return emailMap;
      case "contact":
        return contactMap;
      case "carPlate":
        return carPlateMap;
      case "car":
        return carMap;
    }
  }

  setMap(String mode, Map<String, dynamic> value) {
    switch(mode) {
      case "tel":
        telMap = value;
        break;
      case "mobile":
        mobileMap = value;
        break;
      case "email":
        emailMap = value;
        break;
      case "contact":
        contactMap = value;
        break;
      case "carPlate":
        carPlateMap = value;
        break;
      case "car":
        carMap = value;
        break;
    }
  }
}
