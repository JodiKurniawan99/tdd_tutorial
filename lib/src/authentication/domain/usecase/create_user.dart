import 'package:equatable/equatable.dart';
import 'package:tdd_tutorial/src/authentication/domain/repositories/authentication_respository.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedef.dart';

class CreateUser extends UseCaseWithParams<void, CreateUserParams> {
  const CreateUser(this._repository);

  final AuthenticationRepository _repository;
  
  @override
  ResultVoid call(params) async => _repository.createUser(
    createdAt: params.createdAt, 
    name: params.name, 
    avatar: params.avatar
  );
}

class CreateUserParams extends Equatable {
  
  const CreateUserParams({
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  //for testing
  const CreateUserParams.empty()
  : this(
    createdAt: '_empty.createdAt',
    name: '_empty.name',
    avatar: '_empty.avatar',
  );

  final String createdAt;
  final String name;
  final String avatar;
  
  @override
  List<Object?> get props => [createdAt, name, avatar];

}
