import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/data/responses/auth/responses.dart';
import 'package:trust_pay_beta/main/data/responses/base/responses.dart';
import 'package:trust_pay_beta/main/data/responses/transaction/responses.dart';
import 'package:trust_pay_beta/main/data/responses/user/responses.dart';

import '../../domain/entities/entities.dart';

part "db_api_client.g.dart";

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class DataBaseApiClient {
  factory DataBaseApiClient(Dio dio, {String baseUrl}) = _DataBaseApiClient;

  //Auth
  @POST("/api/auth/register")
  Future<AuthResponse> register(
    @Field("first_name") String firstName,
    @Field("last_name") String lastName,
    @Field("email") String email,
    @Field("password") String password,
  );

  @POST("/api/auth/login")
  Future<AuthResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );

  @POST("/api/auth/logout")
  Future<BaseResponse>logout ();

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

  @GET("/api/users")
  Future<UsersResponse> users(
    @Query("page_size") int? pageSize,
    @Query("page") int? page,
  );

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

  //Transaction
  @GET("/api/transactions/{id}")
  Future<TransactionResponse> getTransaction(
    @Path("id") int id,
  );

  @POST("/api/transactions")
  Future<TransactionResponse> createTransaction(
    @Body() Transaction transaction,
  );

  @PUT("/api/transactions/{id}")
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

  @PUT("/api/mediations/{id}")
  Future<TransactionResponse> updateMediation(
      @Path("id") int id,
      @Body() Mediation mediation,
  );

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
      @Body() Notification notification
  );

}