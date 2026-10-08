import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/popups/flows/proof_capture_popup.dart';
import 'package:trust_pay_beta/components/popups/flows/token_generation_popup.dart';
import 'package:trust_pay_beta/main/domain/entities/base/entities.dart';
import 'package:trust_pay_beta/main/domain/entities/transaction/entities.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_details_bloc.dart';

/// Seller's fulfilment flow: pick delivery obligations, attach photo/video
/// proof with GPS (mandatory for secure sales), then generate the token.
/// [onGenerated] gets each fulfilled obligation and the transaction
/// including the new proof.
void showTokenModal(BuildContext context, Transaction transaction, TransactionDetailsState state, Function(Obligation, Transaction) onGenerated) {
    // Updated as proof is uploaded, so fulfilment sees the new proof.
    Transaction current = transaction;
    List<int> obligationIds = [];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext sheetContext) {
        return TokenGenerationPopup(
            width: MediaQuery.of(sheetContext).size.width,
            obligations: transaction.obligations
                .where((o) => o.type.isFulfilment)
                .map((o) => TokenGenerationObligationInput(o.id, o.title))
                .toList(),
            onSelect: (_) {},
            onRequireProof: (ids) async {
              obligationIds = ids;
              final missingProof = ids.where((id) => current.proofsFor(id).isEmpty).toList();
              if (missingProof.isEmpty) return true;
              // Required for deliveries; for attendance it's only suggested.
              final deliveryNeedsProof = current.obligations
                  .any((o) => missingProof.contains(o.id) && o.type == ObligationType.delivery);

              final updated = await showProofCaptureModal(
                context,
                current,
                obligationIds: missingProof,
                subtitle: deliveryNeedsProof
                    ? 'Take a photo or video showing the delivery. Your GPS location is recorded with it. '
                      'This is required before you can generate a token.'
                    : 'Recommended: take a photo or video showing you attended. Your GPS location is recorded '
                      'with it. Close this to skip.',
              );
              if (updated == null) return !deliveryNeedsProof;
              current = updated;
              return true;
            },
            onGenerateToken: (token) {
              //Set obligation token
              final obligations = current.obligations.where((o) => obligationIds.contains(o.id)).toList();
              for (final obligation in obligations) {
                onGenerated(obligation.copyWith(token: token), current);
              }
            });
      },
    );
}
