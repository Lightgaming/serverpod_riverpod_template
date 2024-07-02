// A FutureProvider for accessing a dependency
// that is initialized *asynchronously*
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_riverpod_template_client/serverpod_riverpod_template_client.dart';
import 'package:serverpod_riverpod_template_flutter/src/shared/providers/serverpod_client_provider.dart';

part 'notes_data_provider.g.dart';

@riverpod

/// A provider that asynchronously fetches a list of notes.
Future<List<Note>> notes(NotesRef ref) async {
  final client = ref.read(clientProvider);
  return client.note.getNotes();
}
