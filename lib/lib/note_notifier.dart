import 'dart:async';

import 'package:flutter_notebook/data/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final databaseProvider = Provider<AppDatabase>((ref) => AppDatabase());
final noteDaoProvider = Provider<NoteDao>((ref) => ref.watch(databaseProvider).noteDao);
final noteNotifierProvider = StateNotifierProvider<NoteNotifier, AsyncValue<List<Note>>>((ref) {
  final noteDao = ref.watch(noteDaoProvider);
  return NoteNotifier(noteDao);
});

class NoteNotifier extends StateNotifier<AsyncValue<List<Note>>> {
  final NoteDao _noteDao;
  StreamSubscription<List<Note>>? _subscription;

  NoteNotifier(this._noteDao) : super(AsyncValue.loading()) {
    _init();
  }

  Future<void> _init() async {
    _subscription = _noteDao.watchAllNotes().listen(
          (notes) => state = AsyncValue.data(notes),
      onError: (e, st) => state = AsyncValue.error(e, st),
    );
  }

  Future<void> addNote(String content) async {
    final companion = NotesCompanion.insert(content: content);
    await _noteDao.insertNote(companion);
  }

  Future<void> updateNote(Note note) async {
    await _noteDao.updateNote(note);
  }

  Future<void> deleteNote(int id) async {
    await _noteDao.deleteNoteById(id);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

}