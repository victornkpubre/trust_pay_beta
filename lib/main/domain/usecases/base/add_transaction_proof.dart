import 'package:dartz/dartz.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/data/mappers/mapper.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/functions/proof_capture.dart';

/// Uploads a captured photo/video proof (with its GPS location) to a
/// transaction, optionally tied to specific obligations. Returns the
/// transaction with the new proof added.
class AddTransactionProof {
  final RemoteDataSource _remoteDataSource;
  AddTransactionProof(this._remoteDataSource);

  Future<Either<Failure, Transaction>> execute(Transaction input, CapturedProof proof, {List<int> obligationIds = const []}) async {
    if (input.id == null || input.id == -1) {
      return Left(Failure(300, 'Invalid Transaction'));
    }

    try {
      final response = await _remoteDataSource.uploadTransactionProof(input.id!, proof, obligationIds);
      if (response.status != 200 || response.proof == null) {
        return Left(Failure(response.status ?? 500, response.message ?? 'Proof upload failed'));
      }
      return Right(input.copyWith(proofs: [...input.proofs, response.proof.toDomain()]));
    }
    catch (e) {
      return Left(Failure.fromError(e));
    }
  }
}
