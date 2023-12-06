import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_tutorial/core/utils/typedef.dart';
import 'package:tdd_tutorial/src/authentication/data/models/user_model.dart';
import 'package:tdd_tutorial/src/authentication/domain/entities/user.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tModel = UserModel.empty();
  test('Should be a subclass of [User] entity', () {
    //act
    //dont need act

    //assert
    expect(tModel, isA<User>());
  });

  final tJson = fixture('user.json');
  final tMap = jsonDecode(tJson) as DataMap;

  group('fromMap', () {
    test('should return a [UserModel] with the right data', () {
    //act
    final result = UserModel.fromMap(tMap);
    expect(result, equals(tModel));
    });
   });

   group('fromJson', () {
    test('should return a [UserModel] with the right data', () {
    //act
    final result = UserModel.fromJson(tJson);
    expect(result, equals(tModel));
    });
   });

   group('toMap', () {
    test('should return a [Map] with the right data', () {
    //act
    final result = tModel.toMap();
    expect(result, equals(tMap));
    });
   });

   group('toJson', () {
    test('should return a [JSON] string with the right data', () {
    //act
    final result = tModel.toJson();
    final tJson = jsonEncode({"id":"1","createdAt":"_empty.createdAt","name":"_empty.name","avatar":"_empty.avatar"});
    expect(result, equals(tJson));
    });
   });

   group('copyWith', () {
    test('should return a [UserModel] with different data', () {
    //act
    final result = tModel.copyWith(name: 'Jodi');
    expect(result.name, equals('Jodi'));
    });
   });


}