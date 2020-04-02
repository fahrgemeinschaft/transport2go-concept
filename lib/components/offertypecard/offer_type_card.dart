import 'package:flutter/material.dart';

class OfferTypeCard extends StatefulWidget {
  OfferTypeCard({Key key}) : super(key: key);

  @override
  OfferTypeCardState createState() => OfferTypeCardState();
}

class OfferTypeCardState extends State<OfferTypeCard> {
  String searchType = "offer";

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: StadiumBorder(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Card(
                  color: searchType == "offer" ? Colors.blue : Colors.white,
                  elevation: 0,
                  shape: StadiumBorder(
                      side: searchType == "offer" ? BorderSide.none : BorderSide(width: 2, color: Colors.blue.withOpacity(0.6))
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        searchType = "offer";
                      });
                    },
                    child: Container(
                      height: 58,
                      padding: EdgeInsets.symmetric(horizontal: cardWidthPaddingSelector()),
                      child: SizedBox(
                        width: cardWidthSelector(),
                        child: Center(
                          child: Text(
                            "Angebot",
                            style: TextStyle(
                                color: searchType == "offer" ? Colors.white : Colors.black,
                                fontSize: 15
                            ),
                            textAlign: TextAlign.center,
                          )
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                color: searchType == "search" ? Colors.blue : Colors.white,
                elevation: 0,
                shape: StadiumBorder(
                    side: searchType == "search" ? BorderSide.none : BorderSide(width: 2, color: Colors.blue.withOpacity(0.6))
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      searchType = "search";
                    });
                  },
                  child: Container(
                    height: 58,
                    padding: EdgeInsets.symmetric(horizontal: cardWidthPaddingSelector()),
                    child: SizedBox(
                      width: cardWidthSelector(),
                      child: Center(
                        child: Text(
                          "Gesuch",
                          style: TextStyle(
                              color: searchType == "search" ? Colors.white : Colors.black,
                              fontSize: 15
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }

  bool getMobile() {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide < 600;
  }

  double cardWidthPaddingSelector() {
    return getMobile() ? 10 : 20;
  }

  double cardWidthSelector() {
    return getMobile() ? 100 : 200;
  }

  double cardTextWidthSelector() {
    return getMobile() ? 60 : 140;
  }

  String getSearchType() {
    return searchType;
  }
}
