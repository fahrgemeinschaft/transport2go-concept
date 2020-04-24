import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:frank_martin/components/dateselector/date_selector.dart';
import 'package:frank_martin/components/dragablescrollbar/dragable_scrollbar.dart';
import 'package:frank_martin/components/iconlongbutton/icon_long_button.dart';
import 'package:frank_martin/components/marquee/marquee_widget.dart';
import 'package:frank_martin/components/offerlist/offer_list.dart';
import 'package:frank_martin/components/searchbar/search_bar.dart';
import 'package:frank_martin/pages/login/login_bloc.dart';
import 'package:frank_martin/pages/offer/offer_select_page.dart';
import 'package:frank_martin/pages/start/start_page_slider.dart';
import 'package:frank_martin/ui/query_limiter/query_limiter.dart';
import 'package:morpheus/page_routes/morpheus_page_route.dart';
import 'package:r2gapi_flutter_sdk/model/page_request.dart';
import 'package:r2gapi_flutter_sdk/model/search.dart';
import 'package:tetris_blocs/core/tetris_event.dart';
import 'package:tetris_blocs/core/tetris_provider.dart';

class StartPage extends StatefulWidget {
  StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with SingleTickerProviderStateMixin{
  GlobalKey<SearchBarState> _startKey = new GlobalKey<SearchBarState>();
  GlobalKey<SearchBarState> _endKey = new GlobalKey<SearchBarState>();
  GlobalKey<InnerDrawerState> _drawerKey = new GlobalKey<InnerDrawerState>();
  GlobalKey<DateSelectorState> _dateSelectorKey = new GlobalKey<DateSelectorState>();

  final _OfferButtonKey = GlobalKey();

  TabController _tabController;
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    LoginBloc loginBloc = TetrisProvider.of<LoginBloc>(context);

    return InnerDrawer(
      key: _drawerKey,
      onTapClose: true,
      swipe: true,
      offset: IDOffset.only(
          right: getDrawerOffset(), left: getDrawerOffset()
      ),
      scale: IDOffset.horizontal( 0.9 ),
      backgroundColor: Colors.white,
      colorTransition: Colors.white,
      proportionalChildArea : true,
      borderRadius: 50,
      leftAnimationType: InnerDrawerAnimation.static,
      rightAnimationType: InnerDrawerAnimation.quadratic,
      leftChild: StartPageSlider(),
      scaffold: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: DraggableScrollbar(
            controller: controller,
            child: ListView(
              controller: controller,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: getResponsiveHeader(),
                      child: Stack(
                        children: <Widget>[
                          AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                image: DecorationImage(
                                    image: NetworkImage('https://images.unsplash.com/photo-1449247666642-264389f5f5b1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2849&q=80'),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                                child: SizedBox(
                                  width: 600,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 600,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Container(
                                                  height: 40,
                                                  width: 50,
                                                  padding: EdgeInsets.only(left: 8, right: 3),
                                                  child: Image.asset('assets/images/transport2go_icon_full_light.png'),
                                                ),
                                                Text(
                                                  "Transport2Go",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                IconButton(
                                                  onPressed: () {
                                                    _drawerKey.currentState.open();
                                                  },
                                                  icon: Icon(
                                                    Icons.menu,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                FlatButton(
                                                  onPressed: () {
                                                    loginBloc.dispatch(TetrisEvent.withAction(action: LoginBloc.PERFORM_LOGIN));
                                                  },
                                                  child: Text(
                                                    "Anmelden",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w600
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 15),
                                      ),
                                      SearchBar(
                                        key: _startKey,
                                        emptyTitle: "Transport von",
                                      ),
                                      SearchBar(
                                        key: _endKey,
                                        emptyTitle: "Transport nach",
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 15),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          IconLongButton(
                                            onPressed: () async {

                                            },
                                            text: "suchen",
                                            icon: Icons.search,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 15),
                                          ),
                                          Hero(
                                            tag: "hero_offer",
                                            child: IconLongButton(
                                              key: _OfferButtonKey,
                                              onPressed: () {
                                                Navigator.of(context).push(MorpheusPageRoute(
                                                  builder: (context) => OfferSelectPage(),
                                                  parentKey: _OfferButtonKey,
                                                  borderRadius: BorderRadius.circular(24.0)
                                                ));
                                              },
                                              text: "inserieren",
                                              icon: MaterialCommunityIcons.truck_delivery,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                              ),
                              Container(
                                height: QueryLimiter.of(context).getLimitedHeight(25, 50, 0.1),
                                child: DateSelector(
                                  key: _dateSelectorKey,
                                  onUpdate: (DateTime date) {
                                    print("DateChanged to" + date.toIso8601String());
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: QueryLimiter.of(context).getLimitedHeight(25, 50, 0.1),
                      padding: EdgeInsets.symmetric(horizontal: getMobile() == true ? 0 : 40),
                      child: TabBar(
                        controller: _tabController,
                        tabs: <Widget>[
                          Tab(
                            child: MarqueeWidget(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    MaterialCommunityIcons.truck_fast,
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                  ),
                                  Text(
                                    "Transportangebote",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Tab(
                            child: MarqueeWidget(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    MaterialCommunityIcons.account_search,
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                  ),
                                  Text(
                                    "Transportgesuche",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Container(
                      width: QueryLimiter.of(context).getLimitedWidth(600, 800, 0.6),
                        height: 800,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: TabBarView(
                        controller: _tabController,
                        children: <Widget>[
                          OfferList(mode: "offer"),
                          OfferList(mode: "search"),
                        ],
                      )
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
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
      return QueryLimiter.of(context).getLimitedHeight(370, 450, 0.55);
    } else {
      return QueryLimiter.of(context).getLimitedHeight(350, 450, 0.48);
    }
  }

  double getDrawerOffset() {
    if (getMobile()) {
      return 0.7;
    } else {
      return 0.3;
    }
  }

  PageRequest getPage() {
    Map<String, dynamic> map = {
      "pageSize": 50,
      "page": 0,
      "firstIndex": 0
    };

    return map as PageRequest ;
  }

  Search createSearch() {
    Map<String, dynamic> map = {
      "page": jsonDecode(getPage().toString()),
      "tripTypes": ["OFFER"],
      //"startPoint": _startKey.currentState.getRadius().toJson(),
      //"endPoint": _endKey.currentState.getRadius().toJson(),
      "departure": _dateSelectorKey.currentState.getTime()
    };

    return map as Search;
  }
}
