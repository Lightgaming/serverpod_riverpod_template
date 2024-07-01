import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serverpod_riverpod_template_client/serverpod_riverpod_template_client.dart';
import 'package:serverpod_riverpod_template_flutter/src/common_providers/serverpod_client_provider.dart';
import 'package:serverpod_riverpod_template_flutter/src/common_widgets/app_layout/app_scaffold.dart';
import 'package:serverpod_riverpod_template_flutter/src/common_widgets/async_value/async_value_widget.dart';
import 'package:serverpod_riverpod_template_flutter/src/features/notes/data/notes_data_provider.dart';
import 'package:serverpod_riverpod_template_flutter/src/features/notes/presentation/add_note_dialog.dart';
import 'package:serverpod_riverpod_template_flutter/src/features/notes/presentation/notes_list_view.dart';

class NotesListingView extends ConsumerWidget {
  const NotesListingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesAsyncValue = ref.watch(notesProvider);

    void addNote() {
      showDialog(
        context: context,
        builder: (context) => const AddNoteDialog(),
      );
    }

    void deleteNote(int? id) async {
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
        child: NotesListView(
          notes: notes,
          deleteNote: deleteNote,
        ),
      ),
    );
  }
}
