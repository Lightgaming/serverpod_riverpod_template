import 'package:flutter/material.dart';
import 'package:serverpod_riverpod_template_client/serverpod_riverpod_template_client.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
    required this.notes,
    required this.deleteNote,
  });

  final List<Note> notes;
  final void Function(int?) deleteNote;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];
        return ListTile(
          title: Text(note.text),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => deleteNote(note.id),
          ),
        );
      },
    );
  }
}
