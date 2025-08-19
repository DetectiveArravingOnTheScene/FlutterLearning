import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:notes/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier {
  static late Isar isar;

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }

  final List<Note> currentNotes = [];

  Future<void> addNote(String text) async {
    final newNote = Note();
    newNote.text = text;

    await isar.writeTxn(() => isar.notes.put(newNote));

    await fetchNotes();
  }

  Future<void> fetchNotes() async {
    List<Note> fetched = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetched);

    for (Note n in currentNotes) {
      print(n.text);
    }
    notifyListeners();
  }

  Future<void> updateNote(int id, String newText) async {
    final existingNote = await isar.notes.get(id);
    if (existingNote != null) {
      existingNote.text = newText;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
  }

  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}
