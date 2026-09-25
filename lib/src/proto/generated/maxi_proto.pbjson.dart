// This is a generated file - do not edit.
//
// Generated from maxi_proto.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use maxiProtoStreamStatusDescriptor instead')
const MaxiProtoStreamStatus$json = {
  '1': 'MaxiProtoStreamStatus',
  '2': [
    {'1': 'MXRT_TEXT', '2': 0},
    {'1': 'MXRT_PARTIAL_CONTENT', '2': 1},
    {'1': 'MXRT_ERROR', '2': 2},
    {'1': 'MXRT_COMPLETED', '2': 3},
  ],
};

/// Descriptor for `MaxiProtoStreamStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List maxiProtoStreamStatusDescriptor = $convert.base64Decode(
    'ChVNYXhpUHJvdG9TdHJlYW1TdGF0dXMSDQoJTVhSVF9URVhUEAASGAoUTVhSVF9QQVJUSUFMX0'
    'NPTlRFTlQQARIOCgpNWFJUX0VSUk9SEAISEgoOTVhSVF9DT01QTEVURUQQAw==');

@$core.Deprecated('Use protoDartDecoratorDescriptor instead')
const ProtoDartDecorator$json = {
  '1': 'ProtoDartDecorator',
  '2': [
    {'1': 'dart_decorators', '3': 1, '4': 3, '5': 9, '10': 'dartDecorators'},
  ],
};

/// Descriptor for `ProtoDartDecorator`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protoDartDecoratorDescriptor = $convert.base64Decode(
    'ChJQcm90b0RhcnREZWNvcmF0b3ISJwoPZGFydF9kZWNvcmF0b3JzGAEgAygJUg5kYXJ0RGVjb3'
    'JhdG9ycw==');

@$core.Deprecated('Use protoDartClassDescriptor instead')
const ProtoDartClass$json = {
  '1': 'ProtoDartClass',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'dart_type', '3': 2, '4': 1, '5': 9, '10': 'dartType'},
    {
      '1': 'decorators',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.ProtoDartDecorator',
      '10': 'decorators'
    },
  ],
};

/// Descriptor for `ProtoDartClass`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protoDartClassDescriptor = $convert.base64Decode(
    'Cg5Qcm90b0RhcnRDbGFzcxISCgRuYW1lGAEgASgJUgRuYW1lEhsKCWRhcnRfdHlwZRgCIAEoCV'
    'IIZGFydFR5cGUSMwoKZGVjb3JhdG9ycxgDIAMoCzITLlByb3RvRGFydERlY29yYXRvclIKZGVj'
    'b3JhdG9ycw==');

@$core.Deprecated('Use protoDartFieldDescriptor instead')
const ProtoDartField$json = {
  '1': 'ProtoDartField',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'dart_type', '3': 2, '4': 1, '5': 9, '10': 'dartType'},
    {
      '1': 'decorators',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.ProtoDartDecorator',
      '10': 'decorators'
    },
  ],
};

/// Descriptor for `ProtoDartField`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protoDartFieldDescriptor = $convert.base64Decode(
    'Cg5Qcm90b0RhcnRGaWVsZBISCgRuYW1lGAEgASgJUgRuYW1lEhsKCWRhcnRfdHlwZRgCIAEoCV'
    'IIZGFydFR5cGUSMwoKZGVjb3JhdG9ycxgDIAMoCzITLlByb3RvRGFydERlY29yYXRvclIKZGVj'
    'b3JhdG9ycw==');

@$core.Deprecated('Use protoDartEnumDescriptor instead')
const ProtoDartEnum$json = {
  '1': 'ProtoDartEnum',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'prefix', '3': 2, '4': 1, '5': 9, '10': 'prefix'},
    {'1': 'dart_type', '3': 3, '4': 1, '5': 9, '10': 'dartType'},
    {
      '1': 'decorators',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.ProtoDartDecorator',
      '10': 'decorators'
    },
  ],
};

/// Descriptor for `ProtoDartEnum`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protoDartEnumDescriptor = $convert.base64Decode(
    'Cg1Qcm90b0RhcnRFbnVtEhIKBG5hbWUYASABKAlSBG5hbWUSFgoGcHJlZml4GAIgASgJUgZwcm'
    'VmaXgSGwoJZGFydF90eXBlGAMgASgJUghkYXJ0VHlwZRIzCgpkZWNvcmF0b3JzGAQgAygLMhMu'
    'UHJvdG9EYXJ0RGVjb3JhdG9yUgpkZWNvcmF0b3Jz');

@$core.Deprecated('Use protoDartEnumValueDescriptor instead')
const ProtoDartEnumValue$json = {
  '1': 'ProtoDartEnumValue',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'number', '3': 2, '4': 1, '5': 5, '10': 'number'},
    {
      '1': 'decorators',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.ProtoDartDecorator',
      '10': 'decorators'
    },
  ],
};

/// Descriptor for `ProtoDartEnumValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protoDartEnumValueDescriptor = $convert.base64Decode(
    'ChJQcm90b0RhcnRFbnVtVmFsdWUSEgoEbmFtZRgBIAEoCVIEbmFtZRIWCgZudW1iZXIYAiABKA'
    'VSBm51bWJlchIzCgpkZWNvcmF0b3JzGAMgAygLMhMuUHJvdG9EYXJ0RGVjb3JhdG9yUgpkZWNv'
    'cmF0b3Jz');

@$core.Deprecated('Use protoOrationDescriptor instead')
const ProtoOration$json = {
  '1': 'ProtoOration',
  '2': [
    {'1': 'token_id', '3': 1, '4': 1, '5': 9, '10': 'tokenId'},
    {'1': 'text', '3': 2, '4': 1, '5': 9, '10': 'text'},
    {'1': 'text_parts', '3': 3, '4': 3, '5': 9, '10': 'textParts'},
  ],
};

/// Descriptor for `ProtoOration`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protoOrationDescriptor = $convert.base64Decode(
    'CgxQcm90b09yYXRpb24SGQoIdG9rZW5faWQYASABKAlSB3Rva2VuSWQSEgoEdGV4dBgCIAEoCV'
    'IEdGV4dBIdCgp0ZXh0X3BhcnRzGAMgAygJUgl0ZXh0UGFydHM=');

@$core.Deprecated('Use protoNegativeResultDescriptor instead')
const ProtoNegativeResult$json = {
  '1': 'ProtoNegativeResult',
  '2': [
    {'1': 'error_code', '3': 1, '4': 1, '5': 5, '10': 'errorCode'},
    {
      '1': 'message',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.ProtoOration',
      '10': 'message'
    },
  ],
};

/// Descriptor for `ProtoNegativeResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protoNegativeResultDescriptor = $convert.base64Decode(
    'ChNQcm90b05lZ2F0aXZlUmVzdWx0Eh0KCmVycm9yX2NvZGUYASABKAVSCWVycm9yQ29kZRInCg'
    'dtZXNzYWdlGAIgASgLMg0uUHJvdG9PcmF0aW9uUgdtZXNzYWdl');

@$core.Deprecated('Use protoResultDescriptor instead')
const ProtoResult$json = {
  '1': 'ProtoResult',
  '2': [
    {'1': 'its_correct', '3': 1, '4': 1, '5': 8, '10': 'itsCorrect'},
    {
      '1': 'content',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Any',
      '9': 0,
      '10': 'content'
    },
    {
      '1': 'error',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.ProtoNegativeResult',
      '9': 0,
      '10': 'error'
    },
  ],
  '8': [
    {'1': 'value'},
  ],
};

/// Descriptor for `ProtoResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protoResultDescriptor = $convert.base64Decode(
    'CgtQcm90b1Jlc3VsdBIfCgtpdHNfY29ycmVjdBgBIAEoCFIKaXRzQ29ycmVjdBIwCgdjb250ZW'
    '50GAIgASgLMhQuZ29vZ2xlLnByb3RvYnVmLkFueUgAUgdjb250ZW50EiwKBWVycm9yGAMgASgL'
    'MhQuUHJvdG9OZWdhdGl2ZVJlc3VsdEgAUgVlcnJvckIHCgV2YWx1ZQ==');

@$core.Deprecated('Use protoVoidResultDescriptor instead')
const ProtoVoidResult$json = {
  '1': 'ProtoVoidResult',
  '2': [
    {'1': 'its_correct', '3': 1, '4': 1, '5': 8, '10': 'itsCorrect'},
    {
      '1': 'content',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Empty',
      '9': 0,
      '10': 'content'
    },
    {
      '1': 'error',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.ProtoNegativeResult',
      '9': 0,
      '10': 'error'
    },
  ],
  '8': [
    {'1': 'value'},
  ],
};

/// Descriptor for `ProtoVoidResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protoVoidResultDescriptor = $convert.base64Decode(
    'Cg9Qcm90b1ZvaWRSZXN1bHQSHwoLaXRzX2NvcnJlY3QYASABKAhSCml0c0NvcnJlY3QSMgoHY2'
    '9udGVudBgCIAEoCzIWLmdvb2dsZS5wcm90b2J1Zi5FbXB0eUgAUgdjb250ZW50EiwKBWVycm9y'
    'GAMgASgLMhQuUHJvdG9OZWdhdGl2ZVJlc3VsdEgAUgVlcnJvckIHCgV2YWx1ZQ==');

@$core.Deprecated('Use protoVoidStreamDescriptor instead')
const ProtoVoidStream$json = {
  '1': 'ProtoVoidStream',
  '2': [
    {
      '1': 'status',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.MaxiProtoStreamStatus',
      '10': 'status'
    },
    {
      '1': 'text',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.ProtoOration',
      '9': 0,
      '10': 'text'
    },
    {
      '1': 'completed',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Empty',
      '9': 0,
      '10': 'completed'
    },
    {
      '1': 'error',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.ProtoNegativeResult',
      '9': 0,
      '10': 'error'
    },
  ],
  '8': [
    {'1': 'value'},
  ],
};

/// Descriptor for `ProtoVoidStream`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protoVoidStreamDescriptor = $convert.base64Decode(
    'Cg9Qcm90b1ZvaWRTdHJlYW0SLgoGc3RhdHVzGAEgASgOMhYuTWF4aVByb3RvU3RyZWFtU3RhdH'
    'VzUgZzdGF0dXMSIwoEdGV4dBgCIAEoCzINLlByb3RvT3JhdGlvbkgAUgR0ZXh0EjYKCWNvbXBs'
    'ZXRlZBgDIAEoCzIWLmdvb2dsZS5wcm90b2J1Zi5FbXB0eUgAUgljb21wbGV0ZWQSLAoFZXJyb3'
    'IYBCABKAsyFC5Qcm90b05lZ2F0aXZlUmVzdWx0SABSBWVycm9yQgcKBXZhbHVl');

@$core.Deprecated('Use protoJsonResultDescriptor instead')
const ProtoJsonResult$json = {
  '1': 'ProtoJsonResult',
  '2': [
    {'1': 'its_correct', '3': 1, '4': 1, '5': 8, '10': 'itsCorrect'},
    {'1': 'content', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'content'},
    {
      '1': 'error',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.ProtoNegativeResult',
      '9': 0,
      '10': 'error'
    },
  ],
  '8': [
    {'1': 'value'},
  ],
};

/// Descriptor for `ProtoJsonResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protoJsonResultDescriptor = $convert.base64Decode(
    'Cg9Qcm90b0pzb25SZXN1bHQSHwoLaXRzX2NvcnJlY3QYASABKAhSCml0c0NvcnJlY3QSGgoHY2'
    '9udGVudBgCIAEoCUgAUgdjb250ZW50EiwKBWVycm9yGAMgASgLMhQuUHJvdG9OZWdhdGl2ZVJl'
    'c3VsdEgAUgVlcnJvckIHCgV2YWx1ZQ==');

@$core.Deprecated('Use protoJsonStreamDescriptor instead')
const ProtoJsonStream$json = {
  '1': 'ProtoJsonStream',
  '2': [
    {
      '1': 'status',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.MaxiProtoStreamStatus',
      '10': 'status'
    },
    {
      '1': 'text',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.ProtoOration',
      '9': 0,
      '10': 'text'
    },
    {'1': 'completed', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'completed'},
    {
      '1': 'error',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.ProtoNegativeResult',
      '9': 0,
      '10': 'error'
    },
  ],
  '8': [
    {'1': 'value'},
  ],
};

/// Descriptor for `ProtoJsonStream`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protoJsonStreamDescriptor = $convert.base64Decode(
    'Cg9Qcm90b0pzb25TdHJlYW0SLgoGc3RhdHVzGAEgASgOMhYuTWF4aVByb3RvU3RyZWFtU3RhdH'
    'VzUgZzdGF0dXMSIwoEdGV4dBgCIAEoCzINLlByb3RvT3JhdGlvbkgAUgR0ZXh0Eh4KCWNvbXBs'
    'ZXRlZBgDIAEoCUgAUgljb21wbGV0ZWQSLAoFZXJyb3IYBCABKAsyFC5Qcm90b05lZ2F0aXZlUm'
    'VzdWx0SABSBWVycm9yQgcKBXZhbHVl');

@$core.Deprecated('Use emptyRequestDescriptor instead')
const EmptyRequest$json = {
  '1': 'EmptyRequest',
};

/// Descriptor for `EmptyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyRequestDescriptor =
    $convert.base64Decode('CgxFbXB0eVJlcXVlc3Q=');

@$core.Deprecated('Use protoJsonRequestDescriptor instead')
const ProtoJsonRequest$json = {
  '1': 'ProtoJsonRequest',
  '2': [
    {'1': 'identifier', '3': 1, '4': 1, '5': 4, '10': 'identifier'},
    {'1': 'json', '3': 2, '4': 1, '5': 9, '10': 'json'},
  ],
};

/// Descriptor for `ProtoJsonRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protoJsonRequestDescriptor = $convert.base64Decode(
    'ChBQcm90b0pzb25SZXF1ZXN0Eh4KCmlkZW50aWZpZXIYASABKARSCmlkZW50aWZpZXISEgoEan'
    'NvbhgCIAEoCVIEanNvbg==');

@$core.Deprecated('Use selectedFromDescriptor instead')
const SelectedFrom$json = {
  '1': 'SelectedFrom',
  '2': [
    {'1': 'from', '3': 1, '4': 1, '5': 4, '10': 'from'},
    {'1': 'amount', '3': 2, '4': 1, '5': 13, '10': 'amount'},
    {'1': 'filter', '3': 3, '4': 1, '5': 9, '10': 'filter'},
    {'1': 'ascending', '3': 4, '4': 1, '5': 8, '10': 'ascending'},
  ],
};

/// Descriptor for `SelectedFrom`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List selectedFromDescriptor = $convert.base64Decode(
    'CgxTZWxlY3RlZEZyb20SEgoEZnJvbRgBIAEoBFIEZnJvbRIWCgZhbW91bnQYAiABKA1SBmFtb3'
    'VudBIWCgZmaWx0ZXIYAyABKAlSBmZpbHRlchIcCglhc2NlbmRpbmcYBCABKAhSCWFzY2VuZGlu'
    'Zw==');

@$core.Deprecated('Use selectMultipleIdentifiersDescriptor instead')
const SelectMultipleIdentifiers$json = {
  '1': 'SelectMultipleIdentifiers',
  '2': [
    {'1': 'selected_ids', '3': 1, '4': 3, '5': 4, '10': 'selectedIds'},
  ],
};

/// Descriptor for `SelectMultipleIdentifiers`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List selectMultipleIdentifiersDescriptor =
    $convert.base64Decode(
        'ChlTZWxlY3RNdWx0aXBsZUlkZW50aWZpZXJzEiEKDHNlbGVjdGVkX2lkcxgBIAMoBFILc2VsZW'
        'N0ZWRJZHM=');

@$core.Deprecated('Use selectedIdentifierRequestDescriptor instead')
const SelectedIdentifierRequest$json = {
  '1': 'SelectedIdentifierRequest',
  '2': [
    {'1': 'identifier', '3': 1, '4': 1, '5': 4, '10': 'identifier'},
  ],
};

/// Descriptor for `SelectedIdentifierRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List selectedIdentifierRequestDescriptor =
    $convert.base64Decode(
        'ChlTZWxlY3RlZElkZW50aWZpZXJSZXF1ZXN0Eh4KCmlkZW50aWZpZXIYASABKARSCmlkZW50aW'
        'ZpZXI=');

@$core.Deprecated('Use selectByNameDescriptor instead')
const SelectByName$json = {
  '1': 'SelectByName',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `SelectByName`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List selectByNameDescriptor =
    $convert.base64Decode('CgxTZWxlY3RCeU5hbWUSEgoEbmFtZRgBIAEoCVIEbmFtZQ==');

@$core.Deprecated('Use selectByNameAndIdentifierDescriptor instead')
const SelectByNameAndIdentifier$json = {
  '1': 'SelectByNameAndIdentifier',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'identifier', '3': 2, '4': 1, '5': 4, '10': 'identifier'},
  ],
};

/// Descriptor for `SelectByNameAndIdentifier`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List selectByNameAndIdentifierDescriptor =
    $convert.base64Decode(
        'ChlTZWxlY3RCeU5hbWVBbmRJZGVudGlmaWVyEhIKBG5hbWUYASABKAlSBG5hbWUSHgoKaWRlbn'
        'RpZmllchgCIAEoBFIKaWRlbnRpZmllcg==');

@$core.Deprecated('Use obtainIdentifierStreamDescriptor instead')
const ObtainIdentifierStream$json = {
  '1': 'ObtainIdentifierStream',
  '2': [
    {
      '1': 'status',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.MaxiProtoStreamStatus',
      '10': 'status'
    },
    {'1': 'identifiers', '3': 2, '4': 3, '5': 4, '10': 'identifiers'},
    {
      '1': 'text',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.ProtoOration',
      '9': 0,
      '10': 'text'
    },
    {
      '1': 'completed',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Empty',
      '9': 0,
      '10': 'completed'
    },
    {
      '1': 'error',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.ProtoNegativeResult',
      '9': 0,
      '10': 'error'
    },
  ],
  '8': [
    {'1': 'value'},
  ],
};

/// Descriptor for `ObtainIdentifierStream`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List obtainIdentifierStreamDescriptor = $convert.base64Decode(
    'ChZPYnRhaW5JZGVudGlmaWVyU3RyZWFtEi4KBnN0YXR1cxgBIAEoDjIWLk1heGlQcm90b1N0cm'
    'VhbVN0YXR1c1IGc3RhdHVzEiAKC2lkZW50aWZpZXJzGAIgAygEUgtpZGVudGlmaWVycxIjCgR0'
    'ZXh0GAMgASgLMg0uUHJvdG9PcmF0aW9uSABSBHRleHQSNgoJY29tcGxldGVkGAQgASgLMhYuZ2'
    '9vZ2xlLnByb3RvYnVmLkVtcHR5SABSCWNvbXBsZXRlZBIsCgVlcnJvchgFIAEoCzIULlByb3Rv'
    'TmVnYXRpdmVSZXN1bHRIAFIFZXJyb3JCBwoFdmFsdWU=');

@$core.Deprecated('Use obtainNameStreamDescriptor instead')
const ObtainNameStream$json = {
  '1': 'ObtainNameStream',
  '2': [
    {
      '1': 'status',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.MaxiProtoStreamStatus',
      '10': 'status'
    },
    {
      '1': 'names',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.SelectByNameAndIdentifier',
      '10': 'names'
    },
    {
      '1': 'text',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.ProtoOration',
      '9': 0,
      '10': 'text'
    },
    {
      '1': 'completed',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Empty',
      '9': 0,
      '10': 'completed'
    },
    {
      '1': 'error',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.ProtoNegativeResult',
      '9': 0,
      '10': 'error'
    },
  ],
  '8': [
    {'1': 'value'},
  ],
};

/// Descriptor for `ObtainNameStream`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List obtainNameStreamDescriptor = $convert.base64Decode(
    'ChBPYnRhaW5OYW1lU3RyZWFtEi4KBnN0YXR1cxgBIAEoDjIWLk1heGlQcm90b1N0cmVhbVN0YX'
    'R1c1IGc3RhdHVzEjAKBW5hbWVzGAIgAygLMhouU2VsZWN0QnlOYW1lQW5kSWRlbnRpZmllclIF'
    'bmFtZXMSIwoEdGV4dBgDIAEoCzINLlByb3RvT3JhdGlvbkgAUgR0ZXh0EjYKCWNvbXBsZXRlZB'
    'gEIAEoCzIWLmdvb2dsZS5wcm90b2J1Zi5FbXB0eUgAUgljb21wbGV0ZWQSLAoFZXJyb3IYBSAB'
    'KAsyFC5Qcm90b05lZ2F0aXZlUmVzdWx0SABSBWVycm9yQgcKBXZhbHVl');

@$core.Deprecated('Use protoAppStatusDescriptor instead')
const ProtoAppStatus$json = {
  '1': 'ProtoAppStatus',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'version', '3': 2, '4': 1, '5': 1, '10': 'version'},
    {'1': 'is_enable', '3': 3, '4': 1, '5': 8, '10': 'isEnable'},
    {'1': 'is_initialized', '3': 4, '4': 1, '5': 8, '10': 'isInitialized'},
    {
      '1': 'last_init_error',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.ProtoNegativeResult',
      '10': 'lastInitError'
    },
  ],
};

/// Descriptor for `ProtoAppStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protoAppStatusDescriptor = $convert.base64Decode(
    'Cg5Qcm90b0FwcFN0YXR1cxISCgRuYW1lGAEgASgJUgRuYW1lEhgKB3ZlcnNpb24YAiABKAFSB3'
    'ZlcnNpb24SGwoJaXNfZW5hYmxlGAMgASgIUghpc0VuYWJsZRIlCg5pc19pbml0aWFsaXplZBgE'
    'IAEoCFINaXNJbml0aWFsaXplZBI8Cg9sYXN0X2luaXRfZXJyb3IYBSABKAsyFC5Qcm90b05lZ2'
    'F0aXZlUmVzdWx0Ug1sYXN0SW5pdEVycm9y');
