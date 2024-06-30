/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:serverpod_riverpod_template_client/src/protocol/models/note.dart'
    as _i3;
import 'protocol.dart' as _i4;

/// {@category Endpoint}
class EndpointNote extends _i1.EndpointRef {
  EndpointNote(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'note';

  /// Creates a new note with the provided text.
  /// Returns the created note.
  _i2.Future<_i3.Note> createNote(String text) =>
      caller.callServerEndpoint<_i3.Note>(
        'note',
        'createNote',
        {'text': text},
      );

  /// Returns a list of all notes.
  _i2.Future<List<_i3.Note>> getNotes() =>
      caller.callServerEndpoint<List<_i3.Note>>(
        'note',
        'getNotes',
        {},
      );

  /// Deletes a note by id.
  /// Returns the number of notes deleted (0 or 1).
  _i2.Future<int> deleteNoteById(int id) => caller.callServerEndpoint<int>(
        'note',
        'deleteNoteById',
        {'id': id},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
  }) : super(
          host,
          _i4.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
        ) {
    note = EndpointNote(this);
  }

  late final EndpointNote note;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {'note': note};

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
