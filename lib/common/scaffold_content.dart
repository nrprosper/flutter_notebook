import 'package:flutter/material.dart';

import 'package:flutter_notebook/lib/colors.dart';

class ScaffoldContent extends StatelessWidget {
  final VoidCallback onPressed;
  final String imagePath;
  final String title;
  final String description;
  final String buttonText;

  const ScaffoldContent({
    super.key,
    required this.onPressed,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.buttonText
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 221,
          width: 268,
          child: Image(image: AssetImage(imagePath)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 34, horizontal: 34),
          child: Column(
            spacing: 12,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: NColors.boldText,
                    fontSize: 24
                ),
              ),
              Text(
                description,
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
                    onPressed: onPressed,
                    child: Text(
                      buttonText,
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
    );
  }
}
