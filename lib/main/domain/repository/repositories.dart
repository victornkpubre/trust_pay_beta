import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

abstract class AuthRepository {
  Future<Either<Failure, Authentication>> login(String email, String password);
  Future<Either<Failure, Authentication>> register(String firstname, String lastname, String email, String password);
  Future<Either<Failure, int>> logout();
  Future<Either<Failure, int>> resetPassword(String token, String password);
  Future<Either<Failure, int>> sendResetMail(int id);
}

abstract class UserRepository {
  Future<Either<Failure, User>> getUser(int id);
  // Future<Either<Failure, UserStatistics>> getUserStatistics(int id);
  Future<Either<Failure, List<User>>> searchUser(String text, int pageSize, int page);
  Future<Either<Failure, Transaction>> deposit(double amount, int id);
  Future<Either<Failure, Transaction>> withdraw(double amount, int id);
  Future<Either<Failure, Transaction>> payWallet(double amount, int id);
  Future<Either<Failure, Transaction>> payCard(double amount, int id);
  Future<Either<Failure, Transaction>> payBank(double amount, int id);
}

abstract class TransactionRepository {
  Future<Either<Failure, List<Transaction>>> getUserHistory(int id, int pageSize, int page);
  Future<Either<Failure, Transaction>> getTransaction(int id);
  Future<Either<Failure, Transaction>> createTransaction(Transaction transaction);
  Future<Either<Failure, Transaction>> updateTransaction(Transaction transaction);
  Future<Either<Failure, List<Transaction>>> searchTransaction(String text, int pageSize, int page);
  // Future<Either<Failure, TransactionStatistics>> getTransactionStatistics(int id);
  Future<Either<Failure, Obligation>> updateObligation(Obligation obligation);
  Future<Either<Failure, int>> setObligationToken(int transactionId, Obligation obligation, String token);
  Future<Either<Failure, int>> setObligationStatus(int transactionId, Obligation obligation, ObligationStatus status);
  Future<Either<Failure, Notification>> createNotification(Notification notification);
}
