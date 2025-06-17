import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_notebook/common/scaffold_content.dart';
import 'package:flutter_notebook/lib/colors.dart';
import 'package:flutter_notebook/lib/note_notifier.dart';
import 'package:flutter_notebook/screens/create_note_screen.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/quill_delta.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [IconButton(onPressed: () => {}, icon: Icon(Icons.search))],
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
                description:
                "Add a note about anything (your thoughts on climate change, or your history essay) and share it with the world.",
                buttonText: "Create A Note",
              ),
            );
          }
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 70),
                child: MasonryGridView.count(
                  padding: const EdgeInsets.all(12),
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    final note = notes[index];
                    final delta = Delta.fromJson(jsonDecode(note.content));
                    final document = Document.fromDelta(delta);
                    final plainText = document.toPlainText();
                    return Card(
                      elevation: 2,
                      color: NColors.bgColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CreateNoteScreen(noteId: note.id),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Note ${note.id}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text(
                                plainText,
                                maxLines: 9,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 8),
                              Text(
                                note.createdAt.toLocal().toString().split('.')[0],
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 40,
                left: 16,
                right: 16,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateNoteScreen()),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text(
                    'Add A Note',
                    style: TextStyle(color: NColors.boldText),
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
      ),
    );
  }
}