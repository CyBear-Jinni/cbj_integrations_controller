///
//  Generated code. Do not modify.
//  source: cbj_smart_device_server.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'cbj_smart_device_server.pbenum.dart';

export 'cbj_smart_device_server.pbenum.dart';

class CbjClientStatusRequests extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjClientStatusRequests', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjSmartDeviceConnections'), createEmptyInstance: create)
    ..aOM<CbjAllRemoteCommands>(41, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'allRemoteCommands', protoName: 'allRemoteCommands', subBuilder: CbjAllRemoteCommands.create)
    ..hasRequiredFields = false
  ;

  CbjClientStatusRequests._() : super();
  factory CbjClientStatusRequests({
    CbjAllRemoteCommands? allRemoteCommands,
  }) {
    final _result = create();
    if (allRemoteCommands != null) {
      _result.allRemoteCommands = allRemoteCommands;
    }
    return _result;
  }
  factory CbjClientStatusRequests.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CbjClientStatusRequests.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CbjClientStatusRequests clone() => CbjClientStatusRequests()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CbjClientStatusRequests copyWith(void Function(CbjClientStatusRequests) updates) => super.copyWith((message) => updates(message as CbjClientStatusRequests)) as CbjClientStatusRequests; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CbjClientStatusRequests create() => CbjClientStatusRequests._();
  CbjClientStatusRequests createEmptyInstance() => create();
  static $pb.PbList<CbjClientStatusRequests> createRepeated() => $pb.PbList<CbjClientStatusRequests>();
  @$core.pragma('dart2js:noInline')
  static CbjClientStatusRequests getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CbjClientStatusRequests>(create);
  static CbjClientStatusRequests? _defaultInstance;

  @$pb.TagNumber(41)
  CbjAllRemoteCommands get allRemoteCommands => $_getN(0);
  @$pb.TagNumber(41)
  set allRemoteCommands(CbjAllRemoteCommands v) { setField(41, v); }
  @$pb.TagNumber(41)
  $core.bool hasAllRemoteCommands() => $_has(0);
  @$pb.TagNumber(41)
  void clearAllRemoteCommands() => clearField(41);
  @$pb.TagNumber(41)
  CbjAllRemoteCommands ensureAllRemoteCommands() => $_ensure(0);
}

class CbjRequestsAndStatusFromHub extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjRequestsAndStatusFromHub', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjSmartDeviceConnections'), createEmptyInstance: create)
    ..aOM<CbjAllRemoteCommands>(42, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'allRemoteCommands', protoName: 'allRemoteCommands', subBuilder: CbjAllRemoteCommands.create)
    ..hasRequiredFields = false
  ;

  CbjRequestsAndStatusFromHub._() : super();
  factory CbjRequestsAndStatusFromHub({
    CbjAllRemoteCommands? allRemoteCommands,
  }) {
    final _result = create();
    if (allRemoteCommands != null) {
      _result.allRemoteCommands = allRemoteCommands;
    }
    return _result;
  }
  factory CbjRequestsAndStatusFromHub.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CbjRequestsAndStatusFromHub.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CbjRequestsAndStatusFromHub clone() => CbjRequestsAndStatusFromHub()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CbjRequestsAndStatusFromHub copyWith(void Function(CbjRequestsAndStatusFromHub) updates) => super.copyWith((message) => updates(message as CbjRequestsAndStatusFromHub)) as CbjRequestsAndStatusFromHub; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CbjRequestsAndStatusFromHub create() => CbjRequestsAndStatusFromHub._();
  CbjRequestsAndStatusFromHub createEmptyInstance() => create();
  static $pb.PbList<CbjRequestsAndStatusFromHub> createRepeated() => $pb.PbList<CbjRequestsAndStatusFromHub>();
  @$core.pragma('dart2js:noInline')
  static CbjRequestsAndStatusFromHub getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CbjRequestsAndStatusFromHub>(create);
  static CbjRequestsAndStatusFromHub? _defaultInstance;

  @$pb.TagNumber(42)
  CbjAllRemoteCommands get allRemoteCommands => $_getN(0);
  @$pb.TagNumber(42)
  set allRemoteCommands(CbjAllRemoteCommands v) { setField(42, v); }
  @$pb.TagNumber(42)
  $core.bool hasAllRemoteCommands() => $_has(0);
  @$pb.TagNumber(42)
  void clearAllRemoteCommands() => clearField(42);
  @$pb.TagNumber(42)
  CbjAllRemoteCommands ensureAllRemoteCommands() => $_ensure(0);
}

class CbjAllRemoteCommands extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjAllRemoteCommands', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjSmartDeviceConnections'), createEmptyInstance: create)
    ..aOM<CbjSmartDeviceInfo>(40, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'smartDeviceInfo', protoName: 'smartDeviceInfo', subBuilder: CbjSmartDeviceInfo.create)
    ..hasRequiredFields = false
  ;

  CbjAllRemoteCommands._() : super();
  factory CbjAllRemoteCommands({
    CbjSmartDeviceInfo? smartDeviceInfo,
  }) {
    final _result = create();
    if (smartDeviceInfo != null) {
      _result.smartDeviceInfo = smartDeviceInfo;
    }
    return _result;
  }
  factory CbjAllRemoteCommands.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CbjAllRemoteCommands.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CbjAllRemoteCommands clone() => CbjAllRemoteCommands()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CbjAllRemoteCommands copyWith(void Function(CbjAllRemoteCommands) updates) => super.copyWith((message) => updates(message as CbjAllRemoteCommands)) as CbjAllRemoteCommands; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CbjAllRemoteCommands create() => CbjAllRemoteCommands._();
  CbjAllRemoteCommands createEmptyInstance() => create();
  static $pb.PbList<CbjAllRemoteCommands> createRepeated() => $pb.PbList<CbjAllRemoteCommands>();
  @$core.pragma('dart2js:noInline')
  static CbjAllRemoteCommands getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CbjAllRemoteCommands>(create);
  static CbjAllRemoteCommands? _defaultInstance;

  @$pb.TagNumber(40)
  CbjSmartDeviceInfo get smartDeviceInfo => $_getN(0);
  @$pb.TagNumber(40)
  set smartDeviceInfo(CbjSmartDeviceInfo v) { setField(40, v); }
  @$pb.TagNumber(40)
  $core.bool hasSmartDeviceInfo() => $_has(0);
  @$pb.TagNumber(40)
  void clearSmartDeviceInfo() => clearField(40);
  @$pb.TagNumber(40)
  CbjSmartDeviceInfo ensureSmartDeviceInfo() => $_ensure(0);
}

class CbjFirstSetupMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjFirstSetupMessage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjSmartDeviceConnections'), createEmptyInstance: create)
    ..aOM<CbjCompSmartDeviceInfo>(38, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compInfo', protoName: 'compInfo', subBuilder: CbjCompSmartDeviceInfo.create)
    ..aOM<CbjFirebaseAccountInformation>(39, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firebaseAccountInformation', protoName: 'firebaseAccountInformation', subBuilder: CbjFirebaseAccountInformation.create)
    ..hasRequiredFields = false
  ;

  CbjFirstSetupMessage._() : super();
  factory CbjFirstSetupMessage({
    CbjCompSmartDeviceInfo? compInfo,
    CbjFirebaseAccountInformation? firebaseAccountInformation,
  }) {
    final _result = create();
    if (compInfo != null) {
      _result.compInfo = compInfo;
    }
    if (firebaseAccountInformation != null) {
      _result.firebaseAccountInformation = firebaseAccountInformation;
    }
    return _result;
  }
  factory CbjFirstSetupMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CbjFirstSetupMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CbjFirstSetupMessage clone() => CbjFirstSetupMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CbjFirstSetupMessage copyWith(void Function(CbjFirstSetupMessage) updates) => super.copyWith((message) => updates(message as CbjFirstSetupMessage)) as CbjFirstSetupMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CbjFirstSetupMessage create() => CbjFirstSetupMessage._();
  CbjFirstSetupMessage createEmptyInstance() => create();
  static $pb.PbList<CbjFirstSetupMessage> createRepeated() => $pb.PbList<CbjFirstSetupMessage>();
  @$core.pragma('dart2js:noInline')
  static CbjFirstSetupMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CbjFirstSetupMessage>(create);
  static CbjFirstSetupMessage? _defaultInstance;

  @$pb.TagNumber(38)
  CbjCompSmartDeviceInfo get compInfo => $_getN(0);
  @$pb.TagNumber(38)
  set compInfo(CbjCompSmartDeviceInfo v) { setField(38, v); }
  @$pb.TagNumber(38)
  $core.bool hasCompInfo() => $_has(0);
  @$pb.TagNumber(38)
  void clearCompInfo() => clearField(38);
  @$pb.TagNumber(38)
  CbjCompSmartDeviceInfo ensureCompInfo() => $_ensure(0);

  @$pb.TagNumber(39)
  CbjFirebaseAccountInformation get firebaseAccountInformation => $_getN(1);
  @$pb.TagNumber(39)
  set firebaseAccountInformation(CbjFirebaseAccountInformation v) { setField(39, v); }
  @$pb.TagNumber(39)
  $core.bool hasFirebaseAccountInformation() => $_has(1);
  @$pb.TagNumber(39)
  void clearFirebaseAccountInformation() => clearField(39);
  @$pb.TagNumber(39)
  CbjFirebaseAccountInformation ensureFirebaseAccountInformation() => $_ensure(1);
}

class CbjCompSmartDeviceInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjCompSmartDeviceInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjSmartDeviceConnections'), createEmptyInstance: create)
    ..aOM<CbjCompSpecs>(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compSpecs', protoName: 'compSpecs', subBuilder: CbjCompSpecs.create)
    ..pc<CbjSmartDeviceInfo>(28, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'smartDevicesInComp', $pb.PbFieldType.PM, protoName: 'smartDevicesInComp', subBuilder: CbjSmartDeviceInfo.create)
    ..hasRequiredFields = false
  ;

  CbjCompSmartDeviceInfo._() : super();
  factory CbjCompSmartDeviceInfo({
    CbjCompSpecs? compSpecs,
    $core.Iterable<CbjSmartDeviceInfo>? smartDevicesInComp,
  }) {
    final _result = create();
    if (compSpecs != null) {
      _result.compSpecs = compSpecs;
    }
    if (smartDevicesInComp != null) {
      _result.smartDevicesInComp.addAll(smartDevicesInComp);
    }
    return _result;
  }
  factory CbjCompSmartDeviceInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CbjCompSmartDeviceInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CbjCompSmartDeviceInfo clone() => CbjCompSmartDeviceInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CbjCompSmartDeviceInfo copyWith(void Function(CbjCompSmartDeviceInfo) updates) => super.copyWith((message) => updates(message as CbjCompSmartDeviceInfo)) as CbjCompSmartDeviceInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CbjCompSmartDeviceInfo create() => CbjCompSmartDeviceInfo._();
  CbjCompSmartDeviceInfo createEmptyInstance() => create();
  static $pb.PbList<CbjCompSmartDeviceInfo> createRepeated() => $pb.PbList<CbjCompSmartDeviceInfo>();
  @$core.pragma('dart2js:noInline')
  static CbjCompSmartDeviceInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CbjCompSmartDeviceInfo>(create);
  static CbjCompSmartDeviceInfo? _defaultInstance;

  @$pb.TagNumber(21)
  CbjCompSpecs get compSpecs => $_getN(0);
  @$pb.TagNumber(21)
  set compSpecs(CbjCompSpecs v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasCompSpecs() => $_has(0);
  @$pb.TagNumber(21)
  void clearCompSpecs() => clearField(21);
  @$pb.TagNumber(21)
  CbjCompSpecs ensureCompSpecs() => $_ensure(0);

  @$pb.TagNumber(28)
  $core.List<CbjSmartDeviceInfo> get smartDevicesInComp => $_getList(1);
}

class CbjCompSpecs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjCompSpecs', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjSmartDeviceConnections'), createEmptyInstance: create)
    ..aOS(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compId', protoName: 'compId')
    ..aOS(23, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compUuid', protoName: 'compUuid')
    ..aOS(24, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compOs', protoName: 'compOs')
    ..aOS(25, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compModel', protoName: 'compModel')
    ..aOS(26, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compType', protoName: 'compType')
    ..aOS(27, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pubspecYamlVersion', protoName: 'pubspecYamlVersion')
    ..hasRequiredFields = false
  ;

  CbjCompSpecs._() : super();
  factory CbjCompSpecs({
    $core.String? compId,
    $core.String? compUuid,
    $core.String? compOs,
    $core.String? compModel,
    $core.String? compType,
    $core.String? pubspecYamlVersion,
  }) {
    final _result = create();
    if (compId != null) {
      _result.compId = compId;
    }
    if (compUuid != null) {
      _result.compUuid = compUuid;
    }
    if (compOs != null) {
      _result.compOs = compOs;
    }
    if (compModel != null) {
      _result.compModel = compModel;
    }
    if (compType != null) {
      _result.compType = compType;
    }
    if (pubspecYamlVersion != null) {
      _result.pubspecYamlVersion = pubspecYamlVersion;
    }
    return _result;
  }
  factory CbjCompSpecs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CbjCompSpecs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CbjCompSpecs clone() => CbjCompSpecs()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CbjCompSpecs copyWith(void Function(CbjCompSpecs) updates) => super.copyWith((message) => updates(message as CbjCompSpecs)) as CbjCompSpecs; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CbjCompSpecs create() => CbjCompSpecs._();
  CbjCompSpecs createEmptyInstance() => create();
  static $pb.PbList<CbjCompSpecs> createRepeated() => $pb.PbList<CbjCompSpecs>();
  @$core.pragma('dart2js:noInline')
  static CbjCompSpecs getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CbjCompSpecs>(create);
  static CbjCompSpecs? _defaultInstance;

  @$pb.TagNumber(22)
  $core.String get compId => $_getSZ(0);
  @$pb.TagNumber(22)
  set compId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(22)
  $core.bool hasCompId() => $_has(0);
  @$pb.TagNumber(22)
  void clearCompId() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get compUuid => $_getSZ(1);
  @$pb.TagNumber(23)
  set compUuid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(23)
  $core.bool hasCompUuid() => $_has(1);
  @$pb.TagNumber(23)
  void clearCompUuid() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get compOs => $_getSZ(2);
  @$pb.TagNumber(24)
  set compOs($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(24)
  $core.bool hasCompOs() => $_has(2);
  @$pb.TagNumber(24)
  void clearCompOs() => clearField(24);

  @$pb.TagNumber(25)
  $core.String get compModel => $_getSZ(3);
  @$pb.TagNumber(25)
  set compModel($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(25)
  $core.bool hasCompModel() => $_has(3);
  @$pb.TagNumber(25)
  void clearCompModel() => clearField(25);

  @$pb.TagNumber(26)
  $core.String get compType => $_getSZ(4);
  @$pb.TagNumber(26)
  set compType($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(26)
  $core.bool hasCompType() => $_has(4);
  @$pb.TagNumber(26)
  void clearCompType() => clearField(26);

  @$pb.TagNumber(27)
  $core.String get pubspecYamlVersion => $_getSZ(5);
  @$pb.TagNumber(27)
  set pubspecYamlVersion($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(27)
  $core.bool hasPubspecYamlVersion() => $_has(5);
  @$pb.TagNumber(27)
  void clearPubspecYamlVersion() => clearField(27);
}

class CbjMicrocontrollerSpecs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjMicrocontrollerSpecs', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjSmartDeviceConnections'), createEmptyInstance: create)
    ..aOS(31, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'microcontrollerModel', protoName: 'microcontrollerModel')
    ..aOS(32, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'microcontrollerType', protoName: 'microcontrollerType')
    ..aOS(33, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'softwareVersion', protoName: 'softwareVersion')
    ..hasRequiredFields = false
  ;

  CbjMicrocontrollerSpecs._() : super();
  factory CbjMicrocontrollerSpecs({
    $core.String? microcontrollerModel,
    $core.String? microcontrollerType,
    $core.String? softwareVersion,
  }) {
    final _result = create();
    if (microcontrollerModel != null) {
      _result.microcontrollerModel = microcontrollerModel;
    }
    if (microcontrollerType != null) {
      _result.microcontrollerType = microcontrollerType;
    }
    if (softwareVersion != null) {
      _result.softwareVersion = softwareVersion;
    }
    return _result;
  }
  factory CbjMicrocontrollerSpecs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CbjMicrocontrollerSpecs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CbjMicrocontrollerSpecs clone() => CbjMicrocontrollerSpecs()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CbjMicrocontrollerSpecs copyWith(void Function(CbjMicrocontrollerSpecs) updates) => super.copyWith((message) => updates(message as CbjMicrocontrollerSpecs)) as CbjMicrocontrollerSpecs; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CbjMicrocontrollerSpecs create() => CbjMicrocontrollerSpecs._();
  CbjMicrocontrollerSpecs createEmptyInstance() => create();
  static $pb.PbList<CbjMicrocontrollerSpecs> createRepeated() => $pb.PbList<CbjMicrocontrollerSpecs>();
  @$core.pragma('dart2js:noInline')
  static CbjMicrocontrollerSpecs getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CbjMicrocontrollerSpecs>(create);
  static CbjMicrocontrollerSpecs? _defaultInstance;

  @$pb.TagNumber(31)
  $core.String get microcontrollerModel => $_getSZ(0);
  @$pb.TagNumber(31)
  set microcontrollerModel($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(31)
  $core.bool hasMicrocontrollerModel() => $_has(0);
  @$pb.TagNumber(31)
  void clearMicrocontrollerModel() => clearField(31);

  @$pb.TagNumber(32)
  $core.String get microcontrollerType => $_getSZ(1);
  @$pb.TagNumber(32)
  set microcontrollerType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(32)
  $core.bool hasMicrocontrollerType() => $_has(1);
  @$pb.TagNumber(32)
  void clearMicrocontrollerType() => clearField(32);

  @$pb.TagNumber(33)
  $core.String get softwareVersion => $_getSZ(2);
  @$pb.TagNumber(33)
  set softwareVersion($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(33)
  $core.bool hasSoftwareVersion() => $_has(2);
  @$pb.TagNumber(33)
  void clearSoftwareVersion() => clearField(33);
}

class CbjSmartDeviceInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjSmartDeviceInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjSmartDeviceConnections'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state')
    ..aOS(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'defaultName', protoName: 'defaultName')
    ..aOS(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'roomId', protoName: 'roomId')
    ..aOS(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'senderDeviceModel', protoName: 'senderDeviceModel')
    ..aOS(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'senderDeviceOs', protoName: 'senderDeviceOs')
    ..aOS(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'senderId', protoName: 'senderId')
    ..aOS(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'serverTimeStamp', protoName: 'serverTimeStamp')
    ..aOS(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stateMassage', protoName: 'stateMassage')
    ..aOB(29, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isComputer', protoName: 'isComputer')
    ..aOM<CbjCompSpecs>(30, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compSpecs', protoName: 'compSpecs', subBuilder: CbjCompSpecs.create)
    ..aOM<CbjMicrocontrollerSpecs>(31, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'microcontrollerSpecsSpecs', protoName: 'microcontrollerSpecsSpecs', subBuilder: CbjMicrocontrollerSpecs.create)
    ..aOM<CbjDeviceTypesActions>(34, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceTypesActions', protoName: 'deviceTypesActions', subBuilder: CbjDeviceTypesActions.create)
    ..hasRequiredFields = false
  ;

  CbjSmartDeviceInfo._() : super();
  factory CbjSmartDeviceInfo({
    $core.String? id,
    $core.String? state,
    $core.String? defaultName,
    $core.String? roomId,
    $core.String? senderDeviceModel,
    $core.String? senderDeviceOs,
    $core.String? senderId,
    $core.String? serverTimeStamp,
    $core.String? stateMassage,
    $core.bool? isComputer,
    CbjCompSpecs? compSpecs,
    CbjMicrocontrollerSpecs? microcontrollerSpecsSpecs,
    CbjDeviceTypesActions? deviceTypesActions,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (state != null) {
      _result.state = state;
    }
    if (defaultName != null) {
      _result.defaultName = defaultName;
    }
    if (roomId != null) {
      _result.roomId = roomId;
    }
    if (senderDeviceModel != null) {
      _result.senderDeviceModel = senderDeviceModel;
    }
    if (senderDeviceOs != null) {
      _result.senderDeviceOs = senderDeviceOs;
    }
    if (senderId != null) {
      _result.senderId = senderId;
    }
    if (serverTimeStamp != null) {
      _result.serverTimeStamp = serverTimeStamp;
    }
    if (stateMassage != null) {
      _result.stateMassage = stateMassage;
    }
    if (isComputer != null) {
      _result.isComputer = isComputer;
    }
    if (compSpecs != null) {
      _result.compSpecs = compSpecs;
    }
    if (microcontrollerSpecsSpecs != null) {
      _result.microcontrollerSpecsSpecs = microcontrollerSpecsSpecs;
    }
    if (deviceTypesActions != null) {
      _result.deviceTypesActions = deviceTypesActions;
    }
    return _result;
  }
  factory CbjSmartDeviceInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CbjSmartDeviceInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CbjSmartDeviceInfo clone() => CbjSmartDeviceInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CbjSmartDeviceInfo copyWith(void Function(CbjSmartDeviceInfo) updates) => super.copyWith((message) => updates(message as CbjSmartDeviceInfo)) as CbjSmartDeviceInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CbjSmartDeviceInfo create() => CbjSmartDeviceInfo._();
  CbjSmartDeviceInfo createEmptyInstance() => create();
  static $pb.PbList<CbjSmartDeviceInfo> createRepeated() => $pb.PbList<CbjSmartDeviceInfo>();
  @$core.pragma('dart2js:noInline')
  static CbjSmartDeviceInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CbjSmartDeviceInfo>(create);
  static CbjSmartDeviceInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get state => $_getSZ(1);
  @$pb.TagNumber(3)
  set state($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(3)
  void clearState() => clearField(3);

  @$pb.TagNumber(14)
  $core.String get defaultName => $_getSZ(2);
  @$pb.TagNumber(14)
  set defaultName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(14)
  $core.bool hasDefaultName() => $_has(2);
  @$pb.TagNumber(14)
  void clearDefaultName() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get roomId => $_getSZ(3);
  @$pb.TagNumber(15)
  set roomId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(15)
  $core.bool hasRoomId() => $_has(3);
  @$pb.TagNumber(15)
  void clearRoomId() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get senderDeviceModel => $_getSZ(4);
  @$pb.TagNumber(16)
  set senderDeviceModel($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(16)
  $core.bool hasSenderDeviceModel() => $_has(4);
  @$pb.TagNumber(16)
  void clearSenderDeviceModel() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get senderDeviceOs => $_getSZ(5);
  @$pb.TagNumber(17)
  set senderDeviceOs($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(17)
  $core.bool hasSenderDeviceOs() => $_has(5);
  @$pb.TagNumber(17)
  void clearSenderDeviceOs() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get senderId => $_getSZ(6);
  @$pb.TagNumber(18)
  set senderId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(18)
  $core.bool hasSenderId() => $_has(6);
  @$pb.TagNumber(18)
  void clearSenderId() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get serverTimeStamp => $_getSZ(7);
  @$pb.TagNumber(19)
  set serverTimeStamp($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(19)
  $core.bool hasServerTimeStamp() => $_has(7);
  @$pb.TagNumber(19)
  void clearServerTimeStamp() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get stateMassage => $_getSZ(8);
  @$pb.TagNumber(20)
  set stateMassage($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(20)
  $core.bool hasStateMassage() => $_has(8);
  @$pb.TagNumber(20)
  void clearStateMassage() => clearField(20);

  @$pb.TagNumber(29)
  $core.bool get isComputer => $_getBF(9);
  @$pb.TagNumber(29)
  set isComputer($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(29)
  $core.bool hasIsComputer() => $_has(9);
  @$pb.TagNumber(29)
  void clearIsComputer() => clearField(29);

  @$pb.TagNumber(30)
  CbjCompSpecs get compSpecs => $_getN(10);
  @$pb.TagNumber(30)
  set compSpecs(CbjCompSpecs v) { setField(30, v); }
  @$pb.TagNumber(30)
  $core.bool hasCompSpecs() => $_has(10);
  @$pb.TagNumber(30)
  void clearCompSpecs() => clearField(30);
  @$pb.TagNumber(30)
  CbjCompSpecs ensureCompSpecs() => $_ensure(10);

  @$pb.TagNumber(31)
  CbjMicrocontrollerSpecs get microcontrollerSpecsSpecs => $_getN(11);
  @$pb.TagNumber(31)
  set microcontrollerSpecsSpecs(CbjMicrocontrollerSpecs v) { setField(31, v); }
  @$pb.TagNumber(31)
  $core.bool hasMicrocontrollerSpecsSpecs() => $_has(11);
  @$pb.TagNumber(31)
  void clearMicrocontrollerSpecsSpecs() => clearField(31);
  @$pb.TagNumber(31)
  CbjMicrocontrollerSpecs ensureMicrocontrollerSpecsSpecs() => $_ensure(11);

  @$pb.TagNumber(34)
  CbjDeviceTypesActions get deviceTypesActions => $_getN(12);
  @$pb.TagNumber(34)
  set deviceTypesActions(CbjDeviceTypesActions v) { setField(34, v); }
  @$pb.TagNumber(34)
  $core.bool hasDeviceTypesActions() => $_has(12);
  @$pb.TagNumber(34)
  void clearDeviceTypesActions() => clearField(34);
  @$pb.TagNumber(34)
  CbjDeviceTypesActions ensureDeviceTypesActions() => $_ensure(12);
}

class CbjSmartDeviceStatus extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjSmartDeviceStatus', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjSmartDeviceConnections'), createEmptyInstance: create)
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'onOffState', protoName: 'onOffState')
    ..hasRequiredFields = false
  ;

  CbjSmartDeviceStatus._() : super();
  factory CbjSmartDeviceStatus({
    $core.bool? onOffState,
  }) {
    final _result = create();
    if (onOffState != null) {
      _result.onOffState = onOffState;
    }
    return _result;
  }
  factory CbjSmartDeviceStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CbjSmartDeviceStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CbjSmartDeviceStatus clone() => CbjSmartDeviceStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CbjSmartDeviceStatus copyWith(void Function(CbjSmartDeviceStatus) updates) => super.copyWith((message) => updates(message as CbjSmartDeviceStatus)) as CbjSmartDeviceStatus; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CbjSmartDeviceStatus create() => CbjSmartDeviceStatus._();
  CbjSmartDeviceStatus createEmptyInstance() => create();
  static $pb.PbList<CbjSmartDeviceStatus> createRepeated() => $pb.PbList<CbjSmartDeviceStatus>();
  @$core.pragma('dart2js:noInline')
  static CbjSmartDeviceStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CbjSmartDeviceStatus>(create);
  static CbjSmartDeviceStatus? _defaultInstance;

  @$pb.TagNumber(4)
  $core.bool get onOffState => $_getBF(0);
  @$pb.TagNumber(4)
  set onOffState($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(4)
  $core.bool hasOnOffState() => $_has(0);
  @$pb.TagNumber(4)
  void clearOnOffState() => clearField(4);
}

class CbjCommendStatus extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjCommendStatus', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjSmartDeviceConnections'), createEmptyInstance: create)
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  CbjCommendStatus._() : super();
  factory CbjCommendStatus({
    $core.bool? success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory CbjCommendStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CbjCommendStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CbjCommendStatus clone() => CbjCommendStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CbjCommendStatus copyWith(void Function(CbjCommendStatus) updates) => super.copyWith((message) => updates(message as CbjCommendStatus)) as CbjCommendStatus; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CbjCommendStatus create() => CbjCommendStatus._();
  CbjCommendStatus createEmptyInstance() => create();
  static $pb.PbList<CbjCommendStatus> createRepeated() => $pb.PbList<CbjCommendStatus>();
  @$core.pragma('dart2js:noInline')
  static CbjCommendStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CbjCommendStatus>(create);
  static CbjCommendStatus? _defaultInstance;

  @$pb.TagNumber(5)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(5)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(5)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(5)
  void clearSuccess() => clearField(5);
}

class CbjSmartDeviceUpdateDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjSmartDeviceUpdateDetails', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjSmartDeviceConnections'), createEmptyInstance: create)
    ..aOM<CbjSmartDeviceInfo>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'smartDevice', protoName: 'smartDevice', subBuilder: CbjSmartDeviceInfo.create)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'newName', protoName: 'newName')
    ..hasRequiredFields = false
  ;

  CbjSmartDeviceUpdateDetails._() : super();
  factory CbjSmartDeviceUpdateDetails({
    CbjSmartDeviceInfo? smartDevice,
    $core.String? newName,
  }) {
    final _result = create();
    if (smartDevice != null) {
      _result.smartDevice = smartDevice;
    }
    if (newName != null) {
      _result.newName = newName;
    }
    return _result;
  }
  factory CbjSmartDeviceUpdateDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CbjSmartDeviceUpdateDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CbjSmartDeviceUpdateDetails clone() => CbjSmartDeviceUpdateDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CbjSmartDeviceUpdateDetails copyWith(void Function(CbjSmartDeviceUpdateDetails) updates) => super.copyWith((message) => updates(message as CbjSmartDeviceUpdateDetails)) as CbjSmartDeviceUpdateDetails; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CbjSmartDeviceUpdateDetails create() => CbjSmartDeviceUpdateDetails._();
  CbjSmartDeviceUpdateDetails createEmptyInstance() => create();
  static $pb.PbList<CbjSmartDeviceUpdateDetails> createRepeated() => $pb.PbList<CbjSmartDeviceUpdateDetails>();
  @$core.pragma('dart2js:noInline')
  static CbjSmartDeviceUpdateDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CbjSmartDeviceUpdateDetails>(create);
  static CbjSmartDeviceUpdateDetails? _defaultInstance;

  @$pb.TagNumber(6)
  CbjSmartDeviceInfo get smartDevice => $_getN(0);
  @$pb.TagNumber(6)
  set smartDevice(CbjSmartDeviceInfo v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasSmartDevice() => $_has(0);
  @$pb.TagNumber(6)
  void clearSmartDevice() => clearField(6);
  @$pb.TagNumber(6)
  CbjSmartDeviceInfo ensureSmartDevice() => $_ensure(0);

  @$pb.TagNumber(7)
  $core.String get newName => $_getSZ(1);
  @$pb.TagNumber(7)
  set newName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(7)
  $core.bool hasNewName() => $_has(1);
  @$pb.TagNumber(7)
  void clearNewName() => clearField(7);
}

class CbjFirebaseAccountInformation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjFirebaseAccountInformation', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjSmartDeviceConnections'), createEmptyInstance: create)
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fireBaseProjectId', protoName: 'fireBaseProjectId')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fireBaseApiKey', protoName: 'fireBaseApiKey')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userEmail', protoName: 'userEmail')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userPassword', protoName: 'userPassword')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'homeId', protoName: 'homeId')
    ..hasRequiredFields = false
  ;

  CbjFirebaseAccountInformation._() : super();
  factory CbjFirebaseAccountInformation({
    $core.String? fireBaseProjectId,
    $core.String? fireBaseApiKey,
    $core.String? userEmail,
    $core.String? userPassword,
    $core.String? homeId,
  }) {
    final _result = create();
    if (fireBaseProjectId != null) {
      _result.fireBaseProjectId = fireBaseProjectId;
    }
    if (fireBaseApiKey != null) {
      _result.fireBaseApiKey = fireBaseApiKey;
    }
    if (userEmail != null) {
      _result.userEmail = userEmail;
    }
    if (userPassword != null) {
      _result.userPassword = userPassword;
    }
    if (homeId != null) {
      _result.homeId = homeId;
    }
    return _result;
  }
  factory CbjFirebaseAccountInformation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CbjFirebaseAccountInformation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CbjFirebaseAccountInformation clone() => CbjFirebaseAccountInformation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CbjFirebaseAccountInformation copyWith(void Function(CbjFirebaseAccountInformation) updates) => super.copyWith((message) => updates(message as CbjFirebaseAccountInformation)) as CbjFirebaseAccountInformation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CbjFirebaseAccountInformation create() => CbjFirebaseAccountInformation._();
  CbjFirebaseAccountInformation createEmptyInstance() => create();
  static $pb.PbList<CbjFirebaseAccountInformation> createRepeated() => $pb.PbList<CbjFirebaseAccountInformation>();
  @$core.pragma('dart2js:noInline')
  static CbjFirebaseAccountInformation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CbjFirebaseAccountInformation>(create);
  static CbjFirebaseAccountInformation? _defaultInstance;

  @$pb.TagNumber(8)
  $core.String get fireBaseProjectId => $_getSZ(0);
  @$pb.TagNumber(8)
  set fireBaseProjectId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(8)
  $core.bool hasFireBaseProjectId() => $_has(0);
  @$pb.TagNumber(8)
  void clearFireBaseProjectId() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get fireBaseApiKey => $_getSZ(1);
  @$pb.TagNumber(9)
  set fireBaseApiKey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(9)
  $core.bool hasFireBaseApiKey() => $_has(1);
  @$pb.TagNumber(9)
  void clearFireBaseApiKey() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get userEmail => $_getSZ(2);
  @$pb.TagNumber(10)
  set userEmail($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(10)
  $core.bool hasUserEmail() => $_has(2);
  @$pb.TagNumber(10)
  void clearUserEmail() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get userPassword => $_getSZ(3);
  @$pb.TagNumber(11)
  set userPassword($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(11)
  $core.bool hasUserPassword() => $_has(3);
  @$pb.TagNumber(11)
  void clearUserPassword() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get homeId => $_getSZ(4);
  @$pb.TagNumber(12)
  set homeId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(12)
  $core.bool hasHomeId() => $_has(4);
  @$pb.TagNumber(12)
  void clearHomeId() => clearField(12);
}

class CbjDeviceTypesActions extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjDeviceTypesActions', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjSmartDeviceConnections'), createEmptyInstance: create)
    ..e<CbjDeviceTypes>(35, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceType', $pb.PbFieldType.OE, protoName: 'deviceType', defaultOrMaker: CbjDeviceTypes.typeNotSupported, valueOf: CbjDeviceTypes.valueOf, enumValues: CbjDeviceTypes.values)
    ..e<CbjDeviceActions>(36, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceAction', $pb.PbFieldType.OE, protoName: 'deviceAction', defaultOrMaker: CbjDeviceActions.actionNotSupported, valueOf: CbjDeviceActions.valueOf, enumValues: CbjDeviceActions.values)
    ..e<CbjDeviceStateGRPC>(37, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceStateGRPC', $pb.PbFieldType.OE, protoName: 'deviceStateGRPC', defaultOrMaker: CbjDeviceStateGRPC.stateNotSupported, valueOf: CbjDeviceStateGRPC.valueOf, enumValues: CbjDeviceStateGRPC.values)
    ..hasRequiredFields = false
  ;

  CbjDeviceTypesActions._() : super();
  factory CbjDeviceTypesActions({
    CbjDeviceTypes? deviceType,
    CbjDeviceActions? deviceAction,
    CbjDeviceStateGRPC? deviceStateGRPC,
  }) {
    final _result = create();
    if (deviceType != null) {
      _result.deviceType = deviceType;
    }
    if (deviceAction != null) {
      _result.deviceAction = deviceAction;
    }
    if (deviceStateGRPC != null) {
      _result.deviceStateGRPC = deviceStateGRPC;
    }
    return _result;
  }
  factory CbjDeviceTypesActions.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CbjDeviceTypesActions.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CbjDeviceTypesActions clone() => CbjDeviceTypesActions()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CbjDeviceTypesActions copyWith(void Function(CbjDeviceTypesActions) updates) => super.copyWith((message) => updates(message as CbjDeviceTypesActions)) as CbjDeviceTypesActions; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CbjDeviceTypesActions create() => CbjDeviceTypesActions._();
  CbjDeviceTypesActions createEmptyInstance() => create();
  static $pb.PbList<CbjDeviceTypesActions> createRepeated() => $pb.PbList<CbjDeviceTypesActions>();
  @$core.pragma('dart2js:noInline')
  static CbjDeviceTypesActions getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CbjDeviceTypesActions>(create);
  static CbjDeviceTypesActions? _defaultInstance;

  @$pb.TagNumber(35)
  CbjDeviceTypes get deviceType => $_getN(0);
  @$pb.TagNumber(35)
  set deviceType(CbjDeviceTypes v) { setField(35, v); }
  @$pb.TagNumber(35)
  $core.bool hasDeviceType() => $_has(0);
  @$pb.TagNumber(35)
  void clearDeviceType() => clearField(35);

  @$pb.TagNumber(36)
  CbjDeviceActions get deviceAction => $_getN(1);
  @$pb.TagNumber(36)
  set deviceAction(CbjDeviceActions v) { setField(36, v); }
  @$pb.TagNumber(36)
  $core.bool hasDeviceAction() => $_has(1);
  @$pb.TagNumber(36)
  void clearDeviceAction() => clearField(36);

  @$pb.TagNumber(37)
  CbjDeviceStateGRPC get deviceStateGRPC => $_getN(2);
  @$pb.TagNumber(37)
  set deviceStateGRPC(CbjDeviceStateGRPC v) { setField(37, v); }
  @$pb.TagNumber(37)
  $core.bool hasDeviceStateGRPC() => $_has(2);
  @$pb.TagNumber(37)
  void clearDeviceStateGRPC() => clearField(37);
}

