import 'dart:nativewrappers/_internal/vm/bin/vmservice_io.dart';

import 'package:blog_project/core/error/exceptions.dart';
import 'package:blog_project/core/error/failures.dart';
import 'package:blog_project/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_project/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSourceImpl;
  const AuthRepositoryImpl(this.remoteDataSourceImpl);
  @override
  Future<Either<Failure, String>> loginWithEmailPassword({required String email, required String password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword({required String name, required String email, required String password}) async{
    try{
    final userId = await  remoteDataSourceImpl.signUpWithEmailPassword(name: name, email: email, password: password);

    return right(userId);

    }
    on ServerException catch(e){
      return left(Failure(e.message));
    }
  }

}
