import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/data/mappers/entityConverter.dart';
import 'package:trust_pay_beta/main/data/mappers/extensions.dart';
import 'package:trust_pay_beta/main/data/responses/auth/responses.dart';
import 'package:trust_pay_beta/main/data/responses/transaction/responses.dart';
import 'package:trust_pay_beta/main/data/responses/user/responses.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

const EMPTY = "";
const ZERO = 0;


Transaction DefaultTransaction() {
  return Transaction(
    title: '',
    type: TransactionType.secureSales,
    total: 0,
    dateCreated: DateTime.now(),
    expiryDate: DateTime.now(),
    percentageComplete: 0,
    status: TransactionStatus.pending,
    obligations: [],
    members: []
  );
}

User DefaultUser() {
  return const User(
    id: -1,
    firstName:  EMPTY,
    lastName:  EMPTY,
    businessName:  EMPTY,
    email:  EMPTY,
    profileImage: EMPTY,
    fcmToken:  EMPTY,
    account:  Account(),
    bvn:  EMPTY,
    admin:  false,
    mediator:  false,
    online:  false,
  );
}

extension AuthenticationResponseMapper on AuthResponse? {
  Authentication toDomain() {
    return Authentication(
      token: this?.token?.orEmpty() ?? EMPTY, 
      user: this?.user?.toDomain()
    );
  }
}

extension UserResponseMapper on UserResponse? {
  User toDomain() {
    return this?.user.toDomain()??DefaultUser();
  }
}

extension UserDataResponseMapper on UserDataResponse? {
  User toDomain() {
    return User(
      id: this?.id??-1,
      firstName: this?.firstName?.orEmpty() ?? EMPTY,
      lastName: this?.lastName?.orEmpty() ?? EMPTY,
      businessName: '${this?.firstName?.orEmpty()}_${this?.lastName?.orEmpty()}',
      email: this?.email?.orEmpty() ?? EMPTY,
      profileImage: '${AppConstants.baseUrl}/storage/${this?.profileImage?.orEmpty()}',
      fcmToken: this?.fcmToken?.orEmpty() ?? EMPTY,
      account: this?.account.toDomain()?? const Account(),
      bvn: this?.bvn?.orEmpty() ?? EMPTY,
      admin: this?.admin?? false,
      mediator: this?.mediator?? false,
      online: this?.online?? false,
      userStatistics: this?.userStatistics?.toDomain(),
      transactionStatistics: this?.transactionStatistics?.toDomain()
    );
  }
}

extension UsersResponseMapper on UsersResponse? {
  List<User> toDomain() {
    return this?.users?.map((res) {
      return res.toDomain();
    }).toList()??[];
  }
}

extension AccountResponseMapper on AccountResponse? {
  Account toDomain() {
    return Account(
      name: this?.name?.orEmpty() ?? EMPTY,
      accountNumber: this?.accountNumber?? 'no account',
      balance: this?.balance?? 0.0,
    );
  }
}

extension UserStatisticsResponseMapper on UserStatisticsResponse? {
  UserStatistics toDomain() {
    return UserStatistics(
      allTransactions: this?.allTransactions??0,
      created: this?.created??0,
      pending: this?.pending??0,
      accepted: this?.accepted??0,
      verification: this?.verification??0,
      declined: this?.declined??0,
      completed: this?.completed??0,
    );
  }
}

extension TransactionStatisticsResponseMapper on TransactionStatisticsResponse? {
  TransactionStatistics toDomain() {
    return TransactionStatistics(
      secureSales: this?.secure_sales??[0,0,0],
      moneyPool: this?.money_pool??[0,0,0],
      billSplitter: this?.bill_splitter??[0,0,0],
      betsAndWager: this?.bets_wager??[0,0,0],
      groupGoals: this?.group_goals??[0,0,0],
    );
  }
}

extension UpdateResponseMapper on UpdateResponse? {
  bool toDomain() {
    return this?.success??false;
  }
}

extension TransactionResponseDataMapper on TransactionResponseData? {
  Transaction toDomain() {
    return Transaction(
      id: this?.id??-1,
      userId: this?.userId??-1,
      title: this?.title??'',
      type: EntityConverter.transactionTypeFromString(this?.type),
      status: EntityConverter.transactionStatusFromString(this?.transactionStatus),
      total: this?.total??0, 
      dateCreated: this?.dateCreated??DateTime.now(), 
      expiryDate: this?.expiryDate??DateTime.now(),
      percentageComplete: this?.percentage??0.0,
      obligations: this?.obligations?.map((o) => o.toDomain()).toList()??[],
      members: this?.members?.map((m) => m.toDomain()).toList()??[]
    );
  }
}

extension TransactionResponseMapper on TransactionResponse? {
  Transaction toDomain() {
    return this?.transaction.toDomain()??DefaultTransaction();
  }
}

extension TransactionsResponseMapper on TransactionsResponse? {
  List<Transaction> toDomain() {
    List<TransactionResponseData>? response = this?.transactions;
    return response?.map((res) {
      return res.toDomain();
    }).toList()??[];
  }
}

extension ObligationResponseMapper on ObligationResponse? {
  Obligation toDomain() {
    return Obligation(
      id: this?.id??-1,
      title: this?.title??'', 
      type: EntityConverter.obligationTypeFromString(this?.type),
      status: EntityConverter.obligationStatusFromString(this?.obligationStatus),
      dueDate: this?.expiresAt??DateTime.now(),
      amount: this?.amount?.amount??0,
      binding: this?.binding??0,
      details: this?.details?.details??'',
      token: this?.token?.value??'',
    );
  }
}

extension NotificationResponseMapper on NotificationResponse? {
  Notification toDomain() {
    return Notification(
        id: this?.id??-1,
        message: this?.message??'',
        state: EntityConverter.notificationStateFromString(this?.notificationState),
        user: this?.user?.toDomain()??DefaultUser(),
        transaction: this?.transaction?.toDomain()??DefaultTransaction()
    );
  }
}
