// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'completions_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompletionsParams {

 int? get sessionId; String get content;@FilePathConverter() File? get imageData;
/// Create a copy of CompletionsParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompletionsParamsCopyWith<CompletionsParams> get copyWith => _$CompletionsParamsCopyWithImpl<CompletionsParams>(this as CompletionsParams, _$identity);

  /// Serializes this CompletionsParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompletionsParams&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.content, content) || other.content == content)&&(identical(other.imageData, imageData) || other.imageData == imageData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,content,imageData);

@override
String toString() {
  return 'CompletionsParams(sessionId: $sessionId, content: $content, imageData: $imageData)';
}


}

/// @nodoc
abstract mixin class $CompletionsParamsCopyWith<$Res>  {
  factory $CompletionsParamsCopyWith(CompletionsParams value, $Res Function(CompletionsParams) _then) = _$CompletionsParamsCopyWithImpl;
@useResult
$Res call({
 int? sessionId, String content,@FilePathConverter() File? imageData
});




}
/// @nodoc
class _$CompletionsParamsCopyWithImpl<$Res>
    implements $CompletionsParamsCopyWith<$Res> {
  _$CompletionsParamsCopyWithImpl(this._self, this._then);

  final CompletionsParams _self;
  final $Res Function(CompletionsParams) _then;

/// Create a copy of CompletionsParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = freezed,Object? content = null,Object? imageData = freezed,}) {
  return _then(_self.copyWith(
sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as int?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,imageData: freezed == imageData ? _self.imageData : imageData // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CompletionsParams implements CompletionsParams {
  const _CompletionsParams({this.sessionId, required this.content, @FilePathConverter() this.imageData});
  factory _CompletionsParams.fromJson(Map<String, dynamic> json) => _$CompletionsParamsFromJson(json);

@override final  int? sessionId;
@override final  String content;
@override@FilePathConverter() final  File? imageData;

/// Create a copy of CompletionsParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompletionsParamsCopyWith<_CompletionsParams> get copyWith => __$CompletionsParamsCopyWithImpl<_CompletionsParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompletionsParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompletionsParams&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.content, content) || other.content == content)&&(identical(other.imageData, imageData) || other.imageData == imageData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,content,imageData);

@override
String toString() {
  return 'CompletionsParams(sessionId: $sessionId, content: $content, imageData: $imageData)';
}


}

/// @nodoc
abstract mixin class _$CompletionsParamsCopyWith<$Res> implements $CompletionsParamsCopyWith<$Res> {
  factory _$CompletionsParamsCopyWith(_CompletionsParams value, $Res Function(_CompletionsParams) _then) = __$CompletionsParamsCopyWithImpl;
@override @useResult
$Res call({
 int? sessionId, String content,@FilePathConverter() File? imageData
});




}
/// @nodoc
class __$CompletionsParamsCopyWithImpl<$Res>
    implements _$CompletionsParamsCopyWith<$Res> {
  __$CompletionsParamsCopyWithImpl(this._self, this._then);

  final _CompletionsParams _self;
  final $Res Function(_CompletionsParams) _then;

/// Create a copy of CompletionsParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = freezed,Object? content = null,Object? imageData = freezed,}) {
  return _then(_CompletionsParams(
sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as int?,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,imageData: freezed == imageData ? _self.imageData : imageData // ignore: cast_nullable_to_non_nullable
as File?,
  ));
}


}

// dart format on
