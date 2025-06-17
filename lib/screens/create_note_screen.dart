import 'dart:convert';

import 'package:drift/drift.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter_notebook/data/database.dart';

import 'package:flutter_notebook/lib/colors.dart';
import 'package:flutter_notebook/lib/note_notifier.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/quill_delta.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateNoteScreen extends ConsumerStatefulWidget {
  final int? noteId;

  const CreateNoteScreen({this.noteId, super.key});

  @override
  ConsumerState<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends ConsumerState<CreateNoteScreen> {
  final QuillController _controller = QuillController.basic();
  Note? currentNote;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadNote();
  }

  Future<void> _loadNote() async {
    if (widget.noteId != null) {
      final note = await ref.read(noteDaoProvider).getNoteById(widget.noteId!);
      if (note != null) {
        final delta = Delta.fromJson(jsonDecode(note.content));
        _controller.document = Document.fromDelta(delta);
        setState(() {
          currentNote = note;
          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
      }
    } else {
      setState(() => isLoading = false);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Create a Note",
          style: TextStyle(
            color: NColors.boldText,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final content = jsonEncode(
                _controller.document.toDelta().toJson(),
              );
              final notifier = ref.read(noteNotifierProvider.notifier);
              if (widget.noteId == null) {
                await notifier.addNote(content);
              } else {
                final updatedNote = currentNote!.copyWith(
                  content: content,
                  updatedAt: d.Value(DateTime.now()),
                );
                await notifier.updateNote(updatedNote);
              }
              Navigator.pop(context);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: QuillSimpleToolbar(
                  controller: _controller,
                  config: const QuillSimpleToolbarConfig(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: QuillEditor.basic(
                  controller: _controller,
                  config: const QuillEditorConfig(
                    placeholder: 'Start writing your notes...',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
