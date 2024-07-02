import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serverpod_riverpod_template_client/serverpod_riverpod_template_client.dart';
import 'package:serverpod_riverpod_template_flutter/src/features/notes/presentation/widgets/add_note_dialog.dart';
import 'package:serverpod_riverpod_template_flutter/src/features/notes/presentation/widgets/note_listing.dart';
import 'package:serverpod_riverpod_template_flutter/src/features/notes/providers/notes_data_provider.dart';
import 'package:serverpod_riverpod_template_flutter/src/shared/providers/serverpod_client_provider.dart';
import 'package:serverpod_riverpod_template_flutter/src/shared/widgets/app_layout/app_scaffold.dart';
import 'package:serverpod_riverpod_template_flutter/src/shared/widgets/async_value/async_value_widget.dart';

/// The screen that displays the notes.
class NotesScreen extends ConsumerWidget {
  /// Creates the notes screen.
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesAsyncValue = ref.watch(notesProvider);

    void addNote() {
      showDialog<void>(
        context: context,
        builder: (context) => const AddNoteDialog(),
      );
    }

    Future<void> deleteNote(int? id) async {
      if (id == null) {
        return;
      }
      await ref.read(clientProvider).note.deleteNoteById(id);
      ref.invalidate(notesProvider);
    }

    return AsyncValueWidget(
      future: notesProvider.future,
      value: notesAsyncValue,
      data: (List<Note> notes) => AppScaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: addNote,
          child: const Icon(Icons.add),
        ),
        child: NoteListing(
          notes: notes,
          deleteNote: deleteNote,
        ),
      ),
    );
  }
}
