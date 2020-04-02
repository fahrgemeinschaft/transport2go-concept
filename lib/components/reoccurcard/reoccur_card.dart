import 'package:flutter/material.dart';

class ReoccurCard extends StatefulWidget {
  @override
  _ReoccurCardState createState() => _ReoccurCardState();
}

class _ReoccurCardState extends State<ReoccurCard> {
  Map<String, bool> datemap = {
    "mo": true,
    "tu": true,
    "we": true,
    "th": true,
    "fr": false,
    "sa": true,
    "su": true
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Card(
            shape: StadiumBorder(),
            child: Container(
              padding: EdgeInsets.all(1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Card(
                    color: datemap['mo'] == true ? Colors.blue : Colors.white,
                    elevation: 0,
                    shape: StadiumBorder(
                        side: datemap['mo'] == true ? BorderSide.none : BorderSide(width: 2, color: Colors.blue.withOpacity(0.6))
                    ),
                    child: Container(
                      height: 38,
                      padding: EdgeInsets.symmetric(horizontal: cardWidthPaddingSelector()),
                      child: SizedBox(
                        width: cardWidthSelector(),
                        child: Center(
                          child: Text(
                            "MO",
                            style: TextStyle(
                                color: datemap['mo'] == true ? Colors.white : Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: datemap['tu'] == true ? Colors.blue : Colors.white,
                    elevation: 0,
                    shape: StadiumBorder(
                        side: datemap['tu'] == true ? BorderSide.none : BorderSide(width: 2, color: Colors.blue.withOpacity(0.6))
                    ),
                    child: Container(
                      height: 38,
                      padding: EdgeInsets.symmetric(horizontal: cardWidthPaddingSelector()),
                      child: SizedBox(
                        width: cardWidthSelector(),
                        child: Center(
                          child: Text(
                            "DI",
                            style: TextStyle(
                                color: datemap['tu'] == true ? Colors.white : Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: datemap['we'] == true ? Colors.blue : Colors.white,
                    elevation: 0,
                    shape: StadiumBorder(
                        side: datemap['we'] == true ? BorderSide.none : BorderSide(width: 2, color: Colors.blue.withOpacity(0.6))
                    ),
                    child: Container(
                      height: 38,
                      padding: EdgeInsets.symmetric(horizontal: cardWidthPaddingSelector()),
                      child: SizedBox(
                        width: cardWidthSelector(),
                        child: Center(
                          child: Text(
                            "MI",
                            style: TextStyle(
                                color: datemap['we'] == true ? Colors.white : Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: datemap['th'] == true ? Colors.blue : Colors.white,
                    elevation: 0,
                    shape: StadiumBorder(
                        side: datemap['th'] == true ? BorderSide.none : BorderSide(width: 2, color: Colors.blue.withOpacity(0.6))
                    ),
                    child: Container(
                      height: 38,
                      padding: EdgeInsets.symmetric(horizontal: cardWidthPaddingSelector()),
                      child: SizedBox(
                        width: cardWidthSelector(),
                        child: Center(
                          child: Text(
                            "DO",
                            style: TextStyle(
                                color: datemap['th'] == true ? Colors.white : Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: datemap['fr'] == true ? Colors.blue : Colors.white,
                    elevation: 0,
                    shape: StadiumBorder(
                        side: datemap['fr'] == true ? BorderSide.none : BorderSide(width: 2, color: Colors.blue.withOpacity(0.6))
                    ),
                    child: Container(
                      height: 38,
                      padding: EdgeInsets.symmetric(horizontal: cardWidthPaddingSelector()),
                      child: SizedBox(
                        width: cardWidthSelector(),
                        child: Center(
                          child: Text(
                            "FR",
                            style: TextStyle(
                                color: datemap['fr'] == true ? Colors.white : Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: datemap['sa'] == true ? Colors.blue : Colors.white,
                    elevation: 0,
                    shape: StadiumBorder(
                        side: datemap['sa'] == true ? BorderSide.none : BorderSide(width: 2, color: Colors.blue.withOpacity(0.6))
                    ),
                    child: Container(
                      height: 38,
                      padding: EdgeInsets.symmetric(horizontal: cardWidthPaddingSelector()),
                      child: SizedBox(
                        width: cardWidthSelector(),
                        child: Center(
                          child: Text(
                            "SA",
                            style: TextStyle(
                                color: datemap['sa'] == true ? Colors.white : Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: datemap['su'] == true ? Colors.blue : Colors.white,
                    elevation: 0,
                    shape: StadiumBorder(
                        side: datemap['su'] == true ? BorderSide.none : BorderSide(width: 2, color: Colors.blue.withOpacity(0.6))
                    ),
                    child: Container(
                      height: 38,
                      padding: EdgeInsets.symmetric(horizontal: cardWidthPaddingSelector()),
                      child: SizedBox(
                        width: cardWidthSelector(),
                        child: Center(
                          child: Text(
                            "SO",
                            style: TextStyle(
                                color: datemap['su'] == true ? Colors.white : Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
    return getMobile() ? 33 : 75;
  }
}
