import 'package:flutter/cupertino.dart';

class QueryLimiter {

  final BuildContext context;

  QueryLimiter(this.context);

  // Instance Builder with of(context)
  static QueryLimiter of(BuildContext context) {
    return QueryLimiter(context);
  }

  /*
   * getLimitedHeight
   *
   * @param double minFactor  // min height of the frame
   * @param double maxFactor  // max height of the frame
   * @param double current    // current factor of the MediaQuery
   *
   */
  double getLimitedHeight(double minFactor, double maxFactor, double current) {
    double mediaqueryHeight = MediaQuery.of(context).size.height * current;

    if (mediaqueryHeight < minFactor) {
      return minFactor;
    }

    if (mediaqueryHeight > maxFactor) {
      return maxFactor;
    }

    return mediaqueryHeight;
  }

  /*
   * getLimitedWidth
   *
   * @param double minFactor  // min width of the frame
   * @param double maxFactor  // max width of the frame
   * @param double current    // current factor of the MediaQuery
   *
   */
  double getLimitedWidth(double minFactor, double maxFactor, double current) {
    double mediaqueryWidth = MediaQuery.of(context).size.width * current;

    if (mediaqueryWidth < minFactor) {
      return minFactor;
    }

    if (mediaqueryWidth > maxFactor) {
      return maxFactor;
    }

    return mediaqueryWidth;
  }
}
