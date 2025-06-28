// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_session_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteSessionParams {

 int get sessionId;
/// Create a copy of DeleteSessionParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteSessionParamsCopyWith<DeleteSessionParams> get copyWith => _$DeleteSessionParamsCopyWithImpl<DeleteSessionParams>(this as DeleteSessionParams, _$identity);

  /// Serializes this DeleteSessionParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteSessionParams&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId);

@override
String toString() {
  return 'DeleteSessionParams(sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class $DeleteSessionParamsCopyWith<$Res>  {
  factory $DeleteSessionParamsCopyWith(DeleteSessionParams value, $Res Function(DeleteSessionParams) _then) = _$DeleteSessionParamsCopyWithImpl;
@useResult
$Res call({
 int sessionId
});




}
/// @nodoc
class _$DeleteSessionParamsCopyWithImpl<$Res>
    implements $DeleteSessionParamsCopyWith<$Res> {
  _$DeleteSessionParamsCopyWithImpl(this._self, this._then);

  final DeleteSessionParams _self;
  final $Res Function(DeleteSessionParams) _then;

/// Create a copy of DeleteSessionParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,}) {
  return _then(_self.copyWith(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DeleteSessionParams implements DeleteSessionParams {
  const _DeleteSessionParams({required this.sessionId});
  factory _DeleteSessionParams.fromJson(Map<String, dynamic> json) => _$DeleteSessionParamsFromJson(json);

@override final  int sessionId;

/// Create a copy of DeleteSessionParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteSessionParamsCopyWith<_DeleteSessionParams> get copyWith => __$DeleteSessionParamsCopyWithImpl<_DeleteSessionParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeleteSessionParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteSessionParams&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId);

@override
String toString() {
  return 'DeleteSessionParams(sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class _$DeleteSessionParamsCopyWith<$Res> implements $DeleteSessionParamsCopyWith<$Res> {
  factory _$DeleteSessionParamsCopyWith(_DeleteSessionParams value, $Res Function(_DeleteSessionParams) _then) = __$DeleteSessionParamsCopyWithImpl;
@override @useResult
$Res call({
 int sessionId
});




}
/// @nodoc
class __$DeleteSessionParamsCopyWithImpl<$Res>
    implements _$DeleteSessionParamsCopyWith<$Res> {
  __$DeleteSessionParamsCopyWithImpl(this._self, this._then);

  final _DeleteSessionParams _self;
  final $Res Function(_DeleteSessionParams) _then;

/// Create a copy of DeleteSessionParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,}) {
  return _then(_DeleteSessionParams(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
