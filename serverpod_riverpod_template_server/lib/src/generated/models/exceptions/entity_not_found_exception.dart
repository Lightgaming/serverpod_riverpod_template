/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../protocol.dart' as _i2;

abstract class EntityNotFoundException extends _i1.SerializableEntity
    implements _i1.SerializableException {
  EntityNotFoundException._({
    required this.message,
    required this.errorType,
  });

  factory EntityNotFoundException({
    required String message,
    required _i2.ErrorType errorType,
  }) = _EntityNotFoundExceptionImpl;

  factory EntityNotFoundException.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return EntityNotFoundException(
      message: serializationManager
          .deserialize<String>(jsonSerialization['message']),
      errorType: serializationManager
          .deserialize<_i2.ErrorType>(jsonSerialization['errorType']),
    );
  }

  String message;

  _i2.ErrorType errorType;

  EntityNotFoundException copyWith({
    String? message,
    _i2.ErrorType? errorType,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'errorType': errorType.toJson(),
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'message': message,
      'errorType': errorType.toJson(),
    };
  }
}

class _EntityNotFoundExceptionImpl extends EntityNotFoundException {
  _EntityNotFoundExceptionImpl({
    required String message,
    required _i2.ErrorType errorType,
  }) : super._(
          message: message,
          errorType: errorType,
        );

  @override
  EntityNotFoundException copyWith({
    String? message,
    _i2.ErrorType? errorType,
  }) {
    return EntityNotFoundException(
      message: message ?? this.message,
      errorType: errorType ?? this.errorType,
    );
  }
}
