import 'package:flutter/cupertino.dart';

typedef ResponsiveBuilder = Widget Function(BuildContext context, Size size);

class ResponsiveSafeArea extends StatelessWidget {
  final ResponsiveBuilder builder;

  const ResponsiveSafeArea({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: LayoutBuilder(
      builder: (context, constraints) {
        return builder(context, constraints.biggest);
      },
    ));
  }
}
