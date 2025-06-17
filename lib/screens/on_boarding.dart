import 'package:flutter/material.dart';
import 'package:flutter_notebook/common/scaffold_content.dart';
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
        child: ScaffoldContent(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AllNotesScreen())
              );
            },
            imagePath: "assets/onboarding.png",
            title: "World’s Safest And Largest Digital Notebook",
            description: "Notely is the world’s safest, largest and intelligent digital notebook. Join over 10M+ users already using Notely.",
            buttonText: "GET STARTED"
        ),
      ),
    );
  }
}
