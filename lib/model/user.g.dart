// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyUser _$MyUserFromJson(Map<String, dynamic> json) {
  return MyUser(json['header'] as String, json['lastSignInDate'] as String,
      json['contribution'] as int, json['versionFlag'] as String)
    ..createdAt = json['createdAt'] as String
    ..updatedAt = json['updatedAt'] as String
    ..objectId = json['objectId'] as String
    ..ACL = json['ACL'] as Map<String, dynamic>
    ..username = json['username'] as String
    ..password = json['password'] as String
    ..email = json['email'] as String
    ..emailVerified = json['emailVerified'] as bool
    ..mobilePhoneNumber = json['mobilePhoneNumber'] as String
    ..mobilePhoneNumberVerified = json['mobilePhoneNumberVerified'] as bool
    ..sessionToken = json['sessionToken'] as String
    ..collections = json['collections'] == null
        ? null
        : BmobRelation.fromJson(json['collections'] as Map<String, dynamic>);
}

Map<String, dynamic> _$MyUserToJson(MyUser instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'objectId': instance.objectId,
      'ACL': instance.ACL,
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'emailVerified': instance.emailVerified,
      'mobilePhoneNumber': instance.mobilePhoneNumber,
      'mobilePhoneNumberVerified': instance.mobilePhoneNumberVerified,
      'sessionToken': instance.sessionToken,
      'header': instance.header,
      'lastSignInDate': instance.lastSignInDate,
      'contribution': instance.contribution,
      'collections': instance.collections,
      'versionFlag': instance.versionFlag
    };
