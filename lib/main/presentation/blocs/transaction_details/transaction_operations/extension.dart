import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/main/data/data_source/data_sources/remote_data_source.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/member_requests_extension.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/member_responds_to_extension.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_details_bloc.dart';

// The same for every transaction type.

Future<Either<Failure, Transaction>> requestExtensionOperation(BuildContext context,  Emitter emit, RequestExtension event) async {
  return MemberRequestsExtension(context.read<RemoteDataSource>())
      .execute(event.transaction, event.date, event.user);
}

Future<Either<Failure, Transaction>> respondToExtensionOperation(BuildContext context,  Emitter emit, RespondToExtension event) async {
  return MemberRespondsToExtension(context.read<RemoteDataSource>())
      .execute(event.transaction, event.approve, event.user);
}
