// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_messages_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetMessagesParams {

 int? get beforeId; int get sessionId;
/// Create a copy of GetMessagesParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetMessagesParamsCopyWith<GetMessagesParams> get copyWith => _$GetMessagesParamsCopyWithImpl<GetMessagesParams>(this as GetMessagesParams, _$identity);

  /// Serializes this GetMessagesParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetMessagesParams&&(identical(other.beforeId, beforeId) || other.beforeId == beforeId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,beforeId,sessionId);

@override
String toString() {
  return 'GetMessagesParams(beforeId: $beforeId, sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class $GetMessagesParamsCopyWith<$Res>  {
  factory $GetMessagesParamsCopyWith(GetMessagesParams value, $Res Function(GetMessagesParams) _then) = _$GetMessagesParamsCopyWithImpl;
@useResult
$Res call({
 int? beforeId, int sessionId
});




}
/// @nodoc
class _$GetMessagesParamsCopyWithImpl<$Res>
    implements $GetMessagesParamsCopyWith<$Res> {
  _$GetMessagesParamsCopyWithImpl(this._self, this._then);

  final GetMessagesParams _self;
  final $Res Function(GetMessagesParams) _then;

/// Create a copy of GetMessagesParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? beforeId = freezed,Object? sessionId = null,}) {
  return _then(_self.copyWith(
beforeId: freezed == beforeId ? _self.beforeId : beforeId // ignore: cast_nullable_to_non_nullable
as int?,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GetMessagesParams implements GetMessagesParams {
  const _GetMessagesParams({this.beforeId, required this.sessionId});
  factory _GetMessagesParams.fromJson(Map<String, dynamic> json) => _$GetMessagesParamsFromJson(json);

@override final  int? beforeId;
@override final  int sessionId;

/// Create a copy of GetMessagesParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetMessagesParamsCopyWith<_GetMessagesParams> get copyWith => __$GetMessagesParamsCopyWithImpl<_GetMessagesParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetMessagesParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetMessagesParams&&(identical(other.beforeId, beforeId) || other.beforeId == beforeId)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,beforeId,sessionId);

@override
String toString() {
  return 'GetMessagesParams(beforeId: $beforeId, sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class _$GetMessagesParamsCopyWith<$Res> implements $GetMessagesParamsCopyWith<$Res> {
  factory _$GetMessagesParamsCopyWith(_GetMessagesParams value, $Res Function(_GetMessagesParams) _then) = __$GetMessagesParamsCopyWithImpl;
@override @useResult
$Res call({
 int? beforeId, int sessionId
});




}
/// @nodoc
class __$GetMessagesParamsCopyWithImpl<$Res>
    implements _$GetMessagesParamsCopyWith<$Res> {
  __$GetMessagesParamsCopyWithImpl(this._self, this._then);

  final _GetMessagesParams _self;
  final $Res Function(_GetMessagesParams) _then;

/// Create a copy of GetMessagesParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? beforeId = freezed,Object? sessionId = null,}) {
  return _then(_GetMessagesParams(
beforeId: freezed == beforeId ? _self.beforeId : beforeId // ignore: cast_nullable_to_non_nullable
as int?,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
