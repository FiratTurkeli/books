import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget destkop;

  const Responsive({
    Key? key,
    required this.destkop,
    required this.mobile,
    required this.tablet
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
    MediaQuery.of(context).size.width<650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 650;

  static bool isDestkop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if (constraints.maxWidth >= 1100) {
        return destkop;
      } else if (constraints.maxWidth >= 650) {
        return tablet;
      } else {
        return mobile;
      }
    });
  }
}
