// import 'package:dartz/dartz.dart';
// import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
// import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
// import 'package:trust_pay_beta/main/domain/entities/entities.dart';
// import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';
//
// class TransactionExpires {
//   final RemoteDataSource _remoteDataSource;
//   TransactionExpires(this._remoteDataSource);
//
//   Future<Either<Failure, Transaction>> execute(Transaction input) async {
//     if(!validate(input)){
//       return Left(Failure(300, 'Invalid Transaction State'));
//     }
//
//     bool aPaymentHasBeenPaid = input.obligations.fold(false, (prev, o) {
//       return prev? true:
//           o.type==ObligationType.payment && o.status==ObligationStatus.paid;
//     });
//
//     //Update Obligations
//     final obligations = input.obligations.map((o){
//       return aPaymentHasBeenPaid? o: o.copyWith(status: ObligationStatus.failed);
//     }).toList();
//
//
//     final transaction = input.copyWith(
//       status: TransactionStatus.declined,
//       obligations: obligations
//     );
//
//     final response = await _remoteDataSource.updateTransaction(
//       transaction.id??-1,
//       transaction
//     );
//
//     //Send notification
//     final user = transaction.members.firstWhere((u) => u.id == transaction.userId);
//     return await sendNotificationToAllMembersExceptSender(
//         input,
//         response,
//         "${user.toUserInput().username} Cancelled the Transaction",
//         user,
//         _remoteDataSource,
//             (failedNotificationTo) async {
//           //Retry sending notification
//         }
//     );
//   }
// }
//
// bool validate(Transaction transaction) {
//   //check that transaction has expired
//   if(!transaction.expiryDate.isBefore(DateTime.now())) {
//     return false;
//   }
//
//   //Check that transaction is at the verification state
//   return transaction.status==TransactionStatus.verification || transaction.status==TransactionStatus.pending;
// }
