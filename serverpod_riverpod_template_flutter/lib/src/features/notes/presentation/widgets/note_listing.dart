import 'package:flutter/material.dart';
import 'package:serverpod_riverpod_template_client/serverpod_riverpod_template_client.dart';

/// Lists the notes.
class NoteListing extends StatelessWidget {
  /// Creates the note listing.
  const NoteListing({
    required this.notes,
    required this.deleteNote,
    super.key,
  });

  /// The List of notes to display.
  final List<Note> notes;

  /// Callback function when user wants to delete a note.
  /// Provides the note id to delete.
  final void Function(int?) deleteNote;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes[index];

        return ListTile(
          onTap: () {},
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
