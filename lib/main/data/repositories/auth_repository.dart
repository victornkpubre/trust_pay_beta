import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/local_data_source.dart';
import 'package:trust_pay_beta/main/data/data_source/local_database/preferences.dart';
import 'package:trust_pay_beta/main/data/mappers/mapper.dart';
import 'package:trust_pay_beta/main/data/responses/base/responses.dart';
import '../../domain/entities/base/failures.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repository/repositories.dart';
import '../data_source/data_sources/remote_data_source.dart';

class AuthRepositoryImplementation extends AuthRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final AppPreferences _appPreferences;
  AuthRepositoryImplementation(this._remoteDataSource, this._localDataSource, this._appPreferences);

  //Authentication
  @override
  Future<Either<Failure, Authentication>> login(String email, String password) async {
    try {
      final response = await _remoteDataSource.login(email, password);
      print('Printing response: $response');

      if (response.status == 200) {
        return Right(response.toDomain());
      } else {
        return Left(Failure(response.status ?? 500, response.message ?? 'Error occurred'));
      }
    } on DioException catch (error) {
      final statusCode = error.response?.statusCode ?? 500;
      final message = error.response?.data?['message'] ?? 'Error occurred';
      return Left(Failure(statusCode, message));
    } catch (e) {
      return Left(Failure.fromError(e));
    }
  }

  @override
  Future<Either<Failure, Authentication>> register(String firstname, String lastname, String email, String password, File profileImage) async {
    try {
      final response = await _remoteDataSource.register(firstname, lastname, email, password, profileImage);
      if(response.status == 200) {
        //Return Response as Entity
        return Right(response.toDomain());
      }
      else {
        return Left(Failure( response.status ?? 500, response.message?? 'error' ));
      }
    } catch (error) {
      return Left(Failure.fromError(error));
    }
  }

  @override
  Future<Either<Failure, Authentication>> loginWithGoogle(String idToken) async {
    try {
      final response = await _remoteDataSource.loginWithGoogle(idToken);
      if (response.status == 200) {
        return Right(response.toDomain());
      } else {
        return Left(Failure(response.status ?? 500, response.message ?? 'Error occurred'));
      }
    } on DioException catch (error) {
      final statusCode = error.response?.statusCode ?? 500;
      final message = error.response?.data?['message'] ?? 'Error occurred';
      return Left(Failure(statusCode, message));
    } catch (e) {
      return Left(Failure.fromError(e));
    }
  }

  @override
  Future<Either<Failure, int>> logout() async {
    BaseResponse? response;
    final localOnly = (await _appPreferences.getAccessToken())==null;
    try {
      if(!localOnly) {
        response = await _remoteDataSource.logout();
      }
      if(response?.status == 200 || localOnly) {
        //Return Response as Entity
        return const Right(200);
      }
      else {
        return Left(Failure( response?.status ?? 500, response?.message?? 'error' ));
      }
    } catch (error) {
      final errMessage = error is DioException ? error.response?.data['message'] : null;
      if(errMessage=='Unauthenticated.'){
        return const Right(200);
      }
      return Left(Failure.fromError(error));
    }
  }

  @override
  Future<bool> readAuthState() async {
    return _localDataSource.readUserAuthState();
  }

  @override
  Future<void> setAuthState(bool state) async {
    return _localDataSource.setUserAuthState(state);
  }

  @override
  User? readCurrentUser() {
    return _localDataSource.readCurrentUser();
  }

  @override
  Future<void> setCurrentUser(User user) async {
    return _localDataSource.storeCurrentUser(user);
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
      return Left(Failure.fromError(error));
    }
  }

  @override
  Future<Either<Failure, int>> sendResetMail(int id) {
    // TODO: implement sendResetMail
    throw UnimplementedError();
  }

  @override
  Future<void> clearLocalStorage() {
    return _localDataSource.clearLocalStorage();
  }

}
