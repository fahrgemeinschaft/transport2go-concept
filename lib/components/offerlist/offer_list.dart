import 'package:flutter/material.dart';
import 'package:frank_martin/components/offerlisttile/offer_list_tile.dart';

class OfferList extends StatefulWidget {

  final String mode;

  const OfferList({Key key, this.mode}) : super(key: key);

  @override
  _OfferListState createState() => _OfferListState(this.mode);
}

class _OfferListState extends State<OfferList> {

  final String mode;

  final _parentKey = GlobalKey();

  _OfferListState(this.mode);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(
            thickness: 1,
            height: 3,
          ),
        ),
        OfferListTile(
          key: _parentKey,
          time: "12:25 Uhr",
          from: "Kruppstraße, Frankfurt am Main",
          to: "Lambertstraße, Mainz",
          shortDescription: "Wir kaufen immer gerne im REWE ein, und wollen besonders älteren Menschen...",
          price: "2€",
          mode: mode,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(
            thickness: 1,
            height: 3,
          ),
        ),
        OfferListTile(
          time: "12:50 Uhr",
          from: "Kruppstraße, Frankfurt am Main",
          shortDescription: "Wir liefern überall hin. Menschen über 50 bekommen sogar...",
          price: "1€",
          mode: mode,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(
            thickness: 1,
            height: 3,
          ),
        ),
        OfferListTile(
          time: "16:10 Uhr",
          to: "Lambertstraße, Mainz",
          shortDescription: "Wir wohnen in Mainz-Finthen und sind gerne bereit euch beim Einkaufen...",
          price: "Kostenlos",
          mode: mode,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(
            thickness: 1,
            height: 3,
          ),
        ),
        OfferListTile(
          time: "19:00 Uhr",
          from: "Königsborn, Mainz-Finthen",
          shortDescription: "Ältere Menschen können zu uns kommen und wir...",
          price: "Absprache",
          mode: mode,
        ),
      ],
    );
  }
}
