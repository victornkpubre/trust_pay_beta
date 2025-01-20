import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/main/data/data_source/local_database/database.dart';

import '../base/entities.dart';
import '../transaction/entities.dart';

part 'entities.freezed.dart';
part 'entities.g.dart';

@freezed
class User with _$User {
  const User._(); 
  const factory User({
    int? id,
    required final String firstName,
    required final String lastName,
    required final String profileImage,
    required final String email,
    final Account? account,
    required final String fcmToken,
    required final String bvn,
    String? businessName,
    UserStatistics? userStatistics,
    TransactionStatistics? transactionStatistics,
    @Default(false) final bool admin,
    @Default(false) final bool mediator,
    @Default(false) final bool online,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) 
    => _$UserFromJson(json);

  UserInput toUserInput() {
    return UserInput(
        image: profileImage, 
        username: "$firstName $lastName", 
        account: "#${account?.accountNumber}", 
        totalTransaction: userStatistics?.allTransactions??0, 
        completionRate: userStatistics != null?
          (userStatistics!.completed/userStatistics!.allTransactions): 0
    );
  }
  UserDTO toUserDTO() {
    return UserDTO(
      id: id,
      firstName: firstName,
      lastName: lastName,
      businessName: businessName,
      email: email,
      profileImage: profileImage,
      bvn: bvn,
      fcmToken: fcmToken,
      account: account==null?null: jsonEncode(account!.toJson()),
      userStatistics: userStatistics==null?null: jsonEncode(userStatistics!.toJson()),
      transactionStatistics: transactionStatistics==null?null: jsonEncode(transactionStatistics!.toJson()),
      mediator: mediator,
      online: online,
      admin: admin,
    );
  }

}


@freezed
class TransactionStatistics with _$TransactionStatistics {

  const factory TransactionStatistics({
    @Default([0,0,0]) final List<int> secureSales,
    @Default([0,0,0]) final List<int> billSplitter,
    @Default([0,0,0]) final List<int> betsAndWager,
    @Default([0,0,0]) final List<int> moneyPool,
    @Default([0,0,0]) final List<int> groupGoals,
  }) = _TransactionStatistics;

  factory TransactionStatistics.fromJson(Map<String, Object?> json)
  => _$TransactionStatisticsFromJson(json);
}


@freezed
class Authentication with _$Authentication {
  const factory Authentication({
      final String? token,
      final User? user
  }) = _Authentication;

  factory Authentication.fromJson(Map<String, Object?> json)
    => _$AuthenticationFromJson(json);
}


@freezed
class UserStatistics with _$UserStatistics {
  
  const factory UserStatistics({
    @Default(0) final int allTransactions,
    @Default(0) final int created,
    @Default(0) final int completed,
    @Default(0) final int pending,
    @Default(0) final int verification,
    @Default(0) final int declined,
    @Default(0) final int accepted,
  }) = _UserStatistics;

  factory UserStatistics.fromJson(Map<String, Object?> json)
    => _$UserStatisticsFromJson(json);
}

@freezed
class Account with _$Account {

  const factory Account({
     @Default('no account') name,
     @Default('102020020') accountNumber,
     @Default(0.0) balance,
  }) = _Account;

  factory Account.fromJson(Map<String, Object?> json) 
    => _$AccountFromJson(json);
}

