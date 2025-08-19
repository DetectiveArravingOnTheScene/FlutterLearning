import 'package:flutter/material.dart';
import 'package:notes/models/note.dart';
import 'package:notes/models/note_database.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    readNotes();
  }

  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(controller: controller),
        actions: [
          MaterialButton(
            onPressed: () async {
              await context.read<NoteDatabase>().addNote(controller.text);
              controller.clear();
              Navigator.pop(context);
            },
            child: const Text("Create"),
          ),
        ],
      ),
    );
  }

  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  void editNote(Note note) {
    controller.text = note.text;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(controller: controller),
        actions: [
          MaterialButton(
            onPressed: () {
              context.read<NoteDatabase>().updateNote(note.id, controller.text);
              controller.clear();
              Navigator.pop(context);
            },
            child: Text("Update"),
          ),
        ],
      ),
    );
  }

  void deleteNote(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    final NoteDatabase db = context.watch();
    List<Note> notes = db.currentNotes;

    return Scaffold(
      appBar: AppBar(title: Text("Notes")),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return ListTile(
            title: Text(note.text),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => editNote(note),
                  icon: Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () => deleteNote(note.id),
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
