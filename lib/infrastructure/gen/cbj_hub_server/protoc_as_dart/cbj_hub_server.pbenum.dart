//
//  Generated code. Do not modify.
//  source: cbj_hub_server.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// / Being added to send data for explain the type that was sent
class SendingType extends $pb.ProtobufEnum {
  static const SendingType undefinedType = SendingType._(0, _omitEnumNames ? '' : 'undefinedType');
  static const SendingType stringType = SendingType._(1, _omitEnumNames ? '' : 'stringType');
  static const SendingType partialEntityType = SendingType._(2, _omitEnumNames ? '' : 'partialEntityType');
  static const SendingType entityType = SendingType._(3, _omitEnumNames ? '' : 'entityType');
  static const SendingType mqttMassageType = SendingType._(4, _omitEnumNames ? '' : 'mqttMassageType');
  static const SendingType sceneType = SendingType._(5, _omitEnumNames ? '' : 'sceneType');
  static const SendingType scheduleType = SendingType._(6, _omitEnumNames ? '' : 'scheduleType');
  static const SendingType routineType = SendingType._(7, _omitEnumNames ? '' : 'routineType');
  static const SendingType bindingsType = SendingType._(8, _omitEnumNames ? '' : 'bindingsType');
  static const SendingType vendorLoginType = SendingType._(9, _omitEnumNames ? '' : 'vendorLoginType');
  static const SendingType firstConnection = SendingType._(10, _omitEnumNames ? '' : 'firstConnection');
  static const SendingType remotePipesInformation = SendingType._(11, _omitEnumNames ? '' : 'remotePipesInformation');
  static const SendingType getHubEntityInfo = SendingType._(12, _omitEnumNames ? '' : 'getHubEntityInfo');
  static const SendingType responseHubEntityInfo = SendingType._(13, _omitEnumNames ? '' : 'responseHubEntityInfo');
  static const SendingType roomType = SendingType._(14, _omitEnumNames ? '' : 'roomType');
  static const SendingType location = SendingType._(15, _omitEnumNames ? '' : 'location');

  static const $core.List<SendingType> values = <SendingType> [
    undefinedType,
    stringType,
    partialEntityType,
    entityType,
    mqttMassageType,
    sceneType,
    scheduleType,
    routineType,
    bindingsType,
    vendorLoginType,
    firstConnection,
    remotePipesInformation,
    getHubEntityInfo,
    responseHubEntityInfo,
    roomType,
    location,
  ];

  static final $core.Map<$core.int, SendingType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SendingType? valueOf($core.int value) => _byValue[value];

  const SendingType._($core.int v, $core.String n) : super(v, n);
}

/// / List of purposes that each area in the home can have
class AreaPurposesTypes extends $pb.ProtobufEnum {
  static const AreaPurposesTypes bedroom = AreaPurposesTypes._(0, _omitEnumNames ? '' : 'bedroom');
  static const AreaPurposesTypes studyRoom = AreaPurposesTypes._(1, _omitEnumNames ? '' : 'studyRoom');
  static const AreaPurposesTypes workRoom = AreaPurposesTypes._(2, _omitEnumNames ? '' : 'workRoom');
  static const AreaPurposesTypes tvRoom = AreaPurposesTypes._(3, _omitEnumNames ? '' : 'tvRoom');
  static const AreaPurposesTypes videoGames = AreaPurposesTypes._(4, _omitEnumNames ? '' : 'videoGames');
  static const AreaPurposesTypes livingRoom = AreaPurposesTypes._(5, _omitEnumNames ? '' : 'livingRoom');
  static const AreaPurposesTypes diningRoom = AreaPurposesTypes._(6, _omitEnumNames ? '' : 'diningRoom');
  static const AreaPurposesTypes kitchen = AreaPurposesTypes._(7, _omitEnumNames ? '' : 'kitchen');
  static const AreaPurposesTypes outside = AreaPurposesTypes._(8, _omitEnumNames ? '' : 'outside');
  static const AreaPurposesTypes outsidePrimary = AreaPurposesTypes._(9, _omitEnumNames ? '' : 'outsidePrimary');
  static const AreaPurposesTypes outsideNotPrimary = AreaPurposesTypes._(10, _omitEnumNames ? '' : 'outsideNotPrimary');
  static const AreaPurposesTypes toiletRoom = AreaPurposesTypes._(11, _omitEnumNames ? '' : 'toiletRoom');
  static const AreaPurposesTypes shower = AreaPurposesTypes._(12, _omitEnumNames ? '' : 'shower');
  static const AreaPurposesTypes trainingRoom = AreaPurposesTypes._(13, _omitEnumNames ? '' : 'trainingRoom');
  static const AreaPurposesTypes meditation = AreaPurposesTypes._(14, _omitEnumNames ? '' : 'meditation');
  static const AreaPurposesTypes romantic = AreaPurposesTypes._(15, _omitEnumNames ? '' : 'romantic');
  static const AreaPurposesTypes stairsInside = AreaPurposesTypes._(16, _omitEnumNames ? '' : 'stairsInside');
  static const AreaPurposesTypes stairsOutside = AreaPurposesTypes._(17, _omitEnumNames ? '' : 'stairsOutside');
  static const AreaPurposesTypes childrenRoom = AreaPurposesTypes._(18, _omitEnumNames ? '' : 'childrenRoom');
  static const AreaPurposesTypes cinemaRoom = AreaPurposesTypes._(19, _omitEnumNames ? '' : 'cinemaRoom');
  static const AreaPurposesTypes boardGames = AreaPurposesTypes._(20, _omitEnumNames ? '' : 'boardGames');
  static const AreaPurposesTypes bathtub = AreaPurposesTypes._(21, _omitEnumNames ? '' : 'bathtub');
  static const AreaPurposesTypes laundryRoom = AreaPurposesTypes._(22, _omitEnumNames ? '' : 'laundryRoom');
  static const AreaPurposesTypes protectedSpace = AreaPurposesTypes._(23, _omitEnumNames ? '' : 'protectedSpace');
  static const AreaPurposesTypes safeRoom = AreaPurposesTypes._(24, _omitEnumNames ? '' : 'safeRoom');
  static const AreaPurposesTypes attic = AreaPurposesTypes._(25, _omitEnumNames ? '' : 'attic');
  static const AreaPurposesTypes holidayCabin = AreaPurposesTypes._(26, _omitEnumNames ? '' : 'holidayCabin');

  static const $core.List<AreaPurposesTypes> values = <AreaPurposesTypes> [
    bedroom,
    studyRoom,
    workRoom,
    tvRoom,
    videoGames,
    livingRoom,
    diningRoom,
    kitchen,
    outside,
    outsidePrimary,
    outsideNotPrimary,
    toiletRoom,
    shower,
    trainingRoom,
    meditation,
    romantic,
    stairsInside,
    stairsOutside,
    childrenRoom,
    cinemaRoom,
    boardGames,
    bathtub,
    laundryRoom,
    protectedSpace,
    safeRoom,
    attic,
    holidayCabin,
  ];

  static final $core.Map<$core.int, AreaPurposesTypes> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AreaPurposesTypes? valueOf($core.int value) => _byValue[value];

  const AreaPurposesTypes._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
