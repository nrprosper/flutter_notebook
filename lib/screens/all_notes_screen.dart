import 'package:flutter/material.dart';
import 'package:flutter_notebook/lib/colors.dart';

class AllNotesScreen extends StatefulWidget {
  const AllNotesScreen({super.key});

  @override
  State<AllNotesScreen> createState() => _AllNotesScreenState();
}

class _AllNotesScreenState extends State<AllNotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "All Notes",
          style: TextStyle(
            color: NColors.boldText,
            fontWeight: FontWeight.w900
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => {}, 
              icon: Icon(Icons.search)
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 221,
              width: 268,
              child: Image(image: AssetImage('assets/tasks_placeholder.png')),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 34, horizontal: 34),
              child: Column(
                spacing: 12,
                children: [
                  Text(
                    "Create Your First Note",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: NColors.boldText,
                        fontSize: 24
                    ),
                  ),
                  Text(
                    "Add a note about anything (your thoughts on climate change, or your history essay) and share it witht the world.",
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
                          "Create A Note",
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
