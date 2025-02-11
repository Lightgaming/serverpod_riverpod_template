/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'models/enums/error_type_enum.dart' as _i3;
import 'models/exceptions/entity_not_found_exception.dart' as _i4;
import 'models/note.dart' as _i5;
import 'package:serverpod_riverpod_template_server/src/generated/models/note.dart'
    as _i6;
export 'models/enums/error_type_enum.dart';
export 'models/exceptions/entity_not_found_exception.dart';
export 'models/note.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'note',
      dartName: 'Note',
      schema: 'public',
      module: 'serverpod_riverpod_template',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'note_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'text',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'note_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i3.ErrorType) {
      return _i3.ErrorType.fromJson(data) as T;
    }
    if (t == _i4.EntityNotFoundException) {
      return _i4.EntityNotFoundException.fromJson(data, this) as T;
    }
    if (t == _i5.Note) {
      return _i5.Note.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i3.ErrorType?>()) {
      return (data != null ? _i3.ErrorType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.EntityNotFoundException?>()) {
      return (data != null
          ? _i4.EntityNotFoundException.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i5.Note?>()) {
      return (data != null ? _i5.Note.fromJson(data, this) : null) as T;
    }
    if (t == List<_i6.Note>) {
      return (data as List).map((e) => deserialize<_i6.Note>(e)).toList()
          as dynamic;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i3.ErrorType) {
      return 'ErrorType';
    }
    if (data is _i4.EntityNotFoundException) {
      return 'EntityNotFoundException';
    }
    if (data is _i5.Note) {
      return 'Note';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'ErrorType') {
      return deserialize<_i3.ErrorType>(data['data']);
    }
    if (data['className'] == 'EntityNotFoundException') {
      return deserialize<_i4.EntityNotFoundException>(data['data']);
    }
    if (data['className'] == 'Note') {
      return deserialize<_i5.Note>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i5.Note:
        return _i5.Note.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'serverpod_riverpod_template';
}
