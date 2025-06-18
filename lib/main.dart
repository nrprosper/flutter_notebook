import 'package:flutter/material.dart';
import 'package:flutter_notebook/lib/colors.dart';
import 'package:flutter_notebook/screens/on_boarding.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(ProviderScope(child: Application()));
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
        ),
        dialogTheme: DialogThemeData(
          backgroundColor: NColors.bgColor,
          surfaceTintColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        FlutterQuillLocalizations.delegate
      ],
      home: OnBoarding(),
    );
  }

}
