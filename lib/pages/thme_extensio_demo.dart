import 'dart:ui';

import 'package:first_mobex_flutter_project/pages/user_list.dart';
import 'package:flutter/material.dart';

@immutable
class MyTextThemeClass extends ThemeExtension<MyTextThemeClass> {
  final Color? color;
  final Color? backgroundColorForLoginButton;
  final double? fontSizeOfLoginText;
  final FontWeight? fontWeightForLoginButton;

  MyTextThemeClass(
      {this.color,
      this.backgroundColorForLoginButton,
      this.fontSizeOfLoginText,
      this.fontWeightForLoginButton});

  @override
  MyTextThemeClass copyWith(
      {Color? color,
      Color? backgroundColor,
      double? fontSize,
      FontWeight? fontWeight}) {
    return MyTextThemeClass(
      color: color ?? this.color,
      backgroundColorForLoginButton:
          backgroundColor ?? this.backgroundColorForLoginButton,
      fontSizeOfLoginText: fontSize ?? this.fontSizeOfLoginText,
      fontWeightForLoginButton: fontWeight ?? this.fontWeightForLoginButton,
    );
  }

  @override
  MyTextThemeClass lerp(MyTextThemeClass? other, double t) {
    if (other is! MyTextThemeClass) {
      return this;
    }
    return MyTextThemeClass(
        color: Color.lerp(color, other.color, t),
        backgroundColorForLoginButton: Color.lerp(backgroundColorForLoginButton,
            other.backgroundColorForLoginButton, t),
        fontSizeOfLoginText:
            lerpDouble(fontSizeOfLoginText, other.fontSizeOfLoginText, t),
        fontWeightForLoginButton: FontWeight.lerp(
            fontWeightForLoginButton, other.fontWeightForLoginButton, t));
  }

  // Optional
  @override
  String toString() =>
      'MyTextThemeClass(color: $color ,backgroundColor: $backgroundColorForLoginButton ,fontSize:  $fontSizeOfLoginText,fontWeight:  $fontWeightForLoginButton ,)';
}

/*
@immutable
class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.brandColor,
    required this.danger,
  });

  final Color? brandColor;
  final Color? danger;

  @override
  MyColors copyWith({Color? brandColor, Color? danger}) {
    return MyColors(
      brandColor: brandColor ?? this.brandColor,
      danger: danger ?? this.danger,
    );
  }

  @override
  MyColors lerp(MyColors? other, double t) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      brandColor: Color.lerp(brandColor, other.brandColor, t),
      danger: Color.lerp(danger, other.danger, t),
    );
  }

  // Optional
  @override
  String toString() => 'MyColors(brandColor: $brandColor, danger: $danger)';
}
*/
class ThemeExtensionExampleApp extends StatefulWidget {
  const ThemeExtensionExampleApp({super.key});

  @override
  State<ThemeExtensionExampleApp> createState() =>
      _ThemeExtensionExampleAppState();
}

class _ThemeExtensionExampleAppState extends State<ThemeExtensionExampleApp> {
  bool isLightTheme = true;

  void toggleTheme() {
    setState(() => isLightTheme = !isLightTheme);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        extensions: <ThemeExtension<dynamic>>[
          MyTextThemeClass(
              color: Colors.red,
              backgroundColorForLoginButton: Colors.purple,
              fontSizeOfLoginText: 22,
              fontWeightForLoginButton: FontWeight.bold),
        ],
      ),
      darkTheme: ThemeData.dark().copyWith(
        extensions: <ThemeExtension<dynamic>>[
          MyTextThemeClass(
              backgroundColorForLoginButton: Colors.amber,
              color: Colors.pink,
              fontSizeOfLoginText: 22,
              fontWeightForLoginButton: FontWeight.w100),
        ],
      ),
      themeMode: isLightTheme ? ThemeMode.light : ThemeMode.dark,
      home: Home2(
        isLightTheme: isLightTheme,
        toggleTheme: toggleTheme,
      ),
    );
  }
}

class Home2 extends StatefulWidget {
  const Home2({
    super.key,
    required this.isLightTheme,
    required this.toggleTheme,
  });

  final bool isLightTheme;
  final void Function() toggleTheme;

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  @override
  void initState() {
    // TODO: implement initState
    print("STATE --> ${widget.isLightTheme}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MyTextThemeClass myTheme =
        Theme.of(context).extension<MyTextThemeClass>()!;
    return Material(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 44),
            Container(
                width: 100,
                height: 100,
                color: myTheme.backgroundColorForLoginButton),
            const SizedBox(width: 10),
            Container(width: 100, height: 100, color: myTheme.color),
            const SizedBox(width: 50),
            Text(
              "KIRAN",
              style: TextStyle(
                  fontWeight: myTheme.fontWeightForLoginButton,
                  fontSize: myTheme.fontSizeOfLoginText),
            ),
            const SizedBox(width: 50),
            const SizedBox(width: 50),
            Text(
              "${DateTime.now().getTodaysDay()}",
              style: TextStyle(
                  fontWeight: myTheme.fontWeightForLoginButton,
                  fontSize: myTheme.fontSizeOfLoginText),
            ),
            const SizedBox(width: 50),
            IconButton(
              icon:
                  Icon(widget.isLightTheme ? Icons.nightlight : Icons.wb_sunny),
              onPressed: widget.toggleTheme,
            ),
          ],
        ),
      ),
    );
  }
}
