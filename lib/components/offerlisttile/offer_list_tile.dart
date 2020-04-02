import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:frank_martin/pages/tripdetails/trip_details_page.dart';
import 'package:frank_martin/ui/query_limiter/query_limiter.dart';
import 'package:morpheus/page_routes/morpheus_page_route.dart';

class OfferListTile extends StatefulWidget {
  final String time;
  final String from;
  final String to;
  final String shortDescription;
  final String price;
  final String mode;

  const OfferListTile({Key key, this.time, this.from, this.to, this.shortDescription, this.price, this.mode}) : super(key: key);

  @override
  _OfferListTileState createState() => _OfferListTileState(this.time, this.from, this.to, this.shortDescription, this.price, this.mode);
}

class _OfferListTileState extends State<OfferListTile> {

  final String time;
  final String from;
  final String to;
  final String shortDescription;
  final String price;
  final String mode;

  _OfferListTileState(this.time, this.from, this.to, this.shortDescription, this.price, this.mode);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          _handleTap(context, widget.key);
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.time,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      MaterialCommunityIcons.truck,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                    ),
                    Text(
                      widget.price,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 6),
            ),
            handleOfferPlaces(context),
            Padding(
              padding: EdgeInsets.only(top: 6),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: QueryLimiter.of(context).getLimitedWidth(200, 500, 0.23),
                  child: Text(
                    widget.shortDescription,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Card(
                  elevation: 0,
                  color: Colors.black12,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      MaterialCommunityIcons.calendar,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget handleOfferPlaces(BuildContext context) {
    if (getMobile()) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          handleOfferPlacesMobile(context),
        ],
      );
    }

    if (widget.from != null && widget.to != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            width: QueryLimiter.of(context).getLimitedWidth(250, 350, 0.19),
            child: Text(
              "von: " + widget.from,
              style: TextStyle(
                fontSize: 15,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: QueryLimiter.of(context).getLimitedWidth(250, 350, 0.23),
            child: Text(
              "nach: " + widget.to,
              style: TextStyle(
                fontSize: 15,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    } else if (widget.to != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            width: QueryLimiter.of(context).getLimitedWidth(250, 350, 0.23),
            child: Text(
              "nach: " + widget.to,
              style: TextStyle(
                fontSize: 15,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    } else if (widget.from != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            width: QueryLimiter.of(context).getLimitedWidth(250, 350, 0.23),
            child: Text(
              "von: " + widget.from,
              style: TextStyle(
                fontSize: 15,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget handleOfferPlacesMobile(BuildContext context) {
    if (widget.from != null && widget.to != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: QueryLimiter.of(context).getLimitedWidth(250, 350, 0.19),
            child: Text(
              "von: " + widget.from,
              style: TextStyle(
                fontSize: 15,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: QueryLimiter.of(context).getLimitedWidth(250, 350, 0.19),
            child: Text(
              "nach: " + widget.to,
              style: TextStyle(
                fontSize: 15,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    } else if (widget.to != null) {
      return SizedBox(
        width: QueryLimiter.of(context).getLimitedWidth(250, 350, 0.23),
        child: Text(
          "nach: " + widget.to,
          style: TextStyle(
            fontSize: 15,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      );
    } else if (widget.from != null) {
      return SizedBox(
        width: QueryLimiter.of(context).getLimitedWidth(250, 350, 0.23),
        child: Text(
          "von: " + widget.from,
          style: TextStyle(
            fontSize: 15,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      );
    } else {
      return Container();
    }
  }

  bool getMobile() {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide < 600;
  }

  void _handleTap(BuildContext context, GlobalKey parentKey) {
    Navigator.of(context).push(MorpheusPageRoute(
      builder: (context) => TripDetailsPage(
        mode: widget.mode,
        price: widget.price,
        desc: widget.shortDescription,
      ),
      parentKey: parentKey,
      borderRadius: BorderRadius.circular(24.0)
    ));
  }
}
