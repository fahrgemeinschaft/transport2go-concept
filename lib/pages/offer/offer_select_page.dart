import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:frank_martin/components/descriptioncard/description_offer_card.dart';
import 'package:frank_martin/components/detailcard/detail_offer_card.dart';
import 'package:frank_martin/components/dragablescrollbar/dragable_scrollbar.dart';
import 'package:frank_martin/components/iconlongbutton/icon_long_button.dart';
import 'package:frank_martin/components/offertypecard/offer_type_card.dart';
import 'package:frank_martin/components/placecard/place_offer_card.dart';
import 'package:frank_martin/components/reoccurcard/reoccur_offer_card.dart';
import 'package:frank_martin/components/showup/show_up.dart';
import 'package:frank_martin/components/timecard/time_offer_card.dart';
import 'package:frank_martin/components/usercard/user_offer_card.dart';
import 'package:frank_martin/ui/query_limiter/query_limiter.dart';

class OfferSelectPage extends StatefulWidget {
  OfferSelectPage({Key key}) : super(key: key);

  @override
  _OfferSelectPageState createState() => _OfferSelectPageState();
}

class _OfferSelectPageState extends State<OfferSelectPage> {

  int animationOffset = 300;

  bool reoccur = false;

  final ScrollController controller = ScrollController();

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
      body: SafeArea(
        child: Center(
          child: Container(
            width: QueryLimiter.of(context).getLimitedWidth(800, 1000, 0.8),
            child: DraggableScrollbar(
              controller: controller,
              child: ListView(
                controller: controller,
                children: <Widget>[
                  ShowUp(
                    delay: animationOffset,
                    child: Container(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        "Was möchten sie inserieren ?",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  ShowUp(
                      delay: animationOffset,
                      child: OfferTypeCard()
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                  ),
                  ShowUp(
                    delay: animationOffset + 100,
                    child: Container(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        "Orte",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  ShowUp(
                      delay: animationOffset + 100,
                      child: PlaceOfferCard()
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                  ),
                  ShowUp(
                    delay: animationOffset + 200,
                    child: Container(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        "Zeit",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  ShowUp(
                      delay: animationOffset + 200,
                      child: TimeOfferCard(
                        onUpdate: (value) {
                          setState(() {
                            if (reoccur == true) {
                              reoccur = false;
                            } else {
                              reoccur = true;
                            }
                          });
                        },
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                  ),
                  reoccur == true ? ShowUp(
                    delay: animationOffset + 300,
                    child: Container(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        "Wiederholung",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ) : Container(),
                  reoccur == true ? Padding(
                    padding: EdgeInsets.only(top: 10),
                  ) : Container(),
                  reoccur == true ? ShowUp(
                      delay: animationOffset + 300,
                      child: ReoccurOfferCard()
                  ) : Container(),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                  ),
                  ShowUp(
                    delay: animationOffset + 400,
                    child: Container(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        "Details",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  ShowUp(
                      delay: animationOffset + 400,
                      child: DetailOfferCard()
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                  ),
                  ShowUp(
                    delay: animationOffset + 500,
                    child: Container(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        "Beschreibung",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                  ShowUp(
                      delay: animationOffset + 500,
                      child: DescriptionOfferCard()
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                  ),
                  ShowUp(
                    delay: animationOffset + 600,
                    child: Container(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        "Kontakt",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  ShowUp(
                      delay: animationOffset + 600,
                      child: UserOfferCard()
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: Hero(
        tag: "hero_offer",
        child: IconLongButton(
          onPressed: () {
          },
          text: "Inserieren",
          icon: MaterialCommunityIcons.truck_delivery,
        ),
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
    return getMobile() ? 100 : 200;
  }

  double cardTextWidthSelector() {
    return getMobile() ? 60 : 140;
  }
}
