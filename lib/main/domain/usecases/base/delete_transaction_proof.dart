import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

/// Deletes a proof the current user uploaded. Returns the transaction with
/// that proof removed.
class DeleteTransactionProof {
  final RemoteDataSource _remoteDataSource;
  DeleteTransactionProof(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, TransactionProof proof) async {
    if (input.id == null || input.id == -1) {
      return Left(Failure(300, 'Invalid Transaction'));
    }

    try {
      final response = await _remoteDataSource.deleteTransactionProof(input.id!, proof.id!);
      if (response.status != 200) {
        return Left(Failure(response.status ?? 500, response.message ?? 'Proof deletion failed'));
      }
      return Right(input.copyWith(
        proofs: input.proofs.where((p) => p.id != proof.id).toList(),
      ));
    }
    catch (e) {
      return Left(Failure.fromError(e));
    }
  }
}
