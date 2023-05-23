import 'package:flutter/material.dart';

class LogoWidgetUsingHero extends StatelessWidget {
  const LogoWidgetUsingHero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("REBUILD THIS LOGO WIDGET");
    return const Hero(
      tag: 'LogoWidget',
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: FlutterLogo(),
      ),
    );
  }
}
