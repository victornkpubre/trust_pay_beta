import 'dart:io';
import 'package:trust_pay_beta/main/data/network/db_api_client.dart';
import 'package:trust_pay_beta/main/data/responses/auth/responses.dart';
import 'package:trust_pay_beta/main/data/responses/base/responses.dart';
import 'package:trust_pay_beta/main/data/responses/transaction/responses.dart';
import 'package:trust_pay_beta/main/data/responses/user/responses.dart';
import '../../../domain/entities/entities.dart';

abstract class RemoteDataSource {
  Future<AuthResponse> login(String email, String password);
  Future<AuthResponse> register(String firstname, String lastname, String email, String password, File profileImage);
  Future<BaseResponse> logout();
  Future<BaseResponse> resetPassword(String token, String password);
  Future<BaseResponse> sendResetMail(int userId);

  Future<UserResponse> getUser(int id);
  Future<UsersResponse> getUsers(int? pageSize, int? page);
  Future<TransactionsResponse> getUserHistory(int id, int? pageSize, int? page);
  Future<UserStatisticsResponse> getUserStats(int id);
  Future<UsersResponse> searchUser(String text, int? pageSize, int? page);

  Future<TransactionResponse> getTransaction(int id);
  Future<TransactionResponse> createTransaction(Transaction transaction);
  Future<TransactionResponse> updateTransaction(int id, Transaction transaction);
  Future<TransactionStatisticsResponse> getTransactionStats(int id);
  Future<TransactionsResponse> searchTransaction(String text, int? pageSize, int? page);
  
  Future<UpdateResponse> setObligationStatus(int id, String status);
  Future<UpdateResponse> setObligationToken(int id, String token);
  Future<ObligationResponse> updateObligation(Obligation obligation);

  Future<NotificationResponse> createNotification(Notification notification, {User? receiver});

  Future<UserResponse> withdraw(int userId, double amount);
  Future<UserResponse> deposit(int userId, double amount);
  Future<UserResponse> payAccount(int userId, double amount);
  Future<UserResponse> payBank(int userId, double amount);
  Future<UserResponse> payCard(int userId, double amount);
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
    return await _databaseServiceClient.createNotification(notification, receiver?.id);
  }

  @override
  Future<UserResponse> deposit(int userId, double amount) async {
    return await _databaseServiceClient.accountDeposit(userId, amount);
  }

  @override
  Future<UserResponse> payAccount(int userId, double amount) async {
    return await _databaseServiceClient.payWallet(userId, amount);
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

}