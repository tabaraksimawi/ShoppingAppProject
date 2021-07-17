import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class UserModel {
  final String uid;
  final String fullName;
  final String email;

  UserModel({
    @required this.uid,
    @required this.fullName,
    @required this.email,
  });

  UserModel copyWith({
    String uid,
    String fullName,
    String email,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
    );
  }

  factory UserModel.init() {
    return UserModel(
      uid: '',
      fullName: '',
      email: '',
    );
  }

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      uid: doc.id,
      fullName: doc['fullName'],
      email: doc['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      fullName: map['fullName'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(uid: $uid, fullName: $fullName, email: $email)';
  }

  ///for more: https://api.dart.dev/stable/2.13.4/dart-core/Object/operator_equals.html
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.uid == uid &&
        other.fullName == fullName &&
        other.email == email;
  }

  @override
  int get hashCode {
    return uid.hashCode ^ fullName.hashCode ^ email.hashCode;
  }
}
