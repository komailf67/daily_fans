import 'package:daily_fans/theme/theme_constants.dart';
import 'package:flutter/material.dart';

class Themes {
  static ThemeData lightTheme(BuildContext context) =>
      ThemeData.light().copyWith(
        // scaffoldBackgroundColor: Colors.white,
        colorScheme: const ColorScheme.light(
          primary: Color(0XFFE6007E),
          secondary: Color(0XFF0B7B99),
          error: Color(0XFFDC2626),
        ),
        textTheme: const TextTheme(
          overline: TextStyle(
            fontSize: 12,
          ),
          caption: TextStyle(
            fontSize: 14,
          ),
          button: TextStyle(
            fontSize: 16,
          ),
          bodyText2: TextStyle(
            fontSize: 18,
          ),
          bodyText1: TextStyle(
            fontSize: 20,
          ),
          subtitle2: TextStyle(
            fontSize: 24,
          ),
          subtitle1: TextStyle(
            fontSize: 20,
          ),
          headline6: TextStyle(
            fontSize: 36,
          ),
          headline5: TextStyle(
            fontSize: 48,
          ),
          headline4: TextStyle(
            fontSize: 60,
          ),
          headline3: TextStyle(
            fontSize: 72,
          ),
          headline2: TextStyle(
            fontSize: 96,
          ),
          headline1: TextStyle(
            fontSize: 128,
          ),
        ).apply(bodyColor: Colors.grey[800]),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 10,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            // backgroundColor: MaterialStateProperty.all(
            //   primaryColor,
            // ),
            textStyle: MaterialStateProperty.all(
              Theme.of(context).textTheme.button,
            ),
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
            ),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(
            fontSize: 16,
          ),
          prefixStyle: TextStyle(),
          hintStyle: TextStyle(
            color: grey,
            fontSize: 16,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 13.0,
          ),
          alignLabelWithHint: true,
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0XFFD1D5DB),
              width: 1.0,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0XFFD1D5DB),
              width: 1.0,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0XFFD1D5DB),
              width: 1.0,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          unselectedIconTheme: IconThemeData(
            color: primaryColor,
            size: 20,
          ),
          unselectedItemColor: primaryColor,
        ),
      );

  static ThemeData get darkTheme => ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      );
}
