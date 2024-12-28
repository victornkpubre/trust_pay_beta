import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/mappers/mapper.dart';
import '../../domain/entities/base/failures.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repository/repositories.dart';
import '../data_source/data_sources/remote_data_source.dart';

class AuthRepositoryImplementation extends AuthRepository {
  final RemoteDataSource _remoteDataSource;
  AuthRepositoryImplementation(this._remoteDataSource);

  //Authentication
  @override
  Future<Either<Failure, Authentication>> login(String email, String password) async {
    try {
      final response = await _remoteDataSource.login(email, password);
      print('printing response $response');
      if(response.status == 200) {
        return Right(response.toDomain());
      }
      else {
        return Left(Failure(response.status ?? 500, response.message?? 'error'));
      }
    } catch (error) {
      return Left(Failure(502, error.toString()));
    }
  }

  @override
  Future<Either<Failure, Authentication>> register(String firstname, String lastname, String email, String password) async {
    try {
      final response = await _remoteDataSource.register(firstname, lastname, email, password);
      if(response.status == 200) {
        //Return Response as Entity
        return Right(response.toDomain());
      }
      else {
        return Left(Failure( response.status ?? 500, response.message?? 'error' ));
      }
    } catch (error) {
      return Left(Failure(502, error.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> logout() async {
    try {
      final response = await _remoteDataSource.logout();
      if(response.status == 200) {
        //Return Response as Entity
        return Right(response.status!);
      }
      else {
        return Left(Failure( response.status ?? 500, response.message?? 'error' ));
      }
    } catch (error) {
      return Left(Failure(502, error.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> resetPassword(String token, String password) async {
    try {
      final response = await _remoteDataSource.resetPassword(token, password);
      if(response.status == 200) {
        //Return Response as Entity
        return Right(response.status!);
      }
      else {
        return Left(Failure( response.status ?? 500, response.message?? 'error' ));
      }
    } catch (error) {
      return Left(Failure(502, error.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> sendResetMail(int id) {
    // TODO: implement sendResetMail
    throw UnimplementedError();
  }

}
