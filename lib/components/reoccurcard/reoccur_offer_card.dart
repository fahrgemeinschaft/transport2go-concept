import 'package:flutter/material.dart';

class ReoccurOfferCard extends StatefulWidget {
  ReoccurOfferCard({Key key}) : super(key: key);

  @override
  _ReoccurOfferCardState createState() => _ReoccurOfferCardState();
}

class _ReoccurOfferCardState extends State<ReoccurOfferCard> {
  Map<String, bool> datemap = {
    "mo": false,
    "tu": false,
    "we": false,
    "th": false,
    "fr": false,
    "sa": false,
    "su": false
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
                        side: datemap['mo'] == true
                            ? BorderSide.none
                            : BorderSide(
                            width: 2, color: Colors.blue.withOpacity(0.6))
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (datemap['mo'] == false) {
                            datemap['mo'] = true;
                          } else {
                            datemap['mo'] = false;
                          }
                        });
                      },
                      child: Container(
                        height: 38,
                        padding: EdgeInsets.symmetric(
                            horizontal: cardWidthPaddingSelector()),
                        child: SizedBox(
                          width: cardWidthSelector(),
                          child: Center(
                            child: Text(
                              "MO",
                              style: TextStyle(
                                  color: datemap['mo'] == true
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: datemap['tu'] == true ? Colors.blue : Colors.white,
                    elevation: 0,
                    shape: StadiumBorder(
                        side: datemap['tu'] == true
                            ? BorderSide.none
                            : BorderSide(
                            width: 2, color: Colors.blue.withOpacity(0.6))
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (datemap['tu'] == false) {
                            datemap['tu'] = true;
                          } else {
                            datemap['tu'] = false;
                          }
                        });
                      },
                      child: Container(
                        height: 38,
                        padding: EdgeInsets.symmetric(
                            horizontal: cardWidthPaddingSelector()),
                        child: SizedBox(
                          width: cardWidthSelector(),
                          child: Center(
                            child: Text(
                              "DI",
                              style: TextStyle(
                                  color: datemap['tu'] == true
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: datemap['we'] == true ? Colors.blue : Colors.white,
                    elevation: 0,
                    shape: StadiumBorder(
                        side: datemap['we'] == true
                            ? BorderSide.none
                            : BorderSide(
                            width: 2, color: Colors.blue.withOpacity(0.6))
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (datemap['we'] == false) {
                            datemap['we'] = true;
                          } else {
                            datemap['we'] = false;
                          }
                        });
                      },
                      child: Container(
                        height: 38,
                        padding: EdgeInsets.symmetric(
                            horizontal: cardWidthPaddingSelector()),
                        child: SizedBox(
                          width: cardWidthSelector(),
                          child: Center(
                            child: Text(
                              "MI",
                              style: TextStyle(
                                  color: datemap['we'] == true
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: datemap['th'] == true ? Colors.blue : Colors.white,
                    elevation: 0,
                    shape: StadiumBorder(
                        side: datemap['th'] == true
                            ? BorderSide.none
                            : BorderSide(
                            width: 2, color: Colors.blue.withOpacity(0.6))
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (datemap['th'] == false) {
                            datemap['th'] = true;
                          } else {
                            datemap['th'] = false;
                          }
                        });
                      },
                      child: Container(
                        height: 38,
                        padding: EdgeInsets.symmetric(
                            horizontal: cardWidthPaddingSelector()),
                        child: SizedBox(
                          width: cardWidthSelector(),
                          child: Center(
                            child: Text(
                              "DO",
                              style: TextStyle(
                                  color: datemap['th'] == true
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: datemap['fr'] == true ? Colors.blue : Colors.white,
                    elevation: 0,
                    shape: StadiumBorder(
                        side: datemap['fr'] == true
                            ? BorderSide.none
                            : BorderSide(
                            width: 2, color: Colors.blue.withOpacity(0.6))
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (datemap['fr'] == false) {
                            datemap['fr'] = true;
                          } else {
                            datemap['fr'] = false;
                          }
                        });
                      },
                      child: Container(
                        height: 38,
                        padding: EdgeInsets.symmetric(
                            horizontal: cardWidthPaddingSelector()),
                        child: SizedBox(
                          width: cardWidthSelector(),
                          child: Center(
                            child: Text(
                              "FR",
                              style: TextStyle(
                                  color: datemap['fr'] == true
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: datemap['sa'] == true ? Colors.blue : Colors.white,
                    elevation: 0,
                    shape: StadiumBorder(
                        side: datemap['sa'] == true
                            ? BorderSide.none
                            : BorderSide(
                            width: 2, color: Colors.blue.withOpacity(0.6))
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (datemap['sa'] == false) {
                            datemap['sa'] = true;
                          } else {
                            datemap['sa'] = false;
                          }
                        });
                      },
                      child: Container(
                        height: 38,
                        padding: EdgeInsets.symmetric(
                            horizontal: cardWidthPaddingSelector()),
                        child: SizedBox(
                          width: cardWidthSelector(),
                          child: Center(
                            child: Text(
                              "SA",
                              style: TextStyle(
                                  color: datemap['sa'] == true
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: datemap['su'] == true ? Colors.blue : Colors.white,
                    elevation: 0,
                    shape: StadiumBorder(
                        side: datemap['su'] == true
                            ? BorderSide.none
                            : BorderSide(
                            width: 2, color: Colors.blue.withOpacity(0.6))
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (datemap['su'] == false) {
                            datemap['su'] = true;
                          } else {
                            datemap['su'] = false;
                          }
                        });
                      },
                      child: Container(
                        height: 38,
                        padding: EdgeInsets.symmetric(
                            horizontal: cardWidthPaddingSelector()),
                        child: SizedBox(
                          width: cardWidthSelector(),
                          child: Center(
                            child: Text(
                              "SO",
                              style: TextStyle(
                                  color: datemap['su'] == true
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w600,
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
    return getMobile() ? 22 : 50;
  }
}
