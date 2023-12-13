import 'package:flutter/material.dart';

import 'wrapped_page_route.dart';

class Route {
  static Map<String, Widget Function(BuildContext)> routes = {
    ...StartPageRoutes.routes
  };
}
