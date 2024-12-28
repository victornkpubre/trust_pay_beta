import 'package:trust_pay_beta/main/domain/entities/entities.dart';

class SellerAcceptsTransaction {
  Transaction execute(Transaction transaction, String reason) {
    return transaction.copyWith(
        note: reason,
        status: TransactionStatus.accepted
    );
  }
}