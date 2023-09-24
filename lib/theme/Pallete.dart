import 'package:flutter/material.dart';

class Pallete {
  static const mainColor = Color.fromRGBO(208, 136, 102, 1); // primary color
  static const greyColor = Color.fromRGBO(0, 0, 0, 1); // secondary color
  static const drawerColor = Color.fromRGBO(18, 18, 18, 1);
  static const whiteColor = Colors.white;
  static var redColor = Colors.red.shade500;
  static var blueColor = Colors.blue.shade300;
  static var searchColorA = const Color.fromARGB(96, 71, 70, 70);
  static var textcolor = const Color.fromARGB(116, 78, 77, 77);
  static var moderatorcolor = const Color.fromRGBO(255, 0, 255, 100);

  // Themes
  static var darkModeAppTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: mainColor,
    cardColor: mainColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: drawerColor,
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: drawerColor,
    ),
    primaryColor: redColor,
    backgroundColor:
        drawerColor, // will be used as alternative background color
  );

  static var lightModeAppTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: whiteColor,
    cardColor: greyColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: mainColor,
      ),
    ),
  );
}
