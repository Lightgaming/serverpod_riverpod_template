import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serverpod_riverpod_template_flutter/src/common_providers/serverpod_client_provider.dart';
import 'package:serverpod_riverpod_template_flutter/src/features/notes/data/notes_data_provider.dart';

class AddNoteDialog extends ConsumerWidget {
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
