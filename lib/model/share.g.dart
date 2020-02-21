// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShareSong _$ShareSongFromJson(Map<String, dynamic> json) {
  return ShareSong(
      json['user'] == null
          ? null
          : MyUser.fromJson(json['user'] as Map<String, dynamic>),
      json['name'] as String,
      json['content'] as String,
      json['agreeNum'] as int,
      json['downloadNum'] as int,
      json['collectionNum'] as int,
      json['instrument'] as int)
    ..createdAt = json['createdAt'] as String
    ..updatedAt = json['updatedAt'] as String
    ..objectId = json['objectId'] as String
    ..ACL = json['ACL'] as Map<String, dynamic>;
}

Map<String, dynamic> _$ShareSongToJson(ShareSong instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'objectId': instance.objectId,
      'ACL': instance.ACL,
      'user': instance.user,
      'name': instance.name,
      'content': instance.content,
      'agreeNum': instance.agreeNum,
      'downloadNum': instance.downloadNum,
      'collectionNum': instance.collectionNum,
      'instrument': instance.instrument
    };

SharePic _$SharePicFromJson(Map<String, dynamic> json) {
  return SharePic(
      json['url'] as String,
      json['shareSong'] == null
          ? null
          : ShareSong.fromJson(json['shareSong'] as Map<String, dynamic>))
    ..createdAt = json['createdAt'] as String
    ..updatedAt = json['updatedAt'] as String
    ..objectId = json['objectId'] as String
    ..ACL = json['ACL'] as Map<String, dynamic>;
}

Map<String, dynamic> _$SharePicToJson(SharePic instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'objectId': instance.objectId,
      'ACL': instance.ACL,
      'shareSong': instance.shareSong,
      'url': instance.url
    };
