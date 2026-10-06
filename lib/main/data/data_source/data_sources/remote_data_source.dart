import 'dart:io';
import 'package:trust_pay_beta/main/data/network/db_api_client.dart';
import 'package:trust_pay_beta/main/data/responses/auth/responses.dart';
import 'package:trust_pay_beta/main/data/responses/base/responses.dart';
import 'package:trust_pay_beta/main/data/responses/payment/responses.dart';
import 'package:trust_pay_beta/main/data/responses/transaction/responses.dart';
import 'package:trust_pay_beta/main/data/responses/user/responses.dart';
import '../../../domain/entities/entities.dart';

abstract class RemoteDataSource {
  Future<AuthResponse> login(String email, String password);
  Future<AuthResponse> register(String firstname, String lastname, String email, String password, File profileImage);
  Future<AuthResponse> loginWithGoogle(String idToken);
  Future<BaseResponse> logout();
  Future<BaseResponse> resetPassword(String token, String password);
  Future<BaseResponse> sendResetMail(int userId);

  Future<UserResponse> getUser(int id);
  Future<NotificationsResponse> getUserNotification();
  Future<UserResponse> updateUser(User user);
  Future<UserResponse> updateUserImage(int userId, File image);
  Future<UsersResponse> getUsers(int? pageSize, int? page);
  Future<TransactionsResponse> getUserHistory(int id, int? pageSize, int? page);
  Future<UserStatisticsResponse> getUserStats(int id);
  Future<UsersResponse> searchUser(String text, int? pageSize, int? page);
  Future<UserResponse> getMediator(User user, User bettor);
  Future<AccountHistoryResponse> getAccountHistory(int accountId);
  Future<UserResponse> setFcmToken(User user, String token);

  Future<TransactionResponse> getTransaction(int id);
  Future<TransactionResponse> createTransaction(Transaction transaction);
  Future<TransactionResponse> updateTransaction(int id, Transaction transaction);
  Future<TransactionStatisticsResponse> getTransactionStats(int id);
  Future<TransactionsResponse> searchTransaction(String text, int? pageSize, int? page);
  Future<MediationResponse> saveMediationSource(Transaction transaction, File? source);
  
  Future<UpdateResponse> setObligationStatus(int id, String status);
  Future<UpdateResponse> setObligationToken(int id, String token);
  Future<ObligationResponse> updateObligation(Obligation obligation);

  Future<NotificationResponse> createNotification(Notification notification, {User? receiver});
  Future<NotificationResponse> updateNotification(int notificationId, NotificationState state);

  Future<UserResponse> withdraw(int userId, double amount);
  Future<UserResponse> deposit(int userId, double amount);
  Future<UserResponse> payAccount(int userId, double amount, String currency);
  Future<UserResponse> payBank(int userId, double amount);
  Future<UserResponse> payCard(int userId, double amount);
  Future<UserResponse> escrowPayout(int transactionId, int toUserId, double amount, String currency);

  Future<AccountsResponse> getAccounts(int userId);
  Future<DepositInitiateResponse> initiateDeposit(int amount, String currency);
  Future<PaymentStatusResponse> getPaymentStatus(int paymentId);

}

class RemoteDataSourceImplementation implements RemoteDataSource {
  final DataBaseApiClient _databaseServiceClient;
  RemoteDataSourceImplementation(this._databaseServiceClient);

  //Auth
  @override
  Future<AuthResponse> login(String email, String password) async {
    return await _databaseServiceClient.login(email, password);
  }

  @override
  Future<AuthResponse> register(String firstname, String lastname, String email, String password, File profileImage) async {
    return await _databaseServiceClient.register(
      firstName: firstname,
      lastName: lastname,
      email: email,
      password: password,
      profileImage: profileImage
    );
  }
  
  @override
  Future<AuthResponse> loginWithGoogle(String idToken) async {
    return await _databaseServiceClient.loginWithGoogle(idToken);
  }

  @override
  Future<BaseResponse> logout() async {
    return await _databaseServiceClient.logout();
  }

  @override
  Future<BaseResponse> resetPassword(String token, String password) async {
    return await _databaseServiceClient.resetPassword(token, password);
  }

  @override
  Future<BaseResponse> sendResetMail(int userId) async {
    return await _databaseServiceClient.sendResetMail(userId);
  }

  //User
  @override
  Future<UserResponse> getUser(int id) async {
    return await _databaseServiceClient.user(id);
  }

  @override
  Future<TransactionsResponse> getUserHistory(int id, int? pageSize, int? page) async {
    return await _databaseServiceClient.history(id, pageSize, page);
  }

  @override
  Future<UsersResponse> getUsers(int? pageSize, int? page) async {
    return await _databaseServiceClient.users(pageSize, page);
  }

  @override
  Future<UserStatisticsResponse> getUserStats(int id) async {
    return await _databaseServiceClient.getUserStats(id);
  }

  @override
  Future<UsersResponse> searchUser(String text, int? pageSize, int? page) {
    return _databaseServiceClient.searchUser(text, pageSize, page);
  }

  @override
  Future<UserResponse> updateUser(User user) async {
    return await _databaseServiceClient.updateUser(
        id: user.id??-1,
        firstName: user.firstName,
        lastName: user.lastName,
        businessName: user.businessName??'',
        mediator: user.mediator,
    );
  }

  @override
  Future<UserResponse> updateUserImage(int userId, File image) async {
    return await _databaseServiceClient.updateUserImage(
      userId: userId,
      profileImage: image
    );
  }

  //Transaction
  @override
  Future<TransactionResponse> getTransaction(int id) async {
    return await _databaseServiceClient.getTransaction(id);
  }

  @override
  Future<TransactionResponse> createTransaction(Transaction transaction) async {
    return await _databaseServiceClient.createTransaction(transaction);
  }

  @override
  Future<TransactionResponse> updateTransaction(int id, Transaction transaction) async {
    return await _databaseServiceClient.updateTransaction(id, transaction);
  }

  @override
  Future<TransactionStatisticsResponse> getTransactionStats(int id) async {
    return await _databaseServiceClient.getTransactionStats(id);
  }

  @override
  Future<TransactionsResponse> searchTransaction(String text, int? pageSize, int? page) async {
    return await _databaseServiceClient.searchTransaction(text, pageSize, page);
  }

  @override
  Future<UpdateResponse> setObligationStatus(int id, String status) async {
    return await _databaseServiceClient.setObligationStatus(id, {"status" : status});
  }

  @override
  Future<UpdateResponse> setObligationToken(int id, String token) async {
    return await _databaseServiceClient.setObligationToken(id, {"token" : token});
  }

  @override
  Future<ObligationResponse> updateObligation(Obligation obligation) async {
    return await _databaseServiceClient.updateObligation(obligation);
  }

  @override
  Future<NotificationResponse> createNotification(Notification notification, {User? receiver}) async {
    return await _databaseServiceClient.createNotification(
      notification.user.id??-1,
      notification.transaction?.id ?? -1,
      notification.state.name,
      notification.message,
      receiver?.id
    );
  }

  @override
  Future<UserResponse> deposit(int userId, double amount) async {
    return await _databaseServiceClient.accountDeposit(userId, amount);
  }

  @override
  Future<UserResponse> payAccount(int userId, double amount, String currency) async {
    return await _databaseServiceClient.payWallet(userId, amount, currency);
  }

  @override
  Future<UserResponse> escrowPayout(int transactionId, int toUserId, double amount, String currency) async {
    return await _databaseServiceClient.escrowPayout(transactionId, toUserId, amount, currency);
  }


  @override
  Future<UserResponse> payBank(int userId, double amount) async {
    return await _databaseServiceClient.payBank(userId, amount);
  }

  @override
  Future<UserResponse> payCard(int userId, double amount) async {
    return await _databaseServiceClient.payCard(userId, amount);
  }

  @override
  Future<UserResponse> withdraw(int userId, double amount)async {
    return await _databaseServiceClient.accountWithdraw(userId, amount);
  }

  @override
  Future<NotificationResponse> updateNotification(int notificationId, NotificationState state) async {
    return await _databaseServiceClient.updateNotification(notificationId, state.name);
  }

  @override
  Future<NotificationsResponse> getUserNotification() async {
    return await _databaseServiceClient.getUserNotification();
  }

  @override
  Future<UserResponse> getMediator(User user, User bettor) async {
    return await _databaseServiceClient.getMediator(user.id!, bettor.id!);
  }

  @override
  Future<MediationResponse> saveMediationSource(Transaction transaction, File? source) async {
    final result = await _databaseServiceClient.saveMediationSource(
        transactionId: transaction.id!,
        type: transaction.mediation!.source_type,
        source: source
    );
    return result;
  }

  // @override
  // Future<AccountHistoryDataResponse> addToAccountHistory(int accountId, int transactionId, int amount) async {
  //   return await _databaseServiceClient.addToAccountHistory(accountId, transactionId, amount);
  // }

  @override
  Future<AccountHistoryResponse> getAccountHistory(int accountId) async {
    return await _databaseServiceClient.getAccountHistory(accountId);
  }

  @override
  Future<UserResponse> setFcmToken(User user, String token) async {
    return await _databaseServiceClient.setFcmToken(user.id!, {'token' : token});
  }

  @override
  Future<AccountsResponse> getAccounts(int userId) async {
    return await _databaseServiceClient.getAccounts(userId);
  }

  @override
  Future<DepositInitiateResponse> initiateDeposit(int amount, String currency) async {
    return await _databaseServiceClient.initiateDeposit(amount, currency);
  }

  @override
  Future<PaymentStatusResponse> getPaymentStatus(int paymentId) async {
    return await _databaseServiceClient.getPaymentStatus(paymentId);
  }



}