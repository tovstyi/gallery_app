import 'package:flutter/material.dart';
import 'routes/home_page_route.dart';

class Route {
  static Map<String, Widget Function(BuildContext)> routes = {
    ...HomePageRoute.routes
  };
}
