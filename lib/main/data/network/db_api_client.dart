import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/data/responses/auth/responses.dart';
import 'package:trust_pay_beta/main/data/responses/base/responses.dart';
import 'package:trust_pay_beta/main/data/responses/payment/responses.dart';
import 'package:trust_pay_beta/main/data/responses/transaction/responses.dart';
import 'package:trust_pay_beta/main/data/responses/user/responses.dart';

import '../../domain/entities/entities.dart';

part "db_api_client.g.dart";

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class DataBaseApiClient {
  factory DataBaseApiClient(Dio dio, {String baseUrl}) = _DataBaseApiClient;

  //Auth
  @POST("/api/auth/register")
  @MultiPart()
  Future<AuthResponse> register({
    @Part(name: "first_name") required String firstName,
    @Part(name: "last_name") required String lastName,
    @Part(name: "email") required String email,
    @Part(name: "password") required String password,
    @Part(name: "profile_image") required File profileImage, // Optional profile image
  });

  @POST("/api/users/image/{id}")
  @MultiPart()
  Future<UserResponse> updateUserImage({
    @Path('id') required int userId,
    @Part(name: "profile_image") required File profileImage, // Optional profile image
  });

  @POST("/api/auth/login")
  Future<AuthResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );

  @POST("/api/auth/google")
  Future<AuthResponse> loginWithGoogle(
    @Field("id_token") String idToken,
  );

  @GET("/api/auth/logout")
  Future<BaseResponse>logout();

  @POST("/api/auth/password/reset")
  Future<BaseResponse> resetPassword(
      @Field("token") String token,
      @Field("new_password") String password,
  );

  @POST("/api/auth/password/mail")
  Future<BaseResponse> sendResetMail(int userId);


  //User
  @GET("/api/users/{id}")
  Future<UserResponse> user(
    @Path("id") int id,
  );

  @PATCH("/api/users/{id}")
  Future<UserResponse> updateUser({
    @Path("id") required int id,
    @Field("first_name") required String firstName,
    @Field("last_name") required String lastName,
    @Field("business_name") required String businessName,
    @Field("mediator") required bool mediator,
  });

  @GET("/api/users")
  Future<UsersResponse> users(
    @Query("page_size") int? pageSize,
    @Query("page") int? page,
  );

  @GET("/api/notifications")
  Future<NotificationsResponse> getUserNotification();

  @GET("/api/users/history/{id}")
  Future<TransactionsResponse> history(
    @Path("id") int id,
    @Query("page_size") int? pageSize,
    @Query("page") int? page,
  );

  @GET("/api/users/statistics/{id}")
  Future<UserStatisticsResponse> getUserStats(
    @Path("id") int id,
  );

  @GET("/api/users/search/{text}")
  Future<UsersResponse> searchUser(
    @Path("text") String text,
    @Query("page_size") int? pageSize,
    @Query("page") int? page,
  );

  @GET("/api/users/mediator/find/{user}/{bettor}")
  Future<UserResponse> getMediator(
      @Path("user") int user,
      @Path("bettor") int bettor,
  );

  //Transaction
  @GET("/api/transactions/{id}")
  Future<TransactionResponse> getTransaction(
    @Path("id") int id,
  );

  @POST("/api/transactions")
  Future<TransactionResponse> createTransaction(
    @Body() Transaction transaction,
  );

  @PATCH("/api/transactions/{id}")
  Future<TransactionResponse> updateTransaction(
      @Path("id") int id,
      @Body() Transaction transaction,
  );

  @POST("/api/transactions/statistics/{id}")
  Future<TransactionStatisticsResponse> getTransactionStats(
      @Path("id") int id,
  );

  @GET("/api/transactions/search/{text}")
  Future<TransactionsResponse> searchTransaction(
      @Path("text") String text,
      @Query("page_size") int? pageSize,
      @Query("page") int? page
  );

  @PATCH("/api/mediations/{id}")
  Future<TransactionResponse> updateMediation(
      @Path("id") int id,
      @Body() Mediation mediation,
  );

  @POST('/api/mediations/source')
  @MultiPart()
  Future<MediationResponse> saveMediationSource({
    @Part(name: 'transaction') required int transactionId,
    @Part(name: "type") required String type,
    @Part(name: "source") File? source,
  });

  @POST("/api/obligations/status/{id}")
  Future<UpdateResponse> setObligationStatus(
      @Path("id") int id,
      @Body() Map<String, String> status,
  );

  @POST("/api/obligations/token/{id}")
  Future<UpdateResponse> setObligationToken(
      @Path("id") int id,
      @Body() Map<String, String> token,
  );

  @POST("/api/obligations")
  Future<ObligationResponse> updateObligation(
      @Body() Obligation obligation,
  );

  @POST("/api/notifications")
  Future<NotificationResponse> createNotification(
      @Field('user_id') int userId,
      @Field("transaction_id") int transactionId,
      @Field("state") String state,
      @Field("message") String message,
      @Query("receiver") int? receiver
  );

  @PUT("/api/notifications/{notification}")
  Future<NotificationResponse> updateNotification(
      @Path("notification") int notificationId,
      @Field("state") String state,
  );

  @GET('/api/users/account/deposit/{user}/{amount}')
  Future<UserResponse> accountDeposit(
      @Path("user") int user,
      @Path("amount") double amount,
  );

  @GET('/api/users/account/withdraw/{user}/{amount}')
  Future<UserResponse> accountWithdraw(
      @Path("user") int user,
      @Path("amount") double amount,
  );

  @GET('/api/users/payment/wallet/{user}/{amount}/{currency}')
  Future<UserResponse> payWallet(
      @Path("user") int user,
      @Path("amount") double amount,
      @Path("currency") String currency,
  );

  @POST('/api/transactions/{transaction}/payout')
  Future<UserResponse> escrowPayout(
      @Path("transaction") int transactionId,
      @Field("to_user_id") int toUserId,
      @Field("amount") double amount,
      @Field("currency") String currency,
  );

  @POST('/api/transactions/{transaction}/proofs')
  @MultiPart()
  Future<TransactionProofResponse> uploadTransactionProof({
    @Path("transaction") required int transactionId,
    @Part(name: "file") required File file,
    @Part(name: "media_type") required String mediaType,
    @Part(name: "latitude") required double latitude,
    @Part(name: "longitude") required double longitude,
    @Part(name: "accuracy") double? accuracy,
    @Part(name: "is_mocked") required int isMocked,
    @Part(name: "captured_at") required String capturedAt,
    @Part(name: "obligation_ids") String? obligationIds, // comma-separated
  });

  @DELETE('/api/transactions/{transaction}/proofs/{proof}')
  Future<BaseResponse> deleteTransactionProof({
    @Path("transaction") required int transactionId,
    @Path("proof") required int proofId,
  });

  @GET('/api/users/payment/bank/{user}/{amount}')
  Future<UserResponse> payBank(
      @Path("user") int user,
      @Path("amount") double amount,
  );

  @GET('/api/users/payment/card/{user}/{amount}')
  Future<UserResponse> payCard(
      @Path("user") int user,
      @Path("amount") double amount,
  );

  @GET('/api/users/account/history/{account}')
  Future<AccountHistoryResponse> getAccountHistory(
      @Path("account") int accountId,
  );

  @GET('/api/users/accounts/{user}')
  Future<AccountsResponse> getAccounts(
      @Path("user") int userId,
  );

  @POST('/api/payments/deposit/initiate')
  Future<DepositInitiateResponse> initiateDeposit(
      @Field("amount") int amount,
      @Field("currency") String currency,
  );

  @GET('/api/payments/{payment}')
  Future<PaymentStatusResponse> getPaymentStatus(
      @Path("payment") int paymentId,
  );

  @POST('/api/users/token/{user}')
  Future<UserResponse> setFcmToken(
      @Path("user") int userId,
      @Body() Map<String, String> token,
  );
}