import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/functions/expiry.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';

/// Any member asks the others to move the expiry date to [date]. Nothing
/// changes until every other member approves it.
class MemberRequestsExtension {
  final RemoteDataSource _remoteDataSource;
  MemberRequestsExtension(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, DateTime date, User user) async {
    if (!input.isActive) {
      return Left(Failure(300, 'This transaction can no longer be extended.'));
    }
    if (date.isBefore(earliestExpiryDate())) {
      return Left(Failure(300, pastExpiryMessage));
    }
    if (!date.isAfter(input.expiryDate)) {
      return Left(Failure(300, 'The new expiry date must be after the current one.'));
    }

    try {
      final response = await _remoteDataSource.requestExtension(input.id ?? -1, date);

      //Send notification
      return await sendNotificationToAllMembersExceptSender(
        input,
        response,
        "${user.toUserInput().username} asked to extend ${input.title} to ${DateFormat('d MMM yyyy').format(date)}",
        user,
        _remoteDataSource,
        (_) {}
      );
    }
    catch (e) {
      return Left(Failure.fromError(e));
    }
  }
}
