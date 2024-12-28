import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/mappers/mapper.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/transaction/entities.dart';
import 'package:trust_pay_beta/main/domain/entities/user/entities.dart';
import '../../domain/repository/repositories.dart';
import '../data_source/data_sources/remote_data_source.dart';

class UserRepositoryImplementation extends UserRepository {
  final RemoteDataSource _remoteDataSource;
  UserRepositoryImplementation(this._remoteDataSource);

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
  Future<Either<Failure, UserStatistics>> getUserStatistics(int id) async {
    try {
      final response = await _remoteDataSource.getUserStats(id);
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
  Future<Either<Failure, Transaction>> withdraw(double amount, int id) {
    // TODO: implement withdraw
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Transaction>> deposit(double amount, int id) {
    // TODO: implement deposit
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Transaction>> payBank(double amount, int id) {
    // TODO: implement payBank
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Transaction>> payCard(double amount, int id) {
    // TODO: implement payCard
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Transaction>> payWallet(double amount, int id) {
    // TODO: implement payWallet
    throw UnimplementedError();
  }

}
