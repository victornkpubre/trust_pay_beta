import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';

/// Another member approves or declines a requested expiry date (it applies
/// once every other member has approved). With [approve] false, the
/// requester can also cancel their own request.
class MemberRespondsToExtension {
  final RemoteDataSource _remoteDataSource;
  MemberRespondsToExtension(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, bool approve, User user) async {
    if (!input.hasExtensionRequest) {
      return Left(Failure(300, 'There is no extension request to respond to.'));
    }
    final ownRequest = input.extensionRequestedBy == user.id;
    if (approve && ownRequest) {
      return Left(Failure(300, 'The other members have to approve your extension request.'));
    }
    if (approve && input.extensionApprovals.contains(user.id)) {
      return Left(Failure(300, 'You have already approved this extension.'));
    }

    try {
      final response = await _remoteDataSource.respondToExtension(input.id ?? -1, approve);

      //Send notification
      final name = user.toUserInput().username;
      final date = DateFormat('d MMM yyyy').format(input.extensionExpiresAt!);
      return await sendNotificationToAllMembersExceptSender(
        input,
        response,
        approve ? "$name approved extending ${input.title} to $date"
            : ownRequest ? "$name cancelled the request to extend ${input.title}"
            : "$name declined extending ${input.title} to $date",
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
