import 'package:flutter/material.dart';
import 'package:flutter_notebook/lib/colors.dart';
import 'package:flutter_notebook/screens/on_boarding.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Application());
}


class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Notebook Application',
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(
            ThemeData.light().textTheme,
        ).apply(
          bodyColor: NColors.textColor,
          displayColor: NColors.textColor,
        ),
        scaffoldBackgroundColor: NColors.bgColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(NColors.primary),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              )
            ),
            textStyle: WidgetStateProperty.all<TextStyle>(
              TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                fontFamily: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold
                ).fontFamily
              )
            )
          ),
        )
      ),
      debugShowCheckedModeBanner: false,
      home: OnBoarding(),
    );
  }

}
