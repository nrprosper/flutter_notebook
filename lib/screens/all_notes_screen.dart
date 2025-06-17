import 'package:flutter/material.dart';
import 'package:flutter_notebook/common/scaffold_content.dart';
import 'package:flutter_notebook/lib/colors.dart';
import 'package:flutter_notebook/lib/note_notifier.dart';
import 'package:flutter_notebook/screens/create_note_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllNotesScreen extends ConsumerWidget {
  const AllNotesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesAsync = ref.watch(noteNotifierProvider);

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
      body: notesAsync.when(
        data: (notes) {
          if (notes.isEmpty) {
            return Center(
              child: ScaffoldContent(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateNoteScreen()),
                ),
                imagePath: "assets/tasks_placeholder.png",
                title: "Create Your First Note",
                description: "Add a note about anything (your thoughts on climate change, or your history essay) and share it with the world.",
                buttonText: "Create A Note",
              ),
            );
          }
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return ListTile(
                title: Text('Note ${note.id}'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateNoteScreen(noteId: note.id)),
                ),
              );
            },
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
