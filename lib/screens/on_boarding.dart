import 'package:flutter/material.dart';
import 'package:flutter_notebook/lib/colors.dart';
import 'package:flutter_notebook/screens/all_notes_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NOTELY',
          style: GoogleFonts.titanOne(
            textStyle: TextStyle(color: NColors.boldText)
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 197,
              width: 268,
              child: Image(image: AssetImage('assets/onboarding.png')),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 34, horizontal: 34),
              child: Column(
                spacing: 12,
                children: [
                  Text(
                    "World’s Safest And Largest Digital Notebook",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: NColors.boldText,
                        fontSize: 24
                    ),
                  ),
                  Text(
                    "Notely is the world’s safest, largest and intelligent digital notebook. Join over 10M+ users already using Notely.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 64,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => AllNotesScreen())
                          );
                        },
                        child: Text(
                          "GET STARTED",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            letterSpacing: 3
                          ),
                        )
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
