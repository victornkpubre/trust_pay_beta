import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/local_data_source.dart';
import 'package:trust_pay_beta/main/data/mappers/mapper.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/user/entities.dart';
import '../../domain/repository/repositories.dart';
import '../data_source/data_sources/remote_data_source.dart';

class UserRepositoryImplementation extends UserRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  UserRepositoryImplementation(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, User>> getUser(int id) async {
    try {
      final response = await _remoteDataSource.getUser(id);
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
  Future<Either<Failure, List<User>>> searchUser(String text, int pageSize, int page) async {
    try {
      final response = await _remoteDataSource.searchUser(text, pageSize, page);
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
  Future<Either<Failure, User>> deposit(double amount, int id) async {
    try {
      final response = await _remoteDataSource.deposit(id, amount);
      if(response.status == 200) {
        final user = response.toDomain();
        //Update Local DB
        _localDataSource.storeCurrentUser(user);

        return Right(user);
      }
      else {
        return Left(Failure(response.status ?? 500, response.message?? 'error'));
      }
    } catch (error) {
      return Left(Failure(502, error.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> payBank(double amount, int id) async {
    try {
      final response = await _remoteDataSource.payBank(id, amount);
      if(response.status == 200) {
        final user = response.toDomain();
        //Update Local DB
        _localDataSource.storeCurrentUser(user);

        return Right(user);
      }
      else {
        return Left(Failure(response.status ?? 500, response.message?? 'error'));
      }
    } catch (error) {
      return Left(Failure(502, error.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> payCard(double amount, int id) async {
    try {
      final response = await _remoteDataSource.payCard(id, amount);
      if(response.status == 200) {
        final user = response.toDomain();
        //Update Local DB
        _localDataSource.storeCurrentUser(user);

        return Right(user);
      }
      else {
        return Left(Failure(response.status ?? 500, response.message?? 'error'));
      }
    } catch (error) {
      return Left(Failure(502, error.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> payWallet(double amount, int id) async {
    try {
      final response = await _remoteDataSource.payAccount(id, amount);
      if(response.status == 200) {
        final user = response.toDomain();
        //Update Local DB
        _localDataSource.storeCurrentUser(user);

        return Right(user);
      }
      else {
        return Left(Failure(response.status ?? 500, response.message?? 'error'));
      }
    } catch (error) {
      return Left(Failure(502, error.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> withdraw(double amount, int id) async {
    try {
      final response = await _remoteDataSource.withdraw(id, amount);
      if(response.status == 200) {
        final user = response.toDomain();
        //Update Local DB
        _localDataSource.storeCurrentUser(user);

        return Right(user);
      }
      else {
        return Left(Failure(response.status ?? 500, response.message?? 'error'));
      }
    } catch (error) {
      return Left(Failure(502, error.toString()));
    }
  }
}
