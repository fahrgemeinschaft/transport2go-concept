import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class DetailOfferCard extends StatefulWidget {
  DetailOfferCard({Key key}) : super(key: key);

  @override
  _DetailOfferCardState createState() => _DetailOfferCardState();
}

class _DetailOfferCardState extends State<DetailOfferCard> {
  int _currentIndex = 4;
  String priceInput = "NULL";
  int _priceCurrencyInputIndex = 0;
  String animals = "no";

  TextEditingController _priceTextFieldController = TextEditingController();


  _displayPriceDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Preis'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _priceTextFieldController,
                  decoration: InputDecoration(hintText: "Preis in Zahlen"),
                  inputFormatters: [
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                ),
                RadioListTile(
                  selected: _priceCurrencyInputIndex == 0 ? true : false,
                  title: Text("€"),
                  groupValue: _priceCurrencyInputIndex,
                  value: 0,
                  onChanged: (val) {
                    setState(() {
                      _priceCurrencyInputIndex = val;
                    });
                  },
                ),
                RadioListTile(
                  selected: _priceCurrencyInputIndex == 1 ? true : false,
                  title: Text("CHF"),
                  groupValue: _priceCurrencyInputIndex,
                  value: 1,
                  onChanged: (val) {
                    setState(() {
                      _priceCurrencyInputIndex  = val;
                    });
                  },
                ),
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Abbrechen'),
                onPressed: () {
                  setState(() {
                    priceInput = "NULL";
                  });
                  Navigator.of(context).pop(null);
                },
              ),
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  setState(() {
                    priceInput = _priceTextFieldController.text;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
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
                  title: Text("Auf Absprache"),
                  groupValue: animals,
                  value: "ask",
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
                  title: Text("Keine Angabe"),
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
                FontAwesome5Solid.money_check_alt
            ),
            title: Text(
                "Liefergebühr"
            ),
            trailing: Text(
              getPriceString(),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue
              ),
            ),
            onTap: () async {
              _displayPriceDialog(context);
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
        ],
      ),
    );
  }

  String getPriceString() {
    final n = num.tryParse(priceInput);

    if (n == null) {
      return "Kostenlos";
    } else if (n == 9999999999999){
      return "Absprache";
    } else {
      return priceInput + getPriceCurrency();
    }
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
        return "Keine Angabe";
      default:
        return "Keine Angabe";
    }
  }

  String getAnimalString() {
    if (animals == "yes") {
      return "Erlaubt";
    } else if (animals == "ask") {
      return "Auf Absprache";
    } else {
      return "Nicht erlaubt";
    }
  }

  String getPriceCurrency() {
    switch(_priceCurrencyInputIndex) {
      case 0:
        return "€";
      case 1:
        return " CHF";
      default:
        return "€";
    }
  }
}
