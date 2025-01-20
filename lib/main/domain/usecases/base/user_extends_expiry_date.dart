// import 'package:dartz/dartz.dart';
// import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
// import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
// import 'package:trust_pay_beta/main/domain/entities/entities.dart';
// import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';
//
// class UserExtendsExpiryDate {
//   final RemoteDataSource _remoteDataSource;
//   UserExtendsExpiryDate(this._remoteDataSource);
//
//   Future<Either<Failure, Transaction>> execute(Transaction input, DateTime date) async {
//     if(!validate(input)){
//       return Left(Failure(300, 'Invalid Transaction State'));
//     }
//
//     //Modify obligations due dates
//     List<Obligation> obligations = input.obligations.map((o) {
//       if(o.status == ObligationStatus.pending){
//         if(o.dueDate.isBefore(date)){
//           return o.copyWith(
//               dueDate: date
//           );
//         }
//       }
//       return o;
//     }).toList();
//
//     //Modify transaction due date
//     final transaction = input.copyWith(
//         expiryDate: date,
//         obligations: obligations
//     );
//
//     //Update Transaction
//     final response = await _remoteDataSource.updateTransaction(
//         transaction.id??-1,
//         transaction
//     );
//
//     if(response.status ==  200) {
//       //Send notification
//       final user = transaction.members.firstWhere((u) => u.id == transaction.userId);
//       return sendNotification(input, response, user, _remoteDataSource, () async {
//         await _remoteDataSource.updateTransaction(
//             input.id??-1,
//             input
//         );
//       });
//     }
//     else {
//       return Left(Failure(response.status??500, response.message??''));
//     }
//   }
// }
//
//
// bool validate(Transaction transaction) {
//   return secureSalesValidation(transaction);
// }
//
// bool secureSalesValidation(Transaction transaction) {
//   //check that transaction hasn't expired
//   if(transaction.expiryDate.isBefore(DateTime.now())) {
//     return false;
//   }
//
//   //Check if buyer is yet to complete all fulfilments
//   bool allFulfilmentsAreVerified = true;
//   for(var o in transaction.obligations) {
//     if(o.type == ObligationType.delivery){
//       if(o.status != ObligationStatus.verified){
//         return false;
//       }
//     }
//   }
//   return allFulfilmentsAreVerified;
// }