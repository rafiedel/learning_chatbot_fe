// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rename_session_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RenameSessionParams {

 int get sessionId; String get newTitle;
/// Create a copy of RenameSessionParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RenameSessionParamsCopyWith<RenameSessionParams> get copyWith => _$RenameSessionParamsCopyWithImpl<RenameSessionParams>(this as RenameSessionParams, _$identity);

  /// Serializes this RenameSessionParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RenameSessionParams&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.newTitle, newTitle) || other.newTitle == newTitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,newTitle);

@override
String toString() {
  return 'RenameSessionParams(sessionId: $sessionId, newTitle: $newTitle)';
}


}

/// @nodoc
abstract mixin class $RenameSessionParamsCopyWith<$Res>  {
  factory $RenameSessionParamsCopyWith(RenameSessionParams value, $Res Function(RenameSessionParams) _then) = _$RenameSessionParamsCopyWithImpl;
@useResult
$Res call({
 int sessionId, String newTitle
});




}
/// @nodoc
class _$RenameSessionParamsCopyWithImpl<$Res>
    implements $RenameSessionParamsCopyWith<$Res> {
  _$RenameSessionParamsCopyWithImpl(this._self, this._then);

  final RenameSessionParams _self;
  final $Res Function(RenameSessionParams) _then;

/// Create a copy of RenameSessionParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,Object? newTitle = null,}) {
  return _then(_self.copyWith(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as int,newTitle: null == newTitle ? _self.newTitle : newTitle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RenameSessionParams implements RenameSessionParams {
  const _RenameSessionParams({required this.sessionId, required this.newTitle});
  factory _RenameSessionParams.fromJson(Map<String, dynamic> json) => _$RenameSessionParamsFromJson(json);

@override final  int sessionId;
@override final  String newTitle;

/// Create a copy of RenameSessionParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RenameSessionParamsCopyWith<_RenameSessionParams> get copyWith => __$RenameSessionParamsCopyWithImpl<_RenameSessionParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RenameSessionParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RenameSessionParams&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.newTitle, newTitle) || other.newTitle == newTitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,newTitle);

@override
String toString() {
  return 'RenameSessionParams(sessionId: $sessionId, newTitle: $newTitle)';
}


}

/// @nodoc
abstract mixin class _$RenameSessionParamsCopyWith<$Res> implements $RenameSessionParamsCopyWith<$Res> {
  factory _$RenameSessionParamsCopyWith(_RenameSessionParams value, $Res Function(_RenameSessionParams) _then) = __$RenameSessionParamsCopyWithImpl;
@override @useResult
$Res call({
 int sessionId, String newTitle
});




}
/// @nodoc
class __$RenameSessionParamsCopyWithImpl<$Res>
    implements _$RenameSessionParamsCopyWith<$Res> {
  __$RenameSessionParamsCopyWithImpl(this._self, this._then);

  final _RenameSessionParams _self;
  final $Res Function(_RenameSessionParams) _then;

/// Create a copy of RenameSessionParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? newTitle = null,}) {
  return _then(_RenameSessionParams(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as int,newTitle: null == newTitle ? _self.newTitle : newTitle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
