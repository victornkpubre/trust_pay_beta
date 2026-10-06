import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/components/popups/flows/token_generation_popup.dart';
import 'package:trust_pay_beta/main/domain/entities/base/entities.dart';
import 'package:trust_pay_beta/main/domain/entities/transaction/entities.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_details_bloc.dart';

void showTokenModal(context, Transaction transaction, TransactionDetailsState state, Function(Obligation) onGenerated) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        List<int> obligationIds = [];
        return TokenGenerationPopup(
            width: MediaQuery.of(context).size.width,
            obligations: transaction.obligations
                .where((o) => o.type == ObligationType.delivery)
                .map((o) => TokenGenerationObligationInput(o.id, o.title))
                .toList(),
            onSelect: (value) {
              obligationIds.add(value);
            },
            onGenerateToken: (token) {
              //Set obligation token
              final obligations = transaction.obligations.where((o) => obligationIds.contains(o.id)).toList();
              for (final obligation in obligations) {
                onGenerated(obligation.copyWith(token: token));
              }
            });
      },
    );
}
