import 'package:serverpod/serverpod.dart';
import 'package:serverpod_riverpod_template_server/src/generated/models/note.dart';

import '../generated/models/enums/error_type_enum.dart';
import '../generated/models/exceptions/entity_not_found_exception.dart';

class NoteEndpoint extends Endpoint {
  /// Creates a new note with the provided text.
  /// Returns the created note.
  Future<Note> createNote(Session session, String text) async {
    final note = Note(
      text: text,
    );

    return await Note.db.insertRow(session, note);
  }

  /// Returns a list of all notes.
  Future<List<Note>> getNotes(Session session) async {
    return await Note.db.find(session);
  }

  /// Deletes a note by id.
  /// Returns the number of notes deleted (0 or 1).
  Future<int> deleteNoteById(Session session, int id) async {
    final note = await Note.db.findById(session, id);
    if (note == null) {
      throw EntityNotFoundException(
        message: 'Note with id $id not found.',
        errorType: ErrorType.client,
      );
    }
    return await Note.db.deleteRow(session, note);
  }
}
