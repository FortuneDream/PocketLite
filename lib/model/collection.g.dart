// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionSong _$CollectionSongFromJson(Map<String, dynamic> json) {
  return CollectionSong(
      json['name'] as String, json['content'] as String, json['isFrom'] as int)
    ..createdAt = json['createdAt'] as String
    ..updatedAt = json['updatedAt'] as String
    ..objectId = json['objectId'] as String
    ..ACL = json['ACL'] as Map<String, dynamic>;
}

Map<String, dynamic> _$CollectionSongToJson(CollectionSong instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'objectId': instance.objectId,
      'ACL': instance.ACL,
      'name': instance.name,
      'content': instance.content,
      'isFrom': instance.isFrom
    };

CollectionPic _$CollectionPicFromJson(Map<String, dynamic> json) {
  return CollectionPic(
      json['collectionSong'] == null
          ? null
          : CollectionSong.fromJson(
              json['collectionSong'] as Map<String, dynamic>),
      json['url'] as String)
    ..createdAt = json['createdAt'] as String
    ..updatedAt = json['updatedAt'] as String
    ..objectId = json['objectId'] as String
    ..ACL = json['ACL'] as Map<String, dynamic>;
}

Map<String, dynamic> _$CollectionPicToJson(CollectionPic instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'objectId': instance.objectId,
      'ACL': instance.ACL,
      'collectionSong': instance.collectionSong?.toJson(),
      'url': instance.url
    };
