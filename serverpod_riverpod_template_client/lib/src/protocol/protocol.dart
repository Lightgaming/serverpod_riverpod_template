/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'models/enums/error_type_enum.dart' as _i2;
import 'models/exceptions/entity_not_found_exception.dart' as _i3;
import 'models/note.dart' as _i4;
import 'package:serverpod_riverpod_template_client/src/protocol/models/note.dart'
    as _i5;
export 'models/enums/error_type_enum.dart';
export 'models/exceptions/entity_not_found_exception.dart';
export 'models/note.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.ErrorType) {
      return _i2.ErrorType.fromJson(data) as T;
    }
    if (t == _i3.EntityNotFoundException) {
      return _i3.EntityNotFoundException.fromJson(data, this) as T;
    }
    if (t == _i4.Note) {
      return _i4.Note.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.ErrorType?>()) {
      return (data != null ? _i2.ErrorType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.EntityNotFoundException?>()) {
      return (data != null
          ? _i3.EntityNotFoundException.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i4.Note?>()) {
      return (data != null ? _i4.Note.fromJson(data, this) : null) as T;
    }
    if (t == List<_i5.Note>) {
      return (data as List).map((e) => deserialize<_i5.Note>(e)).toList()
          as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.ErrorType) {
      return 'ErrorType';
    }
    if (data is _i3.EntityNotFoundException) {
      return 'EntityNotFoundException';
    }
    if (data is _i4.Note) {
      return 'Note';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'ErrorType') {
      return deserialize<_i2.ErrorType>(data['data']);
    }
    if (data['className'] == 'EntityNotFoundException') {
      return deserialize<_i3.EntityNotFoundException>(data['data']);
    }
    if (data['className'] == 'Note') {
      return deserialize<_i4.Note>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
