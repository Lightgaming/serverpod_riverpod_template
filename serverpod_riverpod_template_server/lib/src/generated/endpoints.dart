/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/note_endpoint.dart' as _i2;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'note': _i2.NoteEndpoint()
        ..initialize(
          server,
          'note',
          null,
        )
    };
    connectors['note'] = _i1.EndpointConnector(
      name: 'note',
      endpoint: endpoints['note']!,
      methodConnectors: {
        'createNote': _i1.MethodConnector(
          name: 'createNote',
          params: {
            'text': _i1.ParameterDescription(
              name: 'text',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['note'] as _i2.NoteEndpoint).createNote(
            session,
            params['text'],
          ),
        ),
        'getNotes': _i1.MethodConnector(
          name: 'getNotes',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['note'] as _i2.NoteEndpoint).getNotes(session),
        ),
        'deleteNoteById': _i1.MethodConnector(
          name: 'deleteNoteById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['note'] as _i2.NoteEndpoint).deleteNoteById(
            session,
            params['id'],
          ),
        ),
      },
    );
  }
}
