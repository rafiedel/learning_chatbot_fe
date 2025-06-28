// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_sessions_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetSessionsParams {

 int? get beforeId; String? get title;
/// Create a copy of GetSessionsParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetSessionsParamsCopyWith<GetSessionsParams> get copyWith => _$GetSessionsParamsCopyWithImpl<GetSessionsParams>(this as GetSessionsParams, _$identity);

  /// Serializes this GetSessionsParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetSessionsParams&&(identical(other.beforeId, beforeId) || other.beforeId == beforeId)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,beforeId,title);

@override
String toString() {
  return 'GetSessionsParams(beforeId: $beforeId, title: $title)';
}


}

/// @nodoc
abstract mixin class $GetSessionsParamsCopyWith<$Res>  {
  factory $GetSessionsParamsCopyWith(GetSessionsParams value, $Res Function(GetSessionsParams) _then) = _$GetSessionsParamsCopyWithImpl;
@useResult
$Res call({
 int? beforeId, String? title
});




}
/// @nodoc
class _$GetSessionsParamsCopyWithImpl<$Res>
    implements $GetSessionsParamsCopyWith<$Res> {
  _$GetSessionsParamsCopyWithImpl(this._self, this._then);

  final GetSessionsParams _self;
  final $Res Function(GetSessionsParams) _then;

/// Create a copy of GetSessionsParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? beforeId = freezed,Object? title = freezed,}) {
  return _then(_self.copyWith(
beforeId: freezed == beforeId ? _self.beforeId : beforeId // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GetSessionsParams implements GetSessionsParams {
  const _GetSessionsParams({this.beforeId, this.title});
  factory _GetSessionsParams.fromJson(Map<String, dynamic> json) => _$GetSessionsParamsFromJson(json);

@override final  int? beforeId;
@override final  String? title;

/// Create a copy of GetSessionsParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetSessionsParamsCopyWith<_GetSessionsParams> get copyWith => __$GetSessionsParamsCopyWithImpl<_GetSessionsParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetSessionsParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetSessionsParams&&(identical(other.beforeId, beforeId) || other.beforeId == beforeId)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,beforeId,title);

@override
String toString() {
  return 'GetSessionsParams(beforeId: $beforeId, title: $title)';
}


}

/// @nodoc
abstract mixin class _$GetSessionsParamsCopyWith<$Res> implements $GetSessionsParamsCopyWith<$Res> {
  factory _$GetSessionsParamsCopyWith(_GetSessionsParams value, $Res Function(_GetSessionsParams) _then) = __$GetSessionsParamsCopyWithImpl;
@override @useResult
$Res call({
 int? beforeId, String? title
});




}
/// @nodoc
class __$GetSessionsParamsCopyWithImpl<$Res>
    implements _$GetSessionsParamsCopyWith<$Res> {
  __$GetSessionsParamsCopyWithImpl(this._self, this._then);

  final _GetSessionsParams _self;
  final $Res Function(_GetSessionsParams) _then;

/// Create a copy of GetSessionsParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? beforeId = freezed,Object? title = freezed,}) {
  return _then(_GetSessionsParams(
beforeId: freezed == beforeId ? _self.beforeId : beforeId // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
