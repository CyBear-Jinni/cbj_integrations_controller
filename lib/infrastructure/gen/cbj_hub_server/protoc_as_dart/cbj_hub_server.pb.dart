///
//  Generated code. Do not modify.
//  source: cbj_hub_server.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'cbj_hub_server.pbenum.dart';

export 'cbj_hub_server.pbenum.dart';

class ClientStatusRequests extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ClientStatusRequests', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjHub'), createEmptyInstance: create)
    ..e<SendingType>(41, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sendingType', $pb.PbFieldType.OE, protoName: 'sendingType', defaultOrMaker: SendingType.undefinedType, valueOf: SendingType.valueOf, enumValues: SendingType.values)
    ..aOS(42, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'allRemoteCommands', protoName: 'allRemoteCommands')
    ..hasRequiredFields = false
  ;

  ClientStatusRequests._() : super();
  factory ClientStatusRequests({
    SendingType? sendingType,
    $core.String? allRemoteCommands,
  }) {
    final _result = create();
    if (sendingType != null) {
      _result.sendingType = sendingType;
    }
    if (allRemoteCommands != null) {
      _result.allRemoteCommands = allRemoteCommands;
    }
    return _result;
  }
  factory ClientStatusRequests.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClientStatusRequests.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ClientStatusRequests clone() => ClientStatusRequests()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ClientStatusRequests copyWith(void Function(ClientStatusRequests) updates) => super.copyWith((message) => updates(message as ClientStatusRequests)) as ClientStatusRequests; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ClientStatusRequests create() => ClientStatusRequests._();
  ClientStatusRequests createEmptyInstance() => create();
  static $pb.PbList<ClientStatusRequests> createRepeated() => $pb.PbList<ClientStatusRequests>();
  @$core.pragma('dart2js:noInline')
  static ClientStatusRequests getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClientStatusRequests>(create);
  static ClientStatusRequests? _defaultInstance;

  @$pb.TagNumber(41)
  SendingType get sendingType => $_getN(0);
  @$pb.TagNumber(41)
  set sendingType(SendingType v) { setField(41, v); }
  @$pb.TagNumber(41)
  $core.bool hasSendingType() => $_has(0);
  @$pb.TagNumber(41)
  void clearSendingType() => clearField(41);

  @$pb.TagNumber(42)
  $core.String get allRemoteCommands => $_getSZ(1);
  @$pb.TagNumber(42)
  set allRemoteCommands($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(42)
  $core.bool hasAllRemoteCommands() => $_has(1);
  @$pb.TagNumber(42)
  void clearAllRemoteCommands() => clearField(42);
}

class RequestsAndStatusFromHub extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RequestsAndStatusFromHub', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjHub'), createEmptyInstance: create)
    ..e<SendingType>(43, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sendingType', $pb.PbFieldType.OE, protoName: 'sendingType', defaultOrMaker: SendingType.undefinedType, valueOf: SendingType.valueOf, enumValues: SendingType.values)
    ..aOS(44, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'allRemoteCommands', protoName: 'allRemoteCommands')
    ..hasRequiredFields = false
  ;

  RequestsAndStatusFromHub._() : super();
  factory RequestsAndStatusFromHub({
    SendingType? sendingType,
    $core.String? allRemoteCommands,
  }) {
    final _result = create();
    if (sendingType != null) {
      _result.sendingType = sendingType;
    }
    if (allRemoteCommands != null) {
      _result.allRemoteCommands = allRemoteCommands;
    }
    return _result;
  }
  factory RequestsAndStatusFromHub.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequestsAndStatusFromHub.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequestsAndStatusFromHub clone() => RequestsAndStatusFromHub()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequestsAndStatusFromHub copyWith(void Function(RequestsAndStatusFromHub) updates) => super.copyWith((message) => updates(message as RequestsAndStatusFromHub)) as RequestsAndStatusFromHub; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RequestsAndStatusFromHub create() => RequestsAndStatusFromHub._();
  RequestsAndStatusFromHub createEmptyInstance() => create();
  static $pb.PbList<RequestsAndStatusFromHub> createRepeated() => $pb.PbList<RequestsAndStatusFromHub>();
  @$core.pragma('dart2js:noInline')
  static RequestsAndStatusFromHub getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequestsAndStatusFromHub>(create);
  static RequestsAndStatusFromHub? _defaultInstance;

  @$pb.TagNumber(43)
  SendingType get sendingType => $_getN(0);
  @$pb.TagNumber(43)
  set sendingType(SendingType v) { setField(43, v); }
  @$pb.TagNumber(43)
  $core.bool hasSendingType() => $_has(0);
  @$pb.TagNumber(43)
  void clearSendingType() => clearField(43);

  @$pb.TagNumber(44)
  $core.String get allRemoteCommands => $_getSZ(1);
  @$pb.TagNumber(44)
  set allRemoteCommands($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(44)
  $core.bool hasAllRemoteCommands() => $_has(1);
  @$pb.TagNumber(44)
  void clearAllRemoteCommands() => clearField(44);
}

class AllRemoteCommands extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AllRemoteCommands', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjHub'), createEmptyInstance: create)
    ..aOM<SmartEntityInfo>(40, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'smartEntityInfo', protoName: 'smartEntityInfo', subBuilder: SmartEntityInfo.create)
    ..hasRequiredFields = false
  ;

  AllRemoteCommands._() : super();
  factory AllRemoteCommands({
    SmartEntityInfo? smartEntityInfo,
  }) {
    final _result = create();
    if (smartEntityInfo != null) {
      _result.smartEntityInfo = smartEntityInfo;
    }
    return _result;
  }
  factory AllRemoteCommands.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AllRemoteCommands.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AllRemoteCommands clone() => AllRemoteCommands()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AllRemoteCommands copyWith(void Function(AllRemoteCommands) updates) => super.copyWith((message) => updates(message as AllRemoteCommands)) as AllRemoteCommands; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AllRemoteCommands create() => AllRemoteCommands._();
  AllRemoteCommands createEmptyInstance() => create();
  static $pb.PbList<AllRemoteCommands> createRepeated() => $pb.PbList<AllRemoteCommands>();
  @$core.pragma('dart2js:noInline')
  static AllRemoteCommands getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AllRemoteCommands>(create);
  static AllRemoteCommands? _defaultInstance;

  @$pb.TagNumber(40)
  SmartEntityInfo get smartEntityInfo => $_getN(0);
  @$pb.TagNumber(40)
  set smartEntityInfo(SmartEntityInfo v) { setField(40, v); }
  @$pb.TagNumber(40)
  $core.bool hasSmartEntityInfo() => $_has(0);
  @$pb.TagNumber(40)
  void clearSmartEntityInfo() => clearField(40);
  @$pb.TagNumber(40)
  SmartEntityInfo ensureSmartEntityInfo() => $_ensure(0);
}

class FirstSetupMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FirstSetupMessage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjHub'), createEmptyInstance: create)
    ..aOM<CompHubInfo>(38, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compInfo', protoName: 'compInfo', subBuilder: CompHubInfo.create)
    ..aOM<CloudAccountInformation>(39, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cloudAccountInformation', protoName: 'cloudAccountInformation', subBuilder: CloudAccountInformation.create)
    ..hasRequiredFields = false
  ;

  FirstSetupMessage._() : super();
  factory FirstSetupMessage({
    CompHubInfo? compInfo,
    CloudAccountInformation? cloudAccountInformation,
  }) {
    final _result = create();
    if (compInfo != null) {
      _result.compInfo = compInfo;
    }
    if (cloudAccountInformation != null) {
      _result.cloudAccountInformation = cloudAccountInformation;
    }
    return _result;
  }
  factory FirstSetupMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FirstSetupMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FirstSetupMessage clone() => FirstSetupMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FirstSetupMessage copyWith(void Function(FirstSetupMessage) updates) => super.copyWith((message) => updates(message as FirstSetupMessage)) as FirstSetupMessage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FirstSetupMessage create() => FirstSetupMessage._();
  FirstSetupMessage createEmptyInstance() => create();
  static $pb.PbList<FirstSetupMessage> createRepeated() => $pb.PbList<FirstSetupMessage>();
  @$core.pragma('dart2js:noInline')
  static FirstSetupMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FirstSetupMessage>(create);
  static FirstSetupMessage? _defaultInstance;

  @$pb.TagNumber(38)
  CompHubInfo get compInfo => $_getN(0);
  @$pb.TagNumber(38)
  set compInfo(CompHubInfo v) { setField(38, v); }
  @$pb.TagNumber(38)
  $core.bool hasCompInfo() => $_has(0);
  @$pb.TagNumber(38)
  void clearCompInfo() => clearField(38);
  @$pb.TagNumber(38)
  CompHubInfo ensureCompInfo() => $_ensure(0);

  @$pb.TagNumber(39)
  CloudAccountInformation get cloudAccountInformation => $_getN(1);
  @$pb.TagNumber(39)
  set cloudAccountInformation(CloudAccountInformation v) { setField(39, v); }
  @$pb.TagNumber(39)
  $core.bool hasCloudAccountInformation() => $_has(1);
  @$pb.TagNumber(39)
  void clearCloudAccountInformation() => clearField(39);
  @$pb.TagNumber(39)
  CloudAccountInformation ensureCloudAccountInformation() => $_ensure(1);
}

class CompHubInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CompHubInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjHub'), createEmptyInstance: create)
    ..aOM<CompHubSpecs>(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compSpecs', protoName: 'compSpecs', subBuilder: CompHubSpecs.create)
    ..aOM<CbjHubIno>(47, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cbjInfo', protoName: 'cbjInfo', subBuilder: CbjHubIno.create)
    ..hasRequiredFields = false
  ;

  CompHubInfo._() : super();
  factory CompHubInfo({
    CompHubSpecs? compSpecs,
    CbjHubIno? cbjInfo,
  }) {
    final _result = create();
    if (compSpecs != null) {
      _result.compSpecs = compSpecs;
    }
    if (cbjInfo != null) {
      _result.cbjInfo = cbjInfo;
    }
    return _result;
  }
  factory CompHubInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CompHubInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CompHubInfo clone() => CompHubInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CompHubInfo copyWith(void Function(CompHubInfo) updates) => super.copyWith((message) => updates(message as CompHubInfo)) as CompHubInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CompHubInfo create() => CompHubInfo._();
  CompHubInfo createEmptyInstance() => create();
  static $pb.PbList<CompHubInfo> createRepeated() => $pb.PbList<CompHubInfo>();
  @$core.pragma('dart2js:noInline')
  static CompHubInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CompHubInfo>(create);
  static CompHubInfo? _defaultInstance;

  @$pb.TagNumber(21)
  CompHubSpecs get compSpecs => $_getN(0);
  @$pb.TagNumber(21)
  set compSpecs(CompHubSpecs v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasCompSpecs() => $_has(0);
  @$pb.TagNumber(21)
  void clearCompSpecs() => clearField(21);
  @$pb.TagNumber(21)
  CompHubSpecs ensureCompSpecs() => $_ensure(0);

  @$pb.TagNumber(47)
  CbjHubIno get cbjInfo => $_getN(1);
  @$pb.TagNumber(47)
  set cbjInfo(CbjHubIno v) { setField(47, v); }
  @$pb.TagNumber(47)
  $core.bool hasCbjInfo() => $_has(1);
  @$pb.TagNumber(47)
  void clearCbjInfo() => clearField(47);
  @$pb.TagNumber(47)
  CbjHubIno ensureCbjInfo() => $_ensure(1);
}

class CbjHubIno extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjHubIno', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjHub'), createEmptyInstance: create)
    ..aOS(27, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pubspecYamlVersion', protoName: 'pubspecYamlVersion')
    ..aOS(48, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'entityName', protoName: 'entityName')
    ..aOS(49, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'protoLastGenDate', protoName: 'protoLastGenDate')
    ..aOS(51, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pubspecYamlBuildNumber', protoName: 'pubspecYamlBuildNumber')
    ..aOS(52, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dartSdkVersion', protoName: 'dartSdkVersion')
    ..hasRequiredFields = false
  ;

  CbjHubIno._() : super();
  factory CbjHubIno({
    $core.String? pubspecYamlVersion,
    $core.String? entityName,
    $core.String? protoLastGenDate,
    $core.String? pubspecYamlBuildNumber,
    $core.String? dartSdkVersion,
  }) {
    final _result = create();
    if (pubspecYamlVersion != null) {
      _result.pubspecYamlVersion = pubspecYamlVersion;
    }
    if (entityName != null) {
      _result.entityName = entityName;
    }
    if (protoLastGenDate != null) {
      _result.protoLastGenDate = protoLastGenDate;
    }
    if (pubspecYamlBuildNumber != null) {
      _result.pubspecYamlBuildNumber = pubspecYamlBuildNumber;
    }
    if (dartSdkVersion != null) {
      _result.dartSdkVersion = dartSdkVersion;
    }
    return _result;
  }
  factory CbjHubIno.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CbjHubIno.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CbjHubIno clone() => CbjHubIno()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CbjHubIno copyWith(void Function(CbjHubIno) updates) => super.copyWith((message) => updates(message as CbjHubIno)) as CbjHubIno; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CbjHubIno create() => CbjHubIno._();
  CbjHubIno createEmptyInstance() => create();
  static $pb.PbList<CbjHubIno> createRepeated() => $pb.PbList<CbjHubIno>();
  @$core.pragma('dart2js:noInline')
  static CbjHubIno getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CbjHubIno>(create);
  static CbjHubIno? _defaultInstance;

  @$pb.TagNumber(27)
  $core.String get pubspecYamlVersion => $_getSZ(0);
  @$pb.TagNumber(27)
  set pubspecYamlVersion($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(27)
  $core.bool hasPubspecYamlVersion() => $_has(0);
  @$pb.TagNumber(27)
  void clearPubspecYamlVersion() => clearField(27);

  @$pb.TagNumber(48)
  $core.String get entityName => $_getSZ(1);
  @$pb.TagNumber(48)
  set entityName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(48)
  $core.bool hasEntityName() => $_has(1);
  @$pb.TagNumber(48)
  void clearEntityName() => clearField(48);

  @$pb.TagNumber(49)
  $core.String get protoLastGenDate => $_getSZ(2);
  @$pb.TagNumber(49)
  set protoLastGenDate($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(49)
  $core.bool hasProtoLastGenDate() => $_has(2);
  @$pb.TagNumber(49)
  void clearProtoLastGenDate() => clearField(49);

  @$pb.TagNumber(51)
  $core.String get pubspecYamlBuildNumber => $_getSZ(3);
  @$pb.TagNumber(51)
  set pubspecYamlBuildNumber($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(51)
  $core.bool hasPubspecYamlBuildNumber() => $_has(3);
  @$pb.TagNumber(51)
  void clearPubspecYamlBuildNumber() => clearField(51);

  @$pb.TagNumber(52)
  $core.String get dartSdkVersion => $_getSZ(4);
  @$pb.TagNumber(52)
  set dartSdkVersion($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(52)
  $core.bool hasDartSdkVersion() => $_has(4);
  @$pb.TagNumber(52)
  void clearDartSdkVersion() => clearField(52);
}

class CompHubSpecs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CompHubSpecs', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjHub'), createEmptyInstance: create)
    ..aOS(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compId', protoName: 'compId')
    ..aOS(23, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compUuid', protoName: 'compUuid')
    ..aOS(24, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compOs', protoName: 'compOs')
    ..aOS(25, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compModel', protoName: 'compModel')
    ..aOS(26, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compType', protoName: 'compType')
    ..aOS(50, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compIp', protoName: 'compIp')
    ..hasRequiredFields = false
  ;

  CompHubSpecs._() : super();
  factory CompHubSpecs({
    $core.String? compId,
    $core.String? compUuid,
    $core.String? compOs,
    $core.String? compModel,
    $core.String? compType,
    $core.String? compIp,
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
    if (compIp != null) {
      _result.compIp = compIp;
    }
    return _result;
  }
  factory CompHubSpecs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CompHubSpecs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CompHubSpecs clone() => CompHubSpecs()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CompHubSpecs copyWith(void Function(CompHubSpecs) updates) => super.copyWith((message) => updates(message as CompHubSpecs)) as CompHubSpecs; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CompHubSpecs create() => CompHubSpecs._();
  CompHubSpecs createEmptyInstance() => create();
  static $pb.PbList<CompHubSpecs> createRepeated() => $pb.PbList<CompHubSpecs>();
  @$core.pragma('dart2js:noInline')
  static CompHubSpecs getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CompHubSpecs>(create);
  static CompHubSpecs? _defaultInstance;

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

  @$pb.TagNumber(50)
  $core.String get compIp => $_getSZ(5);
  @$pb.TagNumber(50)
  set compIp($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(50)
  $core.bool hasCompIp() => $_has(5);
  @$pb.TagNumber(50)
  void clearCompIp() => clearField(50);
}

class MicrocontrollerSpecs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MicrocontrollerSpecs', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjHub'), createEmptyInstance: create)
    ..aOS(31, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'microcontrollerModel', protoName: 'microcontrollerModel')
    ..aOS(32, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'microcontrollerType', protoName: 'microcontrollerType')
    ..aOS(33, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'softwareVersion', protoName: 'softwareVersion')
    ..hasRequiredFields = false
  ;

  MicrocontrollerSpecs._() : super();
  factory MicrocontrollerSpecs({
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
  factory MicrocontrollerSpecs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MicrocontrollerSpecs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MicrocontrollerSpecs clone() => MicrocontrollerSpecs()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MicrocontrollerSpecs copyWith(void Function(MicrocontrollerSpecs) updates) => super.copyWith((message) => updates(message as MicrocontrollerSpecs)) as MicrocontrollerSpecs; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MicrocontrollerSpecs create() => MicrocontrollerSpecs._();
  MicrocontrollerSpecs createEmptyInstance() => create();
  static $pb.PbList<MicrocontrollerSpecs> createRepeated() => $pb.PbList<MicrocontrollerSpecs>();
  @$core.pragma('dart2js:noInline')
  static MicrocontrollerSpecs getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MicrocontrollerSpecs>(create);
  static MicrocontrollerSpecs? _defaultInstance;

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

class SmartEntityInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SmartEntityInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjHub'), createEmptyInstance: create)
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
    ..aOM<CompHubSpecs>(30, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'compSpecs', protoName: 'compSpecs', subBuilder: CompHubSpecs.create)
    ..aOM<MicrocontrollerSpecs>(31, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'microcontrollerSpecsSpecs', protoName: 'microcontrollerSpecsSpecs', subBuilder: MicrocontrollerSpecs.create)
    ..aOM<EntityTypesActions>(34, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'entityTypesActions', protoName: 'entityTypesActions', subBuilder: EntityTypesActions.create)
    ..aOM<MqttMassage>(43, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mqttMassage', protoName: 'mqttMassage', subBuilder: MqttMassage.create)
    ..hasRequiredFields = false
  ;

  SmartEntityInfo._() : super();
  factory SmartEntityInfo({
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
    CompHubSpecs? compSpecs,
    MicrocontrollerSpecs? microcontrollerSpecsSpecs,
    EntityTypesActions? entityTypesActions,
    MqttMassage? mqttMassage,
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
    if (entityTypesActions != null) {
      _result.entityTypesActions = entityTypesActions;
    }
    if (mqttMassage != null) {
      _result.mqttMassage = mqttMassage;
    }
    return _result;
  }
  factory SmartEntityInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SmartEntityInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SmartEntityInfo clone() => SmartEntityInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SmartEntityInfo copyWith(void Function(SmartEntityInfo) updates) => super.copyWith((message) => updates(message as SmartEntityInfo)) as SmartEntityInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SmartEntityInfo create() => SmartEntityInfo._();
  SmartEntityInfo createEmptyInstance() => create();
  static $pb.PbList<SmartEntityInfo> createRepeated() => $pb.PbList<SmartEntityInfo>();
  @$core.pragma('dart2js:noInline')
  static SmartEntityInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SmartEntityInfo>(create);
  static SmartEntityInfo? _defaultInstance;

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
  CompHubSpecs get compSpecs => $_getN(10);
  @$pb.TagNumber(30)
  set compSpecs(CompHubSpecs v) { setField(30, v); }
  @$pb.TagNumber(30)
  $core.bool hasCompSpecs() => $_has(10);
  @$pb.TagNumber(30)
  void clearCompSpecs() => clearField(30);
  @$pb.TagNumber(30)
  CompHubSpecs ensureCompSpecs() => $_ensure(10);

  @$pb.TagNumber(31)
  MicrocontrollerSpecs get microcontrollerSpecsSpecs => $_getN(11);
  @$pb.TagNumber(31)
  set microcontrollerSpecsSpecs(MicrocontrollerSpecs v) { setField(31, v); }
  @$pb.TagNumber(31)
  $core.bool hasMicrocontrollerSpecsSpecs() => $_has(11);
  @$pb.TagNumber(31)
  void clearMicrocontrollerSpecsSpecs() => clearField(31);
  @$pb.TagNumber(31)
  MicrocontrollerSpecs ensureMicrocontrollerSpecsSpecs() => $_ensure(11);

  @$pb.TagNumber(34)
  EntityTypesActions get entityTypesActions => $_getN(12);
  @$pb.TagNumber(34)
  set entityTypesActions(EntityTypesActions v) { setField(34, v); }
  @$pb.TagNumber(34)
  $core.bool hasEntityTypesActions() => $_has(12);
  @$pb.TagNumber(34)
  void clearEntityTypesActions() => clearField(34);
  @$pb.TagNumber(34)
  EntityTypesActions ensureEntityTypesActions() => $_ensure(12);

  @$pb.TagNumber(43)
  MqttMassage get mqttMassage => $_getN(13);
  @$pb.TagNumber(43)
  set mqttMassage(MqttMassage v) { setField(43, v); }
  @$pb.TagNumber(43)
  $core.bool hasMqttMassage() => $_has(13);
  @$pb.TagNumber(43)
  void clearMqttMassage() => clearField(43);
  @$pb.TagNumber(43)
  MqttMassage ensureMqttMassage() => $_ensure(13);
}

class SmartEntityStatus extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SmartEntityStatus', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjHub'), createEmptyInstance: create)
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'onOffState', protoName: 'onOffState')
    ..hasRequiredFields = false
  ;

  SmartEntityStatus._() : super();
  factory SmartEntityStatus({
    $core.bool? onOffState,
  }) {
    final _result = create();
    if (onOffState != null) {
      _result.onOffState = onOffState;
    }
    return _result;
  }
  factory SmartEntityStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SmartEntityStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SmartEntityStatus clone() => SmartEntityStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SmartEntityStatus copyWith(void Function(SmartEntityStatus) updates) => super.copyWith((message) => updates(message as SmartEntityStatus)) as SmartEntityStatus; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SmartEntityStatus create() => SmartEntityStatus._();
  SmartEntityStatus createEmptyInstance() => create();
  static $pb.PbList<SmartEntityStatus> createRepeated() => $pb.PbList<SmartEntityStatus>();
  @$core.pragma('dart2js:noInline')
  static SmartEntityStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SmartEntityStatus>(create);
  static SmartEntityStatus? _defaultInstance;

  @$pb.TagNumber(4)
  $core.bool get onOffState => $_getBF(0);
  @$pb.TagNumber(4)
  set onOffState($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(4)
  $core.bool hasOnOffState() => $_has(0);
  @$pb.TagNumber(4)
  void clearOnOffState() => clearField(4);
}

class MqttMassage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MqttMassage', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjHub'), createEmptyInstance: create)
    ..aOS(44, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mqttTopic', protoName: 'mqttTopic')
    ..aOS(45, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mqttMassage', protoName: 'mqttMassage')
    ..hasRequiredFields = false
  ;

  MqttMassage._() : super();
  factory MqttMassage({
    $core.String? mqttTopic,
    $core.String? mqttMassage,
  }) {
    final _result = create();
    if (mqttTopic != null) {
      _result.mqttTopic = mqttTopic;
    }
    if (mqttMassage != null) {
      _result.mqttMassage = mqttMassage;
    }
    return _result;
  }
  factory MqttMassage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MqttMassage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MqttMassage clone() => MqttMassage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MqttMassage copyWith(void Function(MqttMassage) updates) => super.copyWith((message) => updates(message as MqttMassage)) as MqttMassage; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MqttMassage create() => MqttMassage._();
  MqttMassage createEmptyInstance() => create();
  static $pb.PbList<MqttMassage> createRepeated() => $pb.PbList<MqttMassage>();
  @$core.pragma('dart2js:noInline')
  static MqttMassage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MqttMassage>(create);
  static MqttMassage? _defaultInstance;

  @$pb.TagNumber(44)
  $core.String get mqttTopic => $_getSZ(0);
  @$pb.TagNumber(44)
  set mqttTopic($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(44)
  $core.bool hasMqttTopic() => $_has(0);
  @$pb.TagNumber(44)
  void clearMqttTopic() => clearField(44);

  @$pb.TagNumber(45)
  $core.String get mqttMassage => $_getSZ(1);
  @$pb.TagNumber(45)
  set mqttMassage($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(45)
  $core.bool hasMqttMassage() => $_has(1);
  @$pb.TagNumber(45)
  void clearMqttMassage() => clearField(45);
}

class CommendStatus extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CommendStatus', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjHub'), createEmptyInstance: create)
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..hasRequiredFields = false
  ;

  CommendStatus._() : super();
  factory CommendStatus({
    $core.bool? success,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    return _result;
  }
  factory CommendStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CommendStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CommendStatus clone() => CommendStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CommendStatus copyWith(void Function(CommendStatus) updates) => super.copyWith((message) => updates(message as CommendStatus)) as CommendStatus; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CommendStatus create() => CommendStatus._();
  CommendStatus createEmptyInstance() => create();
  static $pb.PbList<CommendStatus> createRepeated() => $pb.PbList<CommendStatus>();
  @$core.pragma('dart2js:noInline')
  static CommendStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CommendStatus>(create);
  static CommendStatus? _defaultInstance;

  @$pb.TagNumber(5)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(5)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(5)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(5)
  void clearSuccess() => clearField(5);
}

class SmartEntitiesUpdateDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SmartEntitiesUpdateDetails', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjHub'), createEmptyInstance: create)
    ..aOM<SmartEntityInfo>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'smartEntity', protoName: 'smartEntity', subBuilder: SmartEntityInfo.create)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'newName', protoName: 'newName')
    ..hasRequiredFields = false
  ;

  SmartEntitiesUpdateDetails._() : super();
  factory SmartEntitiesUpdateDetails({
    SmartEntityInfo? smartEntity,
    $core.String? newName,
  }) {
    final _result = create();
    if (smartEntity != null) {
      _result.smartEntity = smartEntity;
    }
    if (newName != null) {
      _result.newName = newName;
    }
    return _result;
  }
  factory SmartEntitiesUpdateDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SmartEntitiesUpdateDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SmartEntitiesUpdateDetails clone() => SmartEntitiesUpdateDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SmartEntitiesUpdateDetails copyWith(void Function(SmartEntitiesUpdateDetails) updates) => super.copyWith((message) => updates(message as SmartEntitiesUpdateDetails)) as SmartEntitiesUpdateDetails; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SmartEntitiesUpdateDetails create() => SmartEntitiesUpdateDetails._();
  SmartEntitiesUpdateDetails createEmptyInstance() => create();
  static $pb.PbList<SmartEntitiesUpdateDetails> createRepeated() => $pb.PbList<SmartEntitiesUpdateDetails>();
  @$core.pragma('dart2js:noInline')
  static SmartEntitiesUpdateDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SmartEntitiesUpdateDetails>(create);
  static SmartEntitiesUpdateDetails? _defaultInstance;

  @$pb.TagNumber(6)
  SmartEntityInfo get smartEntity => $_getN(0);
  @$pb.TagNumber(6)
  set smartEntity(SmartEntityInfo v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasSmartEntity() => $_has(0);
  @$pb.TagNumber(6)
  void clearSmartEntity() => clearField(6);
  @$pb.TagNumber(6)
  SmartEntityInfo ensureSmartEntity() => $_ensure(0);

  @$pb.TagNumber(7)
  $core.String get newName => $_getSZ(1);
  @$pb.TagNumber(7)
  set newName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(7)
  $core.bool hasNewName() => $_has(1);
  @$pb.TagNumber(7)
  void clearNewName() => clearField(7);
}

class CloudAccountInformation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CloudAccountInformation', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjHub'), createEmptyInstance: create)
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cloudProjectId', protoName: 'cloudProjectId')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cloudApiKey', protoName: 'cloudApiKey')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userEmail', protoName: 'userEmail')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'userPassword', protoName: 'userPassword')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'homeId', protoName: 'homeId')
    ..hasRequiredFields = false
  ;

  CloudAccountInformation._() : super();
  factory CloudAccountInformation({
    $core.String? cloudProjectId,
    $core.String? cloudApiKey,
    $core.String? userEmail,
    $core.String? userPassword,
    $core.String? homeId,
  }) {
    final _result = create();
    if (cloudProjectId != null) {
      _result.cloudProjectId = cloudProjectId;
    }
    if (cloudApiKey != null) {
      _result.cloudApiKey = cloudApiKey;
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
  factory CloudAccountInformation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CloudAccountInformation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CloudAccountInformation clone() => CloudAccountInformation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CloudAccountInformation copyWith(void Function(CloudAccountInformation) updates) => super.copyWith((message) => updates(message as CloudAccountInformation)) as CloudAccountInformation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CloudAccountInformation create() => CloudAccountInformation._();
  CloudAccountInformation createEmptyInstance() => create();
  static $pb.PbList<CloudAccountInformation> createRepeated() => $pb.PbList<CloudAccountInformation>();
  @$core.pragma('dart2js:noInline')
  static CloudAccountInformation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CloudAccountInformation>(create);
  static CloudAccountInformation? _defaultInstance;

  @$pb.TagNumber(8)
  $core.String get cloudProjectId => $_getSZ(0);
  @$pb.TagNumber(8)
  set cloudProjectId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(8)
  $core.bool hasCloudProjectId() => $_has(0);
  @$pb.TagNumber(8)
  void clearCloudProjectId() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get cloudApiKey => $_getSZ(1);
  @$pb.TagNumber(9)
  set cloudApiKey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(9)
  $core.bool hasCloudApiKey() => $_has(1);
  @$pb.TagNumber(9)
  void clearCloudApiKey() => clearField(9);

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

class EntityTypesActions extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'EntityTypesActions', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CbjHub'), createEmptyInstance: create)
    ..e<EntityTypes>(35, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'entityType', $pb.PbFieldType.OE, protoName: 'entityType', defaultOrMaker: EntityTypes.smartTypeNotSupported, valueOf: EntityTypes.valueOf, enumValues: EntityTypes.values)
    ..e<EntityActions>(36, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'entityAction', $pb.PbFieldType.OE, protoName: 'entityAction', defaultOrMaker: EntityActions.actionNotSupported, valueOf: EntityActions.valueOf, enumValues: EntityActions.values)
    ..e<EntityStateGRPC>(37, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'entityStateGRPC', $pb.PbFieldType.OE, protoName: 'entityStateGRPC', defaultOrMaker: EntityStateGRPC.stateNotSupported, valueOf: EntityStateGRPC.valueOf, enumValues: EntityStateGRPC.values)
    ..e<VendorsAndServices>(46, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'vendorsAndServices', $pb.PbFieldType.OE, protoName: 'vendorsAndServices', defaultOrMaker: VendorsAndServices.vendorsAndServicesNotSupported, valueOf: VendorsAndServices.valueOf, enumValues: VendorsAndServices.values)
    ..hasRequiredFields = false
  ;

  EntityTypesActions._() : super();
  factory EntityTypesActions({
    EntityTypes? entityType,
    EntityActions? entityAction,
    EntityStateGRPC? entityStateGRPC,
    VendorsAndServices? vendorsAndServices,
  }) {
    final _result = create();
    if (entityType != null) {
      _result.entityType = entityType;
    }
    if (entityAction != null) {
      _result.entityAction = entityAction;
    }
    if (entityStateGRPC != null) {
      _result.entityStateGRPC = entityStateGRPC;
    }
    if (vendorsAndServices != null) {
      _result.vendorsAndServices = vendorsAndServices;
    }
    return _result;
  }
  factory EntityTypesActions.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EntityTypesActions.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EntityTypesActions clone() => EntityTypesActions()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EntityTypesActions copyWith(void Function(EntityTypesActions) updates) => super.copyWith((message) => updates(message as EntityTypesActions)) as EntityTypesActions; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EntityTypesActions create() => EntityTypesActions._();
  EntityTypesActions createEmptyInstance() => create();
  static $pb.PbList<EntityTypesActions> createRepeated() => $pb.PbList<EntityTypesActions>();
  @$core.pragma('dart2js:noInline')
  static EntityTypesActions getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EntityTypesActions>(create);
  static EntityTypesActions? _defaultInstance;

  @$pb.TagNumber(35)
  EntityTypes get entityType => $_getN(0);
  @$pb.TagNumber(35)
  set entityType(EntityTypes v) { setField(35, v); }
  @$pb.TagNumber(35)
  $core.bool hasEntityType() => $_has(0);
  @$pb.TagNumber(35)
  void clearEntityType() => clearField(35);

  @$pb.TagNumber(36)
  EntityActions get entityAction => $_getN(1);
  @$pb.TagNumber(36)
  set entityAction(EntityActions v) { setField(36, v); }
  @$pb.TagNumber(36)
  $core.bool hasEntityAction() => $_has(1);
  @$pb.TagNumber(36)
  void clearEntityAction() => clearField(36);

  @$pb.TagNumber(37)
  EntityStateGRPC get entityStateGRPC => $_getN(2);
  @$pb.TagNumber(37)
  set entityStateGRPC(EntityStateGRPC v) { setField(37, v); }
  @$pb.TagNumber(37)
  $core.bool hasEntityStateGRPC() => $_has(2);
  @$pb.TagNumber(37)
  void clearEntityStateGRPC() => clearField(37);

  @$pb.TagNumber(46)
  VendorsAndServices get vendorsAndServices => $_getN(3);
  @$pb.TagNumber(46)
  set vendorsAndServices(VendorsAndServices v) { setField(46, v); }
  @$pb.TagNumber(46)
  $core.bool hasVendorsAndServices() => $_has(3);
  @$pb.TagNumber(46)
  void clearVendorsAndServices() => clearField(46);
}

