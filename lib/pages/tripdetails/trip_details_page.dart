import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:frank_martin/components/descriptioncard/description_card.dart';
import 'package:frank_martin/components/detailcard/detail_card.dart';
import 'package:frank_martin/components/dragablescrollbar/dragable_scrollbar.dart';
import 'package:frank_martin/components/placecard/place_card.dart';
import 'package:frank_martin/components/reoccurcard/reoccur_card.dart';
import 'package:frank_martin/components/showup/show_up.dart';
import 'package:frank_martin/components/usercard/user_card.dart';
import 'package:frank_martin/ui/query_limiter/query_limiter.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class TripDetailsPage extends StatefulWidget {

  final String mode;
  final String desc;
  final String price;

  TripDetailsPage({Key key, this.mode, this.desc, this.price}) : super(key: key);

  @override
  _TripDetailsPageState createState() => _TripDetailsPageState(this.mode, this.desc, this.price);
}

class _TripDetailsPageState extends State<TripDetailsPage> {

  final String mode;
  final String desc;
  final String price;

  final ScrollController controller = ScrollController();

  _TripDetailsPageState(this.mode, this.desc, this.price);

  List<TimelineModel> items = [
    TimelineModel(
      Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: PlaceCard(
          time: "12:45",
          name: "Kruppstraße, Frankfurt am Main",
        ),
      ),
      position: TimelineItemPosition.right,
      iconBackground: Colors.white,
    ),
    TimelineModel(
      Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: PlaceCard(
          time: "16:20",
          name: "Lambertstraße, Mainz",
        ),
      ),
      position: TimelineItemPosition.right,
      iconBackground: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: mode == "offer" ? Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(
                MaterialCommunityIcons.truck_fast,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
              ),
              Text(
                "Transport",
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ) : Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(
                MaterialCommunityIcons.account_search,
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
              ),
              Text(
                "Gesuch",
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {

            },
            icon: Icon(
              Ionicons.ios_arrow_dropleft_circle,
            ),
          ),
          IconButton(
            onPressed: () {

            },
            icon: Icon(
              Ionicons.ios_arrow_dropright_circle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5),
          ),
          IconButton(
            onPressed: () {

            },
            icon: Icon(
              Icons.share,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            height: getResponsiveHeader(),
            child: SizedBox(
              height: getResponsiveHeader(),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(70.0)
                    ),
                    color: Colors.blue,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: getResponsiveHeader() * 0.7,
                        child: Timeline(
                          children: items,
                          position: TimelinePosition.Left,
                          lineColor: Colors.white,
                          lineWidth: 2,
                        ),
                      ),
                    ],
                  )
              ),
            ),
          ),
          Flexible(
            child: DraggableScrollbar(
              controller: controller,
              child: ListView(
                controller: controller,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ShowUp(
                          delay: 100,
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
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                        ),
                        ShowUp(
                            delay: 100,
                            child: DescriptionCard(text: this.desc)
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                        ),
                        ShowUp(
                          delay: 300,
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
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                        ),
                        ShowUp(
                            delay: 300,
                            child: ReoccurCard()
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                        ),
                        ShowUp(
                          delay: 500,
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
                            delay: 500,
                            child: DetailCard(
                              price: price,
                            )
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            mode == "offer" ? "Anbieter" : "Suchender",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                        ),
                        UserCard()
                      ],
                    )
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }

  bool getSmallMobile() {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide < 500;
  }

  bool getMobile() {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide < 600;
  }

  double getResponsiveHeader() {
    if (getSmallMobile()) {
      return QueryLimiter.of(context).getLimitedHeight(250, 350, 0.55);
    } else {
      return QueryLimiter.of(context).getLimitedHeight(250, 350, 0.45);
    }
  }
}
