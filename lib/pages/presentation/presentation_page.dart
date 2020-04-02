import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:frank_martin/components/showup/show_up.dart';
import 'package:frank_martin/pages/start/start_page.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class PresentationPage extends StatefulWidget {
  PresentationPage({Key key}) : super(key: key);

  @override
  _PresentationPageState createState() => _PresentationPageState();
}

class _PresentationPageState extends State<PresentationPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: <Widget>[
          new Expanded(
            child: new Welcome(0),
          ),
        ],
      ),
    );
  }
}

class Welcome extends StatelessWidget {
  final List<List<IconData>> images = [
    [MaterialCommunityIcons.truck_fast, MaterialCommunityIcons.account_heart, FontAwesome5Solid.hand_holding_heart, FontAwesome5Solid.hands_helping],
  ];

  final List<String> titles = [
    "Gemeinsam etwas erreichen",
  ];
  final List<String> subtitles = [
    "Helfen Sie anderen beim Transportieren! \n \nTransport2go vermittelt Angebote und Gesuche für den Transport von Gütern, z.B. \n•  Mitnahme von Gegenständen in Fahrzeugen (z.B. Mitfahrgelegenheit für Dinge) \n•  Nachbarschaftshilfe (z.B. Einkauf und Transport für immobile Menschen) \n•  Lieferangebote von Geschäften (z.B. lokale Apotheken, Lebensmittelläden, etc.) \n \nTransport2go ist für jeden kostenlos zugänglich und funktioniert wie eine Pinnwand: \n•  Nutzer können Angebote und Gesuche eigenständig anbieten und suchen \n•  Nutzer treten direkt miteinander in Kontakt (i.d.R. per Telefon oder Email) \n•  Abhol- und Anliefergebiet können einzeln angegeben werden (z.B. nur Angabe von Anliefergebiet)"
  ];

  final List<Color> backgroundColors = [
    Colors.blue
  ];

  final List<bool> showButton = [false, false, false, false, true];

  final index;

  Welcome(this.index);

  @override
  Widget build(BuildContext context) {
    return new TransformerPageView(
      index: index,
      loop: false,
      transformer: new PageTransformerBuilder(
          builder: (Widget child, TransformInfo info) {
            return new ParallaxColor(
              colors: backgroundColors,
              info: info,
              child: new Column(
                children: <Widget>[
                  new Expanded(
                      child: new ParallaxContainer(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ShowUp(
                              delay: 300,
                              duration: Duration(seconds: 1),
                              child: new Icon(
                                images[info.index][0],
                                color: Colors.white,
                                size: MediaQuery.of(context).size.width * 0.18,
                              ),
                            ),
                            ShowUp(
                              delay: 400,
                              duration: Duration(seconds: 1),
                              child: new Icon(
                                images[info.index][1],
                                color: Colors.white,
                                size: MediaQuery.of(context).size.width * 0.18,
                              ),
                            ),
                            ShowUp(
                              delay: 500,
                              duration: Duration(seconds: 1),
                              child: new Icon(
                                images[info.index][2],
                                color: Colors.white,
                                size: MediaQuery.of(context).size.width * 0.18,
                              ),
                            ),
                            ShowUp(
                              delay: 600,
                              duration: Duration(seconds: 1),
                              child: new Icon(
                                images[info.index][3],
                                color: Colors.white,
                                size: MediaQuery.of(context).size.width * 0.18,
                              ),
                            ),
                          ],
                        ),
                        position: info.position,
                        opacityFactor: 1.0,
                        translationFactor: 400.0,
                      )),
                  new ParallaxContainer(
                    child: ShowUp(
                      delay: 100,
                      duration: Duration(seconds: 1),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: new Text(
                          titles[info.index],
                          style: new TextStyle(fontSize: 30.0, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    position: info.position,
                    translationFactor: 100.0,
                  ),
                  new ParallaxContainer(
                    child: new Padding(
                        padding: new EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 50.0),
                        child: ShowUp(
                          delay: 200,
                          duration: Duration(seconds: 1),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.90,
                            child: Center(
                              child: new Text(subtitles[info.index],
                                  textAlign: TextAlign.left,
                                  style: new TextStyle(
                                      fontSize: 13.0, color: Colors.white)),
                            ),
                          ),
                        )),
                    position: info.position,
                    translationFactor: 50.0,
                  ),
                  new Visibility(
                    visible: true,
                    child: new ParallaxContainer(
                      child: new Padding(
                        padding: new EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 50.0),
                        child: new OutlineButton(
                            highlightElevation: 0,
                            borderSide: new BorderSide(
                                style: BorderStyle.solid,
                                width: 2,
                                color: Colors.white),
                            highlightedBorderColor: Colors.white,
                            child: Text(
                                "Fortfahren",
                                style: new TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 17,
                                    color: Colors.white)),
                            onPressed: () async {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => StartPage()));
                            }),
                      ),
                      position: info.position,
                      translationFactor: 50.0,
                    ),
                  )
                ],
              ),
            );
          }),
      itemCount: 1,
    );
  }
}
