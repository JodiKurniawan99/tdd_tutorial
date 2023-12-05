//What does the class depends on
//answer: AutheticationRespository

//How can we create a fake version of the depedency 
//answer: use Mocktail

//How do we control what our depedencies do
//answer: using the mocktail API

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_tutorial/src/authentication/domain/repositories/authentication_respository.dart';
import 'package:tdd_tutorial/src/authentication/domain/usecase/create_user.dart';

import 'authentication_repository.mock.dart';


void main() {
  late CreateUser usecase;
  late AuthenticationRepository repository;

  setUp(() {
    repository = MockAutoRepo();
    usecase = CreateUser(repository);
  });

  const params = CreateUserParams.empty();

//thenAnswer used for asyncronous function

//Right is subclass from Either, is used if function succesfully.
  test(
    'Should call the [AuthRepo.createUser]', 
    () async {
      //Arrange
      //STUB
      when(() => repository.createUser(
        createdAt: any(named: 'createdAt'), 
        name: any(named: 'name'), 
        avatar: any(named: 'avatar')
        )
      ).thenAnswer((_) async => const Right(null));

      //act 
      final result = await usecase(params);

      //Assert 
      expect(result, equals(Right<dynamic, void>(null)));
      verify(
        () => repository.createUser(
          createdAt: params.createdAt, 
          name: params.name, 
          avatar: params.avatar
        )
      ).called(1);

      verifyNoMoreInteractions(repository);

    }
  );
    
}