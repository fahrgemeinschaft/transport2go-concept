import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frank_martin/ui/query_limiter/query_limiter.dart';

class ModalView {

  final BuildContext context;

  ModalView(this.context);

  // Instance Builder with of(context)
  static ModalView of(BuildContext context) {
    return ModalView(context);
  }

  dynamic open({Widget page, Widget mobilePage}) async {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 600;

    if (useMobileLayout) {
      return await Navigator.of(context).push(MaterialPageRoute(builder: (context) => mobilePage));
    } else {
      return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return Scaffold(
              backgroundColor: Colors.black.withOpacity(0.5),
              body: Container(
                child: Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: page,
                  ),
                ),
              ),
            );
          }
      );
    }
  }
}
