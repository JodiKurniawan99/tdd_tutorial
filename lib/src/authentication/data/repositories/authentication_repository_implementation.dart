import 'package:dartz/dartz.dart';
import 'package:tdd_tutorial/core/errors/exception.dart';
import 'package:tdd_tutorial/core/errors/failure.dart';
import 'package:tdd_tutorial/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:tdd_tutorial/src/authentication/domain/entities/user.dart';
import 'package:tdd_tutorial/core/utils/typedef.dart';
import 'package:tdd_tutorial/src/authentication/domain/repositories/authentication_respository.dart';

class AuthenticationRepositoryImplementation implements AuthenticationRepository{

  const AuthenticationRepositoryImplementation(this._remoteDataSource);

  final AuthenticationRemoteDataSource _remoteDataSource;
  @override
  ResultVoid createUser({required String createdAt, required String name, required String avatar}) async {
    //test driven development 
    //call the remote datasource 
    //check if the method return the proper data
    //make sure if returns the proper data if there is no exception
    // // check if when the remoteDataSource throw an exception, we return a failure

    try {
      await _remoteDataSource.createUser(createdAt: createdAt, name: name, avatar: avatar);
      return const Right(null);
    } on APIException catch(e) {
      return Left(ApiFailure(message: e.message, statusCode: e.statusCode));
    }
  }


  @override
  ResultFuture<List<User>> getUsers() async {
    throw UnimplementedError();
  }

}