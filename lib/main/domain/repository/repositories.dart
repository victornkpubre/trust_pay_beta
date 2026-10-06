import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

abstract class AuthRepository {
  Future<Either<Failure, Authentication>> login(String email, String password);
  Future<Either<Failure, Authentication>> register(String firstname, String lastname, String email, String password, File profileImage);
  Future<Either<Failure, Authentication>> loginWithGoogle(String idToken);
  Future<Either<Failure, int>> logout();
  Future<Either<Failure, int>> resetPassword(String token, String password);
  Future<Either<Failure, int>> sendResetMail(int id);
  Future<void> clearLocalStorage();
  Future<void> setAuthState(bool state);
  Future<bool> readAuthState();
  User? readCurrentUser();
  Future<void> setCurrentUser(User user);
}

abstract class UserRepository {
  Future<Either<Failure, User>> getUser(int id);
  Future<Either<Failure, User>> updateUser(User user);
  Future<Either<Failure, User>> updateUserImage(int userId, File image);
  Future<Either<Failure, List<User>>> searchUser(String text, int pageSize, int page);
  Future<Either<Failure, User>> deposit(double amount, int id);
  Future<Either<Failure, User>> withdraw(double amount, int id);
  Future<Either<Failure, User>> payWallet(double amount, int id, String currency);
  Future<Either<Failure, User>> payCard(double amount, int id);
  Future<Either<Failure, User>> payBank(double amount, int id);
  Future<Either<Failure, User>> escrowPayout(int transactionId, int toUserId, double amount, String currency);
  Future<Either<Failure, List<Notification>>> getUserNotifications();
  Future<Either<Failure, User>> getMediator(User user, User bettor);
  Future<Either<Failure, List<AccountHistory>>> getAccountHistory(int accountId);
  Future<Either<Failure, User>> setFcmToken(User user, String token);

  Future<Either<Failure, List<Account>>> getAccounts(int userId);
  Future<Either<Failure, DepositCheckout>> initiateDeposit(int amount, String currency);
  Future<Either<Failure, PaymentStatus>> getPaymentStatus(int paymentId);
}

abstract class TransactionRepository {
  Future<Either<Failure, List<Transaction>>> getUserHistory(int id, int pageSize, int page);
  Future<Either<Failure, Transaction>> getTransaction(int id);
  Future<Either<Failure, Transaction>> createTransaction(Transaction transaction, File? source);
  Future<Either<Failure, Transaction>> updateTransaction(Transaction transaction);
  Future<Either<Failure, List<Transaction>>> searchTransaction(String text, int pageSize, int page);
  Future<Either<Failure, Obligation>> updateObligation(int transactionId, Obligation obligation);
  Future<Either<Failure, int>> setObligationToken(int transactionId, Obligation obligation, String token);
  Future<Either<Failure, int>> setObligationStatus(int transactionId, Obligation obligation, ObligationStatus status);
  Future<Either<Failure, Notification>> createNotification(Notification notification, User? user);
  Future<Either<Failure, Notification>> updateNotification(User ? user, Transaction? transaction, int? notificationId, NotificationState state);
  Future<Either<Failure, Transaction>> storeTransaction(Transaction transaction);
}
