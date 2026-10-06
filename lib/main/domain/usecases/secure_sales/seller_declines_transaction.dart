import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';

class SellerDeclinesTransaction {
  final RemoteDataSource _remoteDataSource;
  SellerDeclinesTransaction(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, User seller, String reason) async {
    if(!validate(input)){
      return Left(Failure(300, 'Invalid Transaction State'));
    }

    final obligations = input.obligations.map((o) => o.copyWith(status: ObligationStatus.failed)).toList();
    final transaction = input.copyWith(
      status: TransactionStatus.declined,
      obligations: obligations,
      notes: input.notes==null?[reason]: [...input.notes!, reason]
    );

    try{
      final response = await _remoteDataSource.updateTransaction(
          transaction.id??-1,
          transaction
      );

      //Send notification
      final buyer = transaction.members.firstWhere((u) => u.id == transaction.userId);
      return await sendNotification(
          transaction,
          response,
          "${seller.toUserInput().username} Declined the Transaction",
          seller,
          buyer,
          _remoteDataSource,
              () async {
            //Reverse transaction update and payment
            await _remoteDataSource.updateTransaction(
                input.id??-1,
                input
            );
          }
      );
    }
    catch (e) {
      return Left(Failure(300, 'Invalid Transaction State'));
    }
  }
}

bool validate(Transaction transaction) {
  //check that transaction hasn't expired
  if(transaction.expiryDate.isBefore(DateTime.now())) {
    return false;
  }

  //Check if transaction is at the pending state
  bool transactionPending = transaction.status==TransactionStatus.pending;
  return transactionPending;
}
