import 'package:flutter/widgets.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class NavigationService {
  static navigateTo(String route, {dynamic arguments, Function? afterPop}) {
    if (arguments != null) {
      if (afterPop != null) {
        navigatorKey.currentState?.pushNamed(route, arguments: arguments).then((value) => afterPop());
      } else {
        navigatorKey.currentState?.pushNamed(route, arguments: arguments);
      }
    } else {
      navigatorKey.currentState?.pushNamed(route);
    }
  }

  static back() => navigatorKey.currentState?.pop();
}
