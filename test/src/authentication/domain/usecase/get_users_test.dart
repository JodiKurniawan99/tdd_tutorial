import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_tutorial/src/authentication/domain/entities/user.dart';
import 'package:tdd_tutorial/src/authentication/domain/repositories/authentication_respository.dart';
import 'package:tdd_tutorial/src/authentication/domain/usecase/get_users.dart';

import 'authentication_repository.mock.dart';



void main() {
  late GetUsers usecase;
  late AuthenticationRepository repository;

  setUp(() {
    repository = MockAutoRepo();
    usecase = GetUsers(repository);
  });

  const tResponse = [User.empty()];

  test('should call [AuthRepo.getUsers] and return [List<User>]', 
  () async {
    //arrange
    when(() => repository.getUsers()).thenAnswer(
      (_) async => const Right(tResponse),
    );

    //act
    final result = await usecase();

    //assert
    expect(result, equals(const Right<dynamic, List<User>>(tResponse)));
    verify(() => repository.getUsers()).called(1);
    verifyNoMoreInteractions(repository);
  },
  );
  
}