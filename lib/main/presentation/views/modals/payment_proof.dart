import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/popups/flows/proof_capture_popup.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

/// When the transaction requires proof, the member adds a photo/video for
/// [payment] before paying it. Returns the transaction (with the new proof)
/// to pay with, or null if they backed out. Secure sales are left alone:
/// there the proof is for the seller's deliveries, not the buyer's payment.
Future<Transaction?> ensurePaymentProof(BuildContext context, Transaction transaction, Obligation payment) async {
  if (!transaction.proofRequired
      || transaction.type == TransactionType.secureSales
      || transaction.proofsFor(payment.id).isNotEmpty) {
    return transaction;
  }
  return showProofCaptureModal(
    context,
    transaction,
    obligationIds: [if (payment.id != null) payment.id!],
    subtitle: 'This transaction requires proof. Take a photo or video before you pay; '
        'your GPS location is recorded with it.',
  );
}
