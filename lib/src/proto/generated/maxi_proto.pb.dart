// This is a generated file - do not edit.
//
// Generated from maxi_proto.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/any.pb.dart' as $2;
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart' as $0;

import 'maxi_proto.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'maxi_proto.pbenum.dart';

class ProtoDartDecorator extends $pb.GeneratedMessage {
  factory ProtoDartDecorator({
    $core.Iterable<$core.String>? dartDecorators,
  }) {
    final result = create();
    if (dartDecorators != null) result.dartDecorators.addAll(dartDecorators);
    return result;
  }

  ProtoDartDecorator._();

  factory ProtoDartDecorator.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoDartDecorator.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoDartDecorator',
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'dartDecorators')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoDartDecorator clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoDartDecorator copyWith(void Function(ProtoDartDecorator) updates) =>
      super.copyWith((message) => updates(message as ProtoDartDecorator))
          as ProtoDartDecorator;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoDartDecorator create() => ProtoDartDecorator._();
  @$core.override
  ProtoDartDecorator createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ProtoDartDecorator getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoDartDecorator>(create);
  static ProtoDartDecorator? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get dartDecorators => $_getList(0);
}

class ProtoDartClass extends $pb.GeneratedMessage {
  factory ProtoDartClass({
    $core.String? name,
    $core.String? dartType,
    $core.Iterable<ProtoDartDecorator>? decorators,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (dartType != null) result.dartType = dartType;
    if (decorators != null) result.decorators.addAll(decorators);
    return result;
  }

  ProtoDartClass._();

  factory ProtoDartClass.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoDartClass.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoDartClass',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'dartType')
    ..pPM<ProtoDartDecorator>(3, _omitFieldNames ? '' : 'decorators',
        subBuilder: ProtoDartDecorator.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoDartClass clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoDartClass copyWith(void Function(ProtoDartClass) updates) =>
      super.copyWith((message) => updates(message as ProtoDartClass))
          as ProtoDartClass;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoDartClass create() => ProtoDartClass._();
  @$core.override
  ProtoDartClass createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ProtoDartClass getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoDartClass>(create);
  static ProtoDartClass? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get dartType => $_getSZ(1);
  @$pb.TagNumber(2)
  set dartType($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDartType() => $_has(1);
  @$pb.TagNumber(2)
  void clearDartType() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<ProtoDartDecorator> get decorators => $_getList(2);
}

class ProtoDartField extends $pb.GeneratedMessage {
  factory ProtoDartField({
    $core.String? name,
    $core.String? dartType,
    $core.Iterable<ProtoDartDecorator>? decorators,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (dartType != null) result.dartType = dartType;
    if (decorators != null) result.decorators.addAll(decorators);
    return result;
  }

  ProtoDartField._();

  factory ProtoDartField.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoDartField.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoDartField',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'dartType')
    ..pPM<ProtoDartDecorator>(3, _omitFieldNames ? '' : 'decorators',
        subBuilder: ProtoDartDecorator.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoDartField clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoDartField copyWith(void Function(ProtoDartField) updates) =>
      super.copyWith((message) => updates(message as ProtoDartField))
          as ProtoDartField;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoDartField create() => ProtoDartField._();
  @$core.override
  ProtoDartField createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ProtoDartField getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoDartField>(create);
  static ProtoDartField? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get dartType => $_getSZ(1);
  @$pb.TagNumber(2)
  set dartType($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDartType() => $_has(1);
  @$pb.TagNumber(2)
  void clearDartType() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<ProtoDartDecorator> get decorators => $_getList(2);
}

class ProtoDartEnum extends $pb.GeneratedMessage {
  factory ProtoDartEnum({
    $core.String? name,
    $core.String? prefix,
    $core.String? dartType,
    $core.Iterable<ProtoDartDecorator>? decorators,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (prefix != null) result.prefix = prefix;
    if (dartType != null) result.dartType = dartType;
    if (decorators != null) result.decorators.addAll(decorators);
    return result;
  }

  ProtoDartEnum._();

  factory ProtoDartEnum.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoDartEnum.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoDartEnum',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'prefix')
    ..aOS(3, _omitFieldNames ? '' : 'dartType')
    ..pPM<ProtoDartDecorator>(4, _omitFieldNames ? '' : 'decorators',
        subBuilder: ProtoDartDecorator.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoDartEnum clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoDartEnum copyWith(void Function(ProtoDartEnum) updates) =>
      super.copyWith((message) => updates(message as ProtoDartEnum))
          as ProtoDartEnum;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoDartEnum create() => ProtoDartEnum._();
  @$core.override
  ProtoDartEnum createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ProtoDartEnum getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoDartEnum>(create);
  static ProtoDartEnum? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get prefix => $_getSZ(1);
  @$pb.TagNumber(2)
  set prefix($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPrefix() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrefix() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get dartType => $_getSZ(2);
  @$pb.TagNumber(3)
  set dartType($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDartType() => $_has(2);
  @$pb.TagNumber(3)
  void clearDartType() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<ProtoDartDecorator> get decorators => $_getList(3);
}

class ProtoDartEnumValue extends $pb.GeneratedMessage {
  factory ProtoDartEnumValue({
    $core.String? name,
    $core.int? number,
    $core.Iterable<ProtoDartDecorator>? decorators,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (number != null) result.number = number;
    if (decorators != null) result.decorators.addAll(decorators);
    return result;
  }

  ProtoDartEnumValue._();

  factory ProtoDartEnumValue.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoDartEnumValue.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoDartEnumValue',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aI(2, _omitFieldNames ? '' : 'number')
    ..pPM<ProtoDartDecorator>(3, _omitFieldNames ? '' : 'decorators',
        subBuilder: ProtoDartDecorator.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoDartEnumValue clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoDartEnumValue copyWith(void Function(ProtoDartEnumValue) updates) =>
      super.copyWith((message) => updates(message as ProtoDartEnumValue))
          as ProtoDartEnumValue;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoDartEnumValue create() => ProtoDartEnumValue._();
  @$core.override
  ProtoDartEnumValue createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ProtoDartEnumValue getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoDartEnumValue>(create);
  static ProtoDartEnumValue? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get number => $_getIZ(1);
  @$pb.TagNumber(2)
  set number($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumber() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<ProtoDartDecorator> get decorators => $_getList(2);
}

class ProtoOration extends $pb.GeneratedMessage {
  factory ProtoOration({
    $core.String? tokenId,
    $core.String? text,
    $core.Iterable<$core.String>? textParts,
  }) {
    final result = create();
    if (tokenId != null) result.tokenId = tokenId;
    if (text != null) result.text = text;
    if (textParts != null) result.textParts.addAll(textParts);
    return result;
  }

  ProtoOration._();

  factory ProtoOration.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoOration.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoOration',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tokenId')
    ..aOS(2, _omitFieldNames ? '' : 'text')
    ..pPS(3, _omitFieldNames ? '' : 'textParts')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoOration clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoOration copyWith(void Function(ProtoOration) updates) =>
      super.copyWith((message) => updates(message as ProtoOration))
          as ProtoOration;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoOration create() => ProtoOration._();
  @$core.override
  ProtoOration createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ProtoOration getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoOration>(create);
  static ProtoOration? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tokenId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tokenId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTokenId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTokenId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get textParts => $_getList(2);
}

class ProtoNegativeResult extends $pb.GeneratedMessage {
  factory ProtoNegativeResult({
    $core.int? errorCode,
    ProtoOration? message,
  }) {
    final result = create();
    if (errorCode != null) result.errorCode = errorCode;
    if (message != null) result.message = message;
    return result;
  }

  ProtoNegativeResult._();

  factory ProtoNegativeResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoNegativeResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoNegativeResult',
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'errorCode')
    ..aOM<ProtoOration>(2, _omitFieldNames ? '' : 'message',
        subBuilder: ProtoOration.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoNegativeResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoNegativeResult copyWith(void Function(ProtoNegativeResult) updates) =>
      super.copyWith((message) => updates(message as ProtoNegativeResult))
          as ProtoNegativeResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoNegativeResult create() => ProtoNegativeResult._();
  @$core.override
  ProtoNegativeResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ProtoNegativeResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoNegativeResult>(create);
  static ProtoNegativeResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get errorCode => $_getIZ(0);
  @$pb.TagNumber(1)
  set errorCode($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasErrorCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrorCode() => $_clearField(1);

  @$pb.TagNumber(2)
  ProtoOration get message => $_getN(1);
  @$pb.TagNumber(2)
  set message(ProtoOration value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
  @$pb.TagNumber(2)
  ProtoOration ensureMessage() => $_ensure(1);
}

enum ProtoResult_Value { content, error, notSet }

class ProtoResult extends $pb.GeneratedMessage {
  factory ProtoResult({
    $core.bool? itsCorrect,
    $2.Any? content,
    ProtoNegativeResult? error,
  }) {
    final result = create();
    if (itsCorrect != null) result.itsCorrect = itsCorrect;
    if (content != null) result.content = content;
    if (error != null) result.error = error;
    return result;
  }

  ProtoResult._();

  factory ProtoResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ProtoResult_Value> _ProtoResult_ValueByTag =
      {
    2: ProtoResult_Value.content,
    3: ProtoResult_Value.error,
    0: ProtoResult_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoResult',
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..aOB(1, _omitFieldNames ? '' : 'itsCorrect')
    ..aOM<$2.Any>(2, _omitFieldNames ? '' : 'content',
        subBuilder: $2.Any.create)
    ..aOM<ProtoNegativeResult>(3, _omitFieldNames ? '' : 'error',
        subBuilder: ProtoNegativeResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoResult copyWith(void Function(ProtoResult) updates) =>
      super.copyWith((message) => updates(message as ProtoResult))
          as ProtoResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoResult create() => ProtoResult._();
  @$core.override
  ProtoResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ProtoResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoResult>(create);
  static ProtoResult? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  ProtoResult_Value whichValue() => _ProtoResult_ValueByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  void clearValue() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.bool get itsCorrect => $_getBF(0);
  @$pb.TagNumber(1)
  set itsCorrect($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasItsCorrect() => $_has(0);
  @$pb.TagNumber(1)
  void clearItsCorrect() => $_clearField(1);

  @$pb.TagNumber(2)
  $2.Any get content => $_getN(1);
  @$pb.TagNumber(2)
  set content($2.Any value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.Any ensureContent() => $_ensure(1);

  @$pb.TagNumber(3)
  ProtoNegativeResult get error => $_getN(2);
  @$pb.TagNumber(3)
  set error(ProtoNegativeResult value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => $_clearField(3);
  @$pb.TagNumber(3)
  ProtoNegativeResult ensureError() => $_ensure(2);
}

enum ProtoVoidResult_Value { content, error, notSet }

class ProtoVoidResult extends $pb.GeneratedMessage {
  factory ProtoVoidResult({
    $core.bool? itsCorrect,
    $0.Empty? content,
    ProtoNegativeResult? error,
  }) {
    final result = create();
    if (itsCorrect != null) result.itsCorrect = itsCorrect;
    if (content != null) result.content = content;
    if (error != null) result.error = error;
    return result;
  }

  ProtoVoidResult._();

  factory ProtoVoidResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoVoidResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ProtoVoidResult_Value>
      _ProtoVoidResult_ValueByTag = {
    2: ProtoVoidResult_Value.content,
    3: ProtoVoidResult_Value.error,
    0: ProtoVoidResult_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoVoidResult',
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..aOB(1, _omitFieldNames ? '' : 'itsCorrect')
    ..aOM<$0.Empty>(2, _omitFieldNames ? '' : 'content',
        subBuilder: $0.Empty.create)
    ..aOM<ProtoNegativeResult>(3, _omitFieldNames ? '' : 'error',
        subBuilder: ProtoNegativeResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoVoidResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoVoidResult copyWith(void Function(ProtoVoidResult) updates) =>
      super.copyWith((message) => updates(message as ProtoVoidResult))
          as ProtoVoidResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoVoidResult create() => ProtoVoidResult._();
  @$core.override
  ProtoVoidResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ProtoVoidResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoVoidResult>(create);
  static ProtoVoidResult? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  ProtoVoidResult_Value whichValue() =>
      _ProtoVoidResult_ValueByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  void clearValue() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.bool get itsCorrect => $_getBF(0);
  @$pb.TagNumber(1)
  set itsCorrect($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasItsCorrect() => $_has(0);
  @$pb.TagNumber(1)
  void clearItsCorrect() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.Empty get content => $_getN(1);
  @$pb.TagNumber(2)
  set content($0.Empty value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Empty ensureContent() => $_ensure(1);

  @$pb.TagNumber(3)
  ProtoNegativeResult get error => $_getN(2);
  @$pb.TagNumber(3)
  set error(ProtoNegativeResult value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => $_clearField(3);
  @$pb.TagNumber(3)
  ProtoNegativeResult ensureError() => $_ensure(2);
}

enum ProtoVoidStream_Value { text, completed, error, notSet }

class ProtoVoidStream extends $pb.GeneratedMessage {
  factory ProtoVoidStream({
    MaxiProtoStreamStatus? status,
    ProtoOration? text,
    $0.Empty? completed,
    ProtoNegativeResult? error,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (text != null) result.text = text;
    if (completed != null) result.completed = completed;
    if (error != null) result.error = error;
    return result;
  }

  ProtoVoidStream._();

  factory ProtoVoidStream.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoVoidStream.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ProtoVoidStream_Value>
      _ProtoVoidStream_ValueByTag = {
    2: ProtoVoidStream_Value.text,
    3: ProtoVoidStream_Value.completed,
    4: ProtoVoidStream_Value.error,
    0: ProtoVoidStream_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoVoidStream',
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4])
    ..aE<MaxiProtoStreamStatus>(1, _omitFieldNames ? '' : 'status',
        enumValues: MaxiProtoStreamStatus.values)
    ..aOM<ProtoOration>(2, _omitFieldNames ? '' : 'text',
        subBuilder: ProtoOration.create)
    ..aOM<$0.Empty>(3, _omitFieldNames ? '' : 'completed',
        subBuilder: $0.Empty.create)
    ..aOM<ProtoNegativeResult>(4, _omitFieldNames ? '' : 'error',
        subBuilder: ProtoNegativeResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoVoidStream clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoVoidStream copyWith(void Function(ProtoVoidStream) updates) =>
      super.copyWith((message) => updates(message as ProtoVoidStream))
          as ProtoVoidStream;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoVoidStream create() => ProtoVoidStream._();
  @$core.override
  ProtoVoidStream createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ProtoVoidStream getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoVoidStream>(create);
  static ProtoVoidStream? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  ProtoVoidStream_Value whichValue() =>
      _ProtoVoidStream_ValueByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  void clearValue() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  MaxiProtoStreamStatus get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(MaxiProtoStreamStatus value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  ProtoOration get text => $_getN(1);
  @$pb.TagNumber(2)
  set text(ProtoOration value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => $_clearField(2);
  @$pb.TagNumber(2)
  ProtoOration ensureText() => $_ensure(1);

  @$pb.TagNumber(3)
  $0.Empty get completed => $_getN(2);
  @$pb.TagNumber(3)
  set completed($0.Empty value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCompleted() => $_has(2);
  @$pb.TagNumber(3)
  void clearCompleted() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Empty ensureCompleted() => $_ensure(2);

  @$pb.TagNumber(4)
  ProtoNegativeResult get error => $_getN(3);
  @$pb.TagNumber(4)
  set error(ProtoNegativeResult value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasError() => $_has(3);
  @$pb.TagNumber(4)
  void clearError() => $_clearField(4);
  @$pb.TagNumber(4)
  ProtoNegativeResult ensureError() => $_ensure(3);
}

enum ProtoJsonResult_Value { content, error, notSet }

class ProtoJsonResult extends $pb.GeneratedMessage {
  factory ProtoJsonResult({
    $core.bool? itsCorrect,
    $core.String? content,
    ProtoNegativeResult? error,
  }) {
    final result = create();
    if (itsCorrect != null) result.itsCorrect = itsCorrect;
    if (content != null) result.content = content;
    if (error != null) result.error = error;
    return result;
  }

  ProtoJsonResult._();

  factory ProtoJsonResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoJsonResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ProtoJsonResult_Value>
      _ProtoJsonResult_ValueByTag = {
    2: ProtoJsonResult_Value.content,
    3: ProtoJsonResult_Value.error,
    0: ProtoJsonResult_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoJsonResult',
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..aOB(1, _omitFieldNames ? '' : 'itsCorrect')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..aOM<ProtoNegativeResult>(3, _omitFieldNames ? '' : 'error',
        subBuilder: ProtoNegativeResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoJsonResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoJsonResult copyWith(void Function(ProtoJsonResult) updates) =>
      super.copyWith((message) => updates(message as ProtoJsonResult))
          as ProtoJsonResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoJsonResult create() => ProtoJsonResult._();
  @$core.override
  ProtoJsonResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ProtoJsonResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoJsonResult>(create);
  static ProtoJsonResult? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  ProtoJsonResult_Value whichValue() =>
      _ProtoJsonResult_ValueByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  void clearValue() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.bool get itsCorrect => $_getBF(0);
  @$pb.TagNumber(1)
  set itsCorrect($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasItsCorrect() => $_has(0);
  @$pb.TagNumber(1)
  void clearItsCorrect() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => $_clearField(2);

  @$pb.TagNumber(3)
  ProtoNegativeResult get error => $_getN(2);
  @$pb.TagNumber(3)
  set error(ProtoNegativeResult value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => $_clearField(3);
  @$pb.TagNumber(3)
  ProtoNegativeResult ensureError() => $_ensure(2);
}

enum ProtoJsonStream_Value { text, completed, error, notSet }

class ProtoJsonStream extends $pb.GeneratedMessage {
  factory ProtoJsonStream({
    MaxiProtoStreamStatus? status,
    ProtoOration? text,
    $core.String? completed,
    ProtoNegativeResult? error,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (text != null) result.text = text;
    if (completed != null) result.completed = completed;
    if (error != null) result.error = error;
    return result;
  }

  ProtoJsonStream._();

  factory ProtoJsonStream.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoJsonStream.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ProtoJsonStream_Value>
      _ProtoJsonStream_ValueByTag = {
    2: ProtoJsonStream_Value.text,
    3: ProtoJsonStream_Value.completed,
    4: ProtoJsonStream_Value.error,
    0: ProtoJsonStream_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoJsonStream',
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4])
    ..aE<MaxiProtoStreamStatus>(1, _omitFieldNames ? '' : 'status',
        enumValues: MaxiProtoStreamStatus.values)
    ..aOM<ProtoOration>(2, _omitFieldNames ? '' : 'text',
        subBuilder: ProtoOration.create)
    ..aOS(3, _omitFieldNames ? '' : 'completed')
    ..aOM<ProtoNegativeResult>(4, _omitFieldNames ? '' : 'error',
        subBuilder: ProtoNegativeResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoJsonStream clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoJsonStream copyWith(void Function(ProtoJsonStream) updates) =>
      super.copyWith((message) => updates(message as ProtoJsonStream))
          as ProtoJsonStream;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoJsonStream create() => ProtoJsonStream._();
  @$core.override
  ProtoJsonStream createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ProtoJsonStream getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoJsonStream>(create);
  static ProtoJsonStream? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  ProtoJsonStream_Value whichValue() =>
      _ProtoJsonStream_ValueByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  void clearValue() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  MaxiProtoStreamStatus get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(MaxiProtoStreamStatus value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  ProtoOration get text => $_getN(1);
  @$pb.TagNumber(2)
  set text(ProtoOration value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => $_clearField(2);
  @$pb.TagNumber(2)
  ProtoOration ensureText() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get completed => $_getSZ(2);
  @$pb.TagNumber(3)
  set completed($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCompleted() => $_has(2);
  @$pb.TagNumber(3)
  void clearCompleted() => $_clearField(3);

  @$pb.TagNumber(4)
  ProtoNegativeResult get error => $_getN(3);
  @$pb.TagNumber(4)
  set error(ProtoNegativeResult value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasError() => $_has(3);
  @$pb.TagNumber(4)
  void clearError() => $_clearField(4);
  @$pb.TagNumber(4)
  ProtoNegativeResult ensureError() => $_ensure(3);
}

class EmptyRequest extends $pb.GeneratedMessage {
  factory EmptyRequest() => create();

  EmptyRequest._();

  factory EmptyRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EmptyRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EmptyRequest',
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmptyRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EmptyRequest copyWith(void Function(EmptyRequest) updates) =>
      super.copyWith((message) => updates(message as EmptyRequest))
          as EmptyRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmptyRequest create() => EmptyRequest._();
  @$core.override
  EmptyRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EmptyRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<EmptyRequest>(create);
  static EmptyRequest? _defaultInstance;
}

class ProtoJsonRequest extends $pb.GeneratedMessage {
  factory ProtoJsonRequest({
    $fixnum.Int64? identifier,
    $core.String? json,
  }) {
    final result = create();
    if (identifier != null) result.identifier = identifier;
    if (json != null) result.json = json;
    return result;
  }

  ProtoJsonRequest._();

  factory ProtoJsonRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoJsonRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoJsonRequest',
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'identifier', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'json')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoJsonRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoJsonRequest copyWith(void Function(ProtoJsonRequest) updates) =>
      super.copyWith((message) => updates(message as ProtoJsonRequest))
          as ProtoJsonRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoJsonRequest create() => ProtoJsonRequest._();
  @$core.override
  ProtoJsonRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ProtoJsonRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoJsonRequest>(create);
  static ProtoJsonRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get identifier => $_getI64(0);
  @$pb.TagNumber(1)
  set identifier($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentifier() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get json => $_getSZ(1);
  @$pb.TagNumber(2)
  set json($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasJson() => $_has(1);
  @$pb.TagNumber(2)
  void clearJson() => $_clearField(2);
}

class SelectedFrom extends $pb.GeneratedMessage {
  factory SelectedFrom({
    $fixnum.Int64? from,
    $core.int? amount,
    $core.String? filter,
    $core.bool? ascending,
  }) {
    final result = create();
    if (from != null) result.from = from;
    if (amount != null) result.amount = amount;
    if (filter != null) result.filter = filter;
    if (ascending != null) result.ascending = ascending;
    return result;
  }

  SelectedFrom._();

  factory SelectedFrom.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SelectedFrom.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SelectedFrom',
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'from', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aI(2, _omitFieldNames ? '' : 'amount', fieldType: $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'filter')
    ..aOB(4, _omitFieldNames ? '' : 'ascending')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SelectedFrom clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SelectedFrom copyWith(void Function(SelectedFrom) updates) =>
      super.copyWith((message) => updates(message as SelectedFrom))
          as SelectedFrom;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SelectedFrom create() => SelectedFrom._();
  @$core.override
  SelectedFrom createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SelectedFrom getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SelectedFrom>(create);
  static SelectedFrom? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get from => $_getI64(0);
  @$pb.TagNumber(1)
  set from($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get amount => $_getIZ(1);
  @$pb.TagNumber(2)
  set amount($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get filter => $_getSZ(2);
  @$pb.TagNumber(3)
  set filter($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFilter() => $_has(2);
  @$pb.TagNumber(3)
  void clearFilter() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get ascending => $_getBF(3);
  @$pb.TagNumber(4)
  set ascending($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAscending() => $_has(3);
  @$pb.TagNumber(4)
  void clearAscending() => $_clearField(4);
}

class SelectMultipleIdentifiers extends $pb.GeneratedMessage {
  factory SelectMultipleIdentifiers({
    $core.Iterable<$fixnum.Int64>? selectedIds,
  }) {
    final result = create();
    if (selectedIds != null) result.selectedIds.addAll(selectedIds);
    return result;
  }

  SelectMultipleIdentifiers._();

  factory SelectMultipleIdentifiers.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SelectMultipleIdentifiers.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SelectMultipleIdentifiers',
      createEmptyInstance: create)
    ..p<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'selectedIds', $pb.PbFieldType.KU6)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SelectMultipleIdentifiers clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SelectMultipleIdentifiers copyWith(
          void Function(SelectMultipleIdentifiers) updates) =>
      super.copyWith((message) => updates(message as SelectMultipleIdentifiers))
          as SelectMultipleIdentifiers;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SelectMultipleIdentifiers create() => SelectMultipleIdentifiers._();
  @$core.override
  SelectMultipleIdentifiers createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SelectMultipleIdentifiers getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SelectMultipleIdentifiers>(create);
  static SelectMultipleIdentifiers? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$fixnum.Int64> get selectedIds => $_getList(0);
}

class SelectedIdentifierRequest extends $pb.GeneratedMessage {
  factory SelectedIdentifierRequest({
    $fixnum.Int64? identifier,
  }) {
    final result = create();
    if (identifier != null) result.identifier = identifier;
    return result;
  }

  SelectedIdentifierRequest._();

  factory SelectedIdentifierRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SelectedIdentifierRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SelectedIdentifierRequest',
      createEmptyInstance: create)
    ..a<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'identifier', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SelectedIdentifierRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SelectedIdentifierRequest copyWith(
          void Function(SelectedIdentifierRequest) updates) =>
      super.copyWith((message) => updates(message as SelectedIdentifierRequest))
          as SelectedIdentifierRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SelectedIdentifierRequest create() => SelectedIdentifierRequest._();
  @$core.override
  SelectedIdentifierRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SelectedIdentifierRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SelectedIdentifierRequest>(create);
  static SelectedIdentifierRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get identifier => $_getI64(0);
  @$pb.TagNumber(1)
  set identifier($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIdentifier() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdentifier() => $_clearField(1);
}

class SelectByName extends $pb.GeneratedMessage {
  factory SelectByName({
    $core.String? name,
  }) {
    final result = create();
    if (name != null) result.name = name;
    return result;
  }

  SelectByName._();

  factory SelectByName.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SelectByName.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SelectByName',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SelectByName clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SelectByName copyWith(void Function(SelectByName) updates) =>
      super.copyWith((message) => updates(message as SelectByName))
          as SelectByName;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SelectByName create() => SelectByName._();
  @$core.override
  SelectByName createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SelectByName getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SelectByName>(create);
  static SelectByName? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);
}

class SelectByNameAndIdentifier extends $pb.GeneratedMessage {
  factory SelectByNameAndIdentifier({
    $core.String? name,
    $fixnum.Int64? identifier,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (identifier != null) result.identifier = identifier;
    return result;
  }

  SelectByNameAndIdentifier._();

  factory SelectByNameAndIdentifier.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SelectByNameAndIdentifier.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SelectByNameAndIdentifier',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'identifier', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SelectByNameAndIdentifier clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SelectByNameAndIdentifier copyWith(
          void Function(SelectByNameAndIdentifier) updates) =>
      super.copyWith((message) => updates(message as SelectByNameAndIdentifier))
          as SelectByNameAndIdentifier;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SelectByNameAndIdentifier create() => SelectByNameAndIdentifier._();
  @$core.override
  SelectByNameAndIdentifier createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SelectByNameAndIdentifier getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SelectByNameAndIdentifier>(create);
  static SelectByNameAndIdentifier? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get identifier => $_getI64(1);
  @$pb.TagNumber(2)
  set identifier($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIdentifier() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdentifier() => $_clearField(2);
}

enum ObtainIdentifierStream_Value { text, completed, error, notSet }

class ObtainIdentifierStream extends $pb.GeneratedMessage {
  factory ObtainIdentifierStream({
    MaxiProtoStreamStatus? status,
    $core.Iterable<$fixnum.Int64>? identifiers,
    ProtoOration? text,
    $0.Empty? completed,
    ProtoNegativeResult? error,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (identifiers != null) result.identifiers.addAll(identifiers);
    if (text != null) result.text = text;
    if (completed != null) result.completed = completed;
    if (error != null) result.error = error;
    return result;
  }

  ObtainIdentifierStream._();

  factory ObtainIdentifierStream.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ObtainIdentifierStream.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ObtainIdentifierStream_Value>
      _ObtainIdentifierStream_ValueByTag = {
    3: ObtainIdentifierStream_Value.text,
    4: ObtainIdentifierStream_Value.completed,
    5: ObtainIdentifierStream_Value.error,
    0: ObtainIdentifierStream_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ObtainIdentifierStream',
      createEmptyInstance: create)
    ..oo(0, [3, 4, 5])
    ..aE<MaxiProtoStreamStatus>(1, _omitFieldNames ? '' : 'status',
        enumValues: MaxiProtoStreamStatus.values)
    ..p<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'identifiers', $pb.PbFieldType.KU6)
    ..aOM<ProtoOration>(3, _omitFieldNames ? '' : 'text',
        subBuilder: ProtoOration.create)
    ..aOM<$0.Empty>(4, _omitFieldNames ? '' : 'completed',
        subBuilder: $0.Empty.create)
    ..aOM<ProtoNegativeResult>(5, _omitFieldNames ? '' : 'error',
        subBuilder: ProtoNegativeResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ObtainIdentifierStream clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ObtainIdentifierStream copyWith(
          void Function(ObtainIdentifierStream) updates) =>
      super.copyWith((message) => updates(message as ObtainIdentifierStream))
          as ObtainIdentifierStream;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ObtainIdentifierStream create() => ObtainIdentifierStream._();
  @$core.override
  ObtainIdentifierStream createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ObtainIdentifierStream getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ObtainIdentifierStream>(create);
  static ObtainIdentifierStream? _defaultInstance;

  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  ObtainIdentifierStream_Value whichValue() =>
      _ObtainIdentifierStream_ValueByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  void clearValue() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  MaxiProtoStreamStatus get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(MaxiProtoStreamStatus value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$fixnum.Int64> get identifiers => $_getList(1);

  @$pb.TagNumber(3)
  ProtoOration get text => $_getN(2);
  @$pb.TagNumber(3)
  set text(ProtoOration value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasText() => $_has(2);
  @$pb.TagNumber(3)
  void clearText() => $_clearField(3);
  @$pb.TagNumber(3)
  ProtoOration ensureText() => $_ensure(2);

  @$pb.TagNumber(4)
  $0.Empty get completed => $_getN(3);
  @$pb.TagNumber(4)
  set completed($0.Empty value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasCompleted() => $_has(3);
  @$pb.TagNumber(4)
  void clearCompleted() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.Empty ensureCompleted() => $_ensure(3);

  @$pb.TagNumber(5)
  ProtoNegativeResult get error => $_getN(4);
  @$pb.TagNumber(5)
  set error(ProtoNegativeResult value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasError() => $_has(4);
  @$pb.TagNumber(5)
  void clearError() => $_clearField(5);
  @$pb.TagNumber(5)
  ProtoNegativeResult ensureError() => $_ensure(4);
}

enum ObtainNameStream_Value { text, completed, error, notSet }

class ObtainNameStream extends $pb.GeneratedMessage {
  factory ObtainNameStream({
    MaxiProtoStreamStatus? status,
    $core.Iterable<SelectByNameAndIdentifier>? names,
    ProtoOration? text,
    $0.Empty? completed,
    ProtoNegativeResult? error,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (names != null) result.names.addAll(names);
    if (text != null) result.text = text;
    if (completed != null) result.completed = completed;
    if (error != null) result.error = error;
    return result;
  }

  ObtainNameStream._();

  factory ObtainNameStream.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ObtainNameStream.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ObtainNameStream_Value>
      _ObtainNameStream_ValueByTag = {
    3: ObtainNameStream_Value.text,
    4: ObtainNameStream_Value.completed,
    5: ObtainNameStream_Value.error,
    0: ObtainNameStream_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ObtainNameStream',
      createEmptyInstance: create)
    ..oo(0, [3, 4, 5])
    ..aE<MaxiProtoStreamStatus>(1, _omitFieldNames ? '' : 'status',
        enumValues: MaxiProtoStreamStatus.values)
    ..pPM<SelectByNameAndIdentifier>(2, _omitFieldNames ? '' : 'names',
        subBuilder: SelectByNameAndIdentifier.create)
    ..aOM<ProtoOration>(3, _omitFieldNames ? '' : 'text',
        subBuilder: ProtoOration.create)
    ..aOM<$0.Empty>(4, _omitFieldNames ? '' : 'completed',
        subBuilder: $0.Empty.create)
    ..aOM<ProtoNegativeResult>(5, _omitFieldNames ? '' : 'error',
        subBuilder: ProtoNegativeResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ObtainNameStream clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ObtainNameStream copyWith(void Function(ObtainNameStream) updates) =>
      super.copyWith((message) => updates(message as ObtainNameStream))
          as ObtainNameStream;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ObtainNameStream create() => ObtainNameStream._();
  @$core.override
  ObtainNameStream createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ObtainNameStream getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ObtainNameStream>(create);
  static ObtainNameStream? _defaultInstance;

  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  ObtainNameStream_Value whichValue() =>
      _ObtainNameStream_ValueByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  void clearValue() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  MaxiProtoStreamStatus get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(MaxiProtoStreamStatus value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<SelectByNameAndIdentifier> get names => $_getList(1);

  @$pb.TagNumber(3)
  ProtoOration get text => $_getN(2);
  @$pb.TagNumber(3)
  set text(ProtoOration value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasText() => $_has(2);
  @$pb.TagNumber(3)
  void clearText() => $_clearField(3);
  @$pb.TagNumber(3)
  ProtoOration ensureText() => $_ensure(2);

  @$pb.TagNumber(4)
  $0.Empty get completed => $_getN(3);
  @$pb.TagNumber(4)
  set completed($0.Empty value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasCompleted() => $_has(3);
  @$pb.TagNumber(4)
  void clearCompleted() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.Empty ensureCompleted() => $_ensure(3);

  @$pb.TagNumber(5)
  ProtoNegativeResult get error => $_getN(4);
  @$pb.TagNumber(5)
  set error(ProtoNegativeResult value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasError() => $_has(4);
  @$pb.TagNumber(5)
  void clearError() => $_clearField(5);
  @$pb.TagNumber(5)
  ProtoNegativeResult ensureError() => $_ensure(4);
}

class ProtoAppStatus extends $pb.GeneratedMessage {
  factory ProtoAppStatus({
    $core.String? name,
    $core.double? version,
    $core.bool? isEnable,
    $core.bool? isInitialized_4,
    ProtoNegativeResult? lastInitError,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (version != null) result.version = version;
    if (isEnable != null) result.isEnable = isEnable;
    if (isInitialized_4 != null) result.isInitialized_4 = isInitialized_4;
    if (lastInitError != null) result.lastInitError = lastInitError;
    return result;
  }

  ProtoAppStatus._();

  factory ProtoAppStatus.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProtoAppStatus.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProtoAppStatus',
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aD(2, _omitFieldNames ? '' : 'version')
    ..aOB(3, _omitFieldNames ? '' : 'isEnable')
    ..aOB(4, _omitFieldNames ? '' : 'isInitialized')
    ..aOM<ProtoNegativeResult>(5, _omitFieldNames ? '' : 'lastInitError',
        subBuilder: ProtoNegativeResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoAppStatus clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProtoAppStatus copyWith(void Function(ProtoAppStatus) updates) =>
      super.copyWith((message) => updates(message as ProtoAppStatus))
          as ProtoAppStatus;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtoAppStatus create() => ProtoAppStatus._();
  @$core.override
  ProtoAppStatus createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ProtoAppStatus getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoAppStatus>(create);
  static ProtoAppStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get version => $_getN(1);
  @$pb.TagNumber(2)
  set version($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersion() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isEnable => $_getBF(2);
  @$pb.TagNumber(3)
  set isEnable($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsEnable() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsEnable() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isInitialized_4 => $_getBF(3);
  @$pb.TagNumber(4)
  set isInitialized_4($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIsInitialized_4() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsInitialized_4() => $_clearField(4);

  @$pb.TagNumber(5)
  ProtoNegativeResult get lastInitError => $_getN(4);
  @$pb.TagNumber(5)
  set lastInitError(ProtoNegativeResult value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasLastInitError() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastInitError() => $_clearField(5);
  @$pb.TagNumber(5)
  ProtoNegativeResult ensureLastInitError() => $_ensure(4);
}

class Maxi_proto {
  static final dartDecorator = $pb.Extension<ProtoDartDecorator>(
      _omitMessageNames ? '' : 'google.protobuf.FieldOptions',
      _omitFieldNames ? '' : 'dartDecorator',
      50001,
      $pb.PbFieldType.OM,
      defaultOrMaker: ProtoDartDecorator.getDefault,
      subBuilder: ProtoDartDecorator.create);
  static final dartField = $pb.Extension<ProtoDartField>(
      _omitMessageNames ? '' : 'google.protobuf.FieldOptions',
      _omitFieldNames ? '' : 'dartField',
      50002,
      $pb.PbFieldType.OM,
      defaultOrMaker: ProtoDartField.getDefault,
      subBuilder: ProtoDartField.create);
  static final dartClass = $pb.Extension<ProtoDartClass>(
      _omitMessageNames ? '' : 'google.protobuf.MessageOptions',
      _omitFieldNames ? '' : 'dartClass',
      51001,
      $pb.PbFieldType.OM,
      defaultOrMaker: ProtoDartClass.getDefault,
      subBuilder: ProtoDartClass.create);
  static final dartEnum = $pb.Extension<ProtoDartEnum>(
      _omitMessageNames ? '' : 'google.protobuf.EnumOptions',
      _omitFieldNames ? '' : 'dartEnum',
      52001,
      $pb.PbFieldType.OM,
      defaultOrMaker: ProtoDartEnum.getDefault,
      subBuilder: ProtoDartEnum.create);
  static final dartEnumValue = $pb.Extension<ProtoDartEnumValue>(
      _omitMessageNames ? '' : 'google.protobuf.EnumValueOptions',
      _omitFieldNames ? '' : 'dartEnumValue',
      53001,
      $pb.PbFieldType.OM,
      defaultOrMaker: ProtoDartEnumValue.getDefault,
      subBuilder: ProtoDartEnumValue.create);
  static void registerAllExtensions($pb.ExtensionRegistry registry) {
    registry.add(dartDecorator);
    registry.add(dartField);
    registry.add(dartClass);
    registry.add(dartEnum);
    registry.add(dartEnumValue);
  }
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
