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

import 'package:protobuf/protobuf.dart' as $pb;

class MaxiProtoStreamStatus extends $pb.ProtobufEnum {
  static const MaxiProtoStreamStatus MXRT_TEXT =
      MaxiProtoStreamStatus._(0, _omitEnumNames ? '' : 'MXRT_TEXT');
  static const MaxiProtoStreamStatus MXRT_PARTIAL_CONTENT =
      MaxiProtoStreamStatus._(1, _omitEnumNames ? '' : 'MXRT_PARTIAL_CONTENT');
  static const MaxiProtoStreamStatus MXRT_ERROR =
      MaxiProtoStreamStatus._(2, _omitEnumNames ? '' : 'MXRT_ERROR');
  static const MaxiProtoStreamStatus MXRT_COMPLETED =
      MaxiProtoStreamStatus._(3, _omitEnumNames ? '' : 'MXRT_COMPLETED');

  static const $core.List<MaxiProtoStreamStatus> values =
      <MaxiProtoStreamStatus>[
    MXRT_TEXT,
    MXRT_PARTIAL_CONTENT,
    MXRT_ERROR,
    MXRT_COMPLETED,
  ];

  static final $core.List<MaxiProtoStreamStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static MaxiProtoStreamStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const MaxiProtoStreamStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
