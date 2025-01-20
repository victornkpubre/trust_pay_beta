import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';
import 'package:trust_pay_beta/main/domain/usecases/secure_sales/buyer_verifies_fulfilment.dart';


enum ResolutionType {refundBuyer, paySeller}
class AdminResolvesTransaction {
  final RemoteDataSource _remoteDataSource;
  AdminResolvesTransaction(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, Obligation paymentObligation, ResolutionType type) async {
    final payoutObligation = input.obligations.firstWhere((o)
    => o.type==ObligationType.payment && o.title.compareTo(paymentObligation.title)==0
    );
    if(type==ResolutionType.refundBuyer){
      final obligations = input.obligations.map((o) => o.copyWith(status: ObligationStatus.failed)).toList();
      Transaction transaction = input.copyWith(
        obligations: obligations
      );

      final response = await _remoteDataSource.updateTransaction(
          transaction.id??-1,
          transaction
      );

      if(response.status == 200){
        return refundUser(_remoteDataSource, transaction, paymentObligation);
      }

      return Left(Failure(300, 'Payment failed'));
    }
    else {
      final obligation = input.obligations.firstWhere((o) => o.title.compareTo(payoutObligation.title)==0);
      (await BuyerVerifiesFulfilment(_remoteDataSource).execute(input, obligation)).fold(
        (failure){
          return Left(failure);
        },
        (transaction){
          return makePayout(_remoteDataSource, input, transaction, payoutObligation);
        }
      );
      
      return Left(Failure(300, 'Payment failed'));
      
    }
  }
}

