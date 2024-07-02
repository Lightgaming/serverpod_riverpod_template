import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serverpod_riverpod_template_flutter/src/features/notes/providers/notes_data_provider.dart';
import 'package:serverpod_riverpod_template_flutter/src/shared/providers/serverpod_client_provider.dart';

/// A dialog to add a note.
class AddNoteDialog extends ConsumerWidget {
  /// Creates the add note dialog.
  const AddNoteDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();

    return AlertDialog(
      title: const Text('Add note'),
      content: TextField(
        controller: controller,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            final text = controller.text;
            if (text.isEmpty) {
              return;
            }
            await ref
                .read(clientProvider)
                .note
                .createNote(controller.text.trim());
            ref.invalidate(notesProvider);
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
