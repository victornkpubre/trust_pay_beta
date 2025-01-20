import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import '../../../data/data_source/data_sources/remote_data_source.dart';
import '../../entities/base/failures.dart';

class TransactionExpires {
  final RemoteDataSource _remoteDataSource;
  TransactionExpires(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, String reason, User user) async {

    //Send notification
    final notification = Notification(
        message: "Transaction has Expired.",
        user: user,
        state: NotificationState.sent,
        transaction: input
    );
    final notificationResponse = await _remoteDataSource.createNotification(notification);
    if(notificationResponse.status == 200) {
      //Return result
      return Right(input);
    }
    else {
      await _remoteDataSource.updateTransaction(
          input.id??-1,
          input
      );
      return Left(Failure(notificationResponse.status??500, notificationResponse.message??''));
    }
  }
}