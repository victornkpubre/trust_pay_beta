import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/local_data_source.dart';
import 'package:trust_pay_beta/main/data/mappers/mapper.dart';
import 'package:trust_pay_beta/main/domain/entities/base/entities.dart';
import '../../domain/entities/base/failures.dart';
import '../../domain/entities/transaction/entities.dart';
import '../../domain/entities/user/entities.dart';
import '../../domain/repository/repositories.dart';
import '../data_source/data_sources/remote_data_source.dart';

class TransactionRepositoryImplementation extends TransactionRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  TransactionRepositoryImplementation(this._remoteDataSource, this._localDataSource);


  @override
  Future<Either<Failure, Transaction>> createTransaction(Transaction transaction, File? source) async {
    try {
      final response = await _remoteDataSource.createTransaction(transaction);
      if(response.status == 200) {

        Transaction result;
        //save mediation source
        if(response.toDomain().mediation!=null) {
          final mediationResponse = await _remoteDataSource.saveMediationSource(response.toDomain(), source);
          if(mediationResponse.status!=200) {
            return Left(Failure( 500,  'mediation error'));
          }
          else {
            result = response.toDomain().copyWith(mediation: mediationResponse.toDomain());
          }
        }
        else {
          result = response.toDomain();
        }

        //Update Local DB
        await _localDataSource.storeTransaction(result);

        //Return Result
        return Right(result);

      }
      else {
        return Left(Failure(response.status ?? 500, response.message?? 'error'));
      }
    } catch (error) {
      return Left(Failure.fromError(error));
    }
  }

  @override
  Future<Either<Failure, Transaction>> getTransaction(int id) async {

    //Check Local DB
    final result = await _localDataSource.readTransaction(id);
    if(result != null){
      return Right(result);
    }

    //Call Remote DB
    try {
      final response = await _remoteDataSource.getTransaction(id);
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
  Future<Either<Failure, List<Transaction>>> searchTransaction(String text, int pageSize, int page) async {
    try {
      final response = await _remoteDataSource.searchTransaction(text, pageSize, page);
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
  Future<Either<Failure, Transaction>> updateTransaction(Transaction transaction) async {
    if(transaction.id == null) {
      return Left(Failure(500, 'invalid form'));
    }

    try {
      final response = await _remoteDataSource.updateTransaction(transaction.id!, transaction);
      if(response.status == 200) {
        //Update Local DB
        await _localDataSource.updateTransaction(response.toDomain());

        //Return result
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
  Future<Either<Failure, List<Transaction>>> getUserHistory(int id, int pageSize, int page) async {

    try {
      final response = await _remoteDataSource.getUserHistory(id, pageSize, page);
      if(response.status == 200) {
        List<Transaction> result = response.toDomain();

        //Update Local DB
        await _localDataSource.storeTransactionHistory(result);

        return Right(result);
      }
      else {
        //Check Local DB
        final result = await _localDataSource.readTransactionHistory(pageSize, page);
        if(result?.isNotEmpty??false) {
          return Right(result!);
        }
        else{
          return Left(Failure(response.status ?? 500, response.message?? 'error'));
        }

      }
    } catch (error) {
      return Left(Failure.fromError(error));
    }
  }

  //if(result?.isNotEmpty??false)

  // @override
  // Future<Either<Failure, TransactionStatistics>> getTransactionStatistics(int id) async {
  //   try {
  //     final response = await _remoteDataSource.getTransactionStats(id);
  //     if(response.status == 200) {
  //       return Right(response.toDomain());
  //     }
  //     else {
  //       return Left(Failure(response.status ?? 500, response.message?? 'error'));
  //     }
  //   } catch (error) {
  //     return Left(Failure.fromError(error));
  //   }
  // }

  @override
  Future<Either<Failure, int>> setObligationStatus(int transactionId, Obligation obligation, ObligationStatus status) async {
    if(obligation.id == null) {
      return Left(Failure(500, 'invalid form'));
    }

    try {
      final response = await _remoteDataSource.setObligationStatus(obligation.id??-1, status.name);
      if(response.status == 200) {
        //Update Local DB
        await _localDataSource.updateTransactionObligation(transactionId, obligation.copyWith(status: status));

        return const Right(200);
      }
      else {
        return Left(Failure(response.status ?? 500, response.message?? 'error'));
      }
    } catch (error) {
      return Left(Failure.fromError(error));
    }
  }

  @override
  Future<Either<Failure, int>> setObligationToken(int transactionId, Obligation obligation, String token) async {
    if(obligation.id == null) {
      return Left(Failure(500, 'invalid form'));
    }

    try {
      final response = await _remoteDataSource.setObligationToken(obligation.id??-1, token);
      if(response.status == 200) {
        //Update Local DB
        await _localDataSource.updateTransactionObligation(transactionId, obligation.copyWith(token: token));

        return const Right(200);
      }
      else {
        return Left(Failure(response.status ?? 500, response.message?? 'error'));
      }
    } catch (error) {
      return Left(Failure.fromError(error));
    }
  }

  @override
  Future<Either<Failure, Obligation>> updateObligation(int transactionId, Obligation obligation) async {
    try {
      final response = await _remoteDataSource.updateObligation(obligation);
      if(response.status == 200) {
        //Update Local DB
        await _localDataSource.updateTransactionObligation(transactionId, obligation);
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
  Future<Either<Failure, Notification>> createNotification(Notification notification,  User? user) async {
    try {
      final response = await _remoteDataSource.createNotification(notification, receiver: user);
      if(response.status == 200) {
        //Update Local DB
        _localDataSource.storeNotification(notification);

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
  Future<Either<Failure, Transaction>> storeTransaction(Transaction transaction) async {
    try{
      //Update Local DB
      await _localDataSource.storeTransaction(transaction);
      return Right(transaction);
    }
    catch (e){
      return Left(Failure.fromError(e));
    }
  }

  @override
  Future<Either<Failure, Notification>> updateNotification(User? user, Transaction? transaction, int? notificationId, NotificationState state) async {
    int id = -1;
    if(notificationId != null ) {
      id = notificationId;
    }
    else {
      if(user != null && transaction != null) {
        final response = await _localDataSource.readNotifications();
        if(response != null) {
          final notification = response.firstWhere((n) => n.user.id==user.id && n.transaction?.id==transaction.id);
          id = notification.id??-1;
        }
      }
    }

    if(id != -1) {
      try {
        final response = await _remoteDataSource.updateNotification(id, state);
        if(response.status == 200) {
          //Update Local DB
          final notification = response.toDomain();
          _localDataSource.storeNotification(notification);
          return Right(notification);
        }
        else {
          return Left(Failure(response.status ?? 500, response.message?? 'error'));
        }
      }
      catch (error) {
        return Left(Failure.fromError(error));
      }
    }
    else {
      return Left(Failure(502, 'Bad State'));
    }

  }
}



