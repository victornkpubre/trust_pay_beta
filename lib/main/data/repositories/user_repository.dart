import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/local_data_source.dart';
import 'package:trust_pay_beta/main/data/mappers/mapper.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/payment/entities.dart';
import 'package:trust_pay_beta/main/domain/entities/transaction/entities.dart';
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
      return Left(Failure.fromError(error));
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
      return Left(Failure.fromError(error));
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
      return Left(Failure.fromError(error));
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
      return Left(Failure.fromError(error));
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
      return Left(Failure.fromError(error));
    }
  }

  @override
  Future<Either<Failure, User>> payWallet(double amount, int id, String currency) async {
    try {
      final response = await _remoteDataSource.payAccount(id, amount, currency);
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
      return Left(Failure.fromError(error));
    }
  }

  @override
  Future<Either<Failure, User>> escrowPayout(int transactionId, int toUserId, double amount, String currency) async {
    try {
      final response = await _remoteDataSource.escrowPayout(transactionId, toUserId, amount, currency);
      if(response.status == 200) {
        return Right(response.toDomain());
      }
      else {
        return Left(Failure(response.status ?? 500, response.message?? 'error'));
      }
    } catch (error) {
      return Left(Failure.fromError(error));
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
      return Left(Failure.fromError(error));
    }
  }

  @override
  Future<Either<Failure, User>> updateUser(User user) async {
    try {
      final response = await _remoteDataSource.updateUser(user);
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
      return Left(Failure.fromError(error));
    }
  }

  @override
  Future<Either<Failure, User>> updateUserImage(int userId, File image) async {
    try {
      final response = await _remoteDataSource.updateUserImage(userId, image);
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
      return Left(Failure.fromError(error));
    }
  }

  @override
  Future<Either<Failure, List<Notification>>> getUserNotifications() async {
    try {
      final response = await _remoteDataSource.getUserNotification();
      if(response.status == 200) {
        final notifications = response.toDomain();
        return Right(notifications);
      }
      else {
        return Left(Failure(response.status ?? 500, response.message?? 'error'));
      }
    } catch (error) {
      return Left(Failure.fromError(error));
    }
  }

  @override
  Future<Either<Failure, User>> getMediator(User user, User bettor) async {
    try {
      final response = await _remoteDataSource.getMediator( user, bettor);
      if(response.status == 200) {
        final notifications = response.toDomain();
        return Right(notifications);
      }
      else {
        return Left(Failure(response.status ?? 500, response.message?? 'error'));
      }
    } catch (error) {
      return Left(Failure.fromError(error));
    }
  }

  @override
  Future<Either<Failure, List<AccountHistory>>> getAccountHistory(int accountId) async {
    try {
      final response = await _remoteDataSource.getAccountHistory(accountId);
      if(response.status == 200) {
        final history = response.toDomain();
        return Right(history);
      }
      else {
        return Left(Failure(response.status ?? 500, response.message?? 'error'));
      }
    } catch (error) {
      return Left(Failure.fromError(error));
    }
  }

  @override
  Future<Either<Failure, User>> setFcmToken(User user, String token) async {
    try {
      final response = await _remoteDataSource.setFcmToken(user, token);
      if(response.status == 200) {
        return Right(response.toDomain());
      }
      else {
        return Left(Failure(response.status ?? 500, response.message?? 'error'));
      }
    } catch (error) {
      return Left(Failure.fromError(error));
    }
  }

  @override
  Future<Either<Failure, List<Account>>> getAccounts(int userId) async {
    try {
      final response = await _remoteDataSource.getAccounts(userId);
      if(response.status == 200) {
        return Right(response.toDomain());
      }
      else {
        return Left(Failure(response.status ?? 500, response.message?? 'error'));
      }
    } catch (error) {
      return Left(Failure.fromError(error));
    }
  }

  @override
  Future<Either<Failure, DepositCheckout>> initiateDeposit(int amount, String currency) async {
    try {
      final response = await _remoteDataSource.initiateDeposit(amount, currency);
      if(response.status == 200) {
        return Right(response.toDomain());
      }
      else {
        return Left(Failure(response.status ?? 500, response.message?? 'error'));
      }
    } catch (error) {
      return Left(Failure.fromError(error));
    }
  }

  @override
  Future<Either<Failure, PaymentStatus>> getPaymentStatus(int paymentId) async {
    try {
      final response = await _remoteDataSource.getPaymentStatus(paymentId);
      if(response.status == 200) {
        return Right(response.toDomain());
      }
      else {
        return Left(Failure(response.status ?? 500, response.message?? 'error'));
      }
    } catch (error) {
      return Left(Failure.fromError(error));
    }
  }

}
