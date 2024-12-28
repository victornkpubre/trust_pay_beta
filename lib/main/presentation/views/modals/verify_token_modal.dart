import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/components/popups/flows/token_verification_popup.dart';
import 'package:trust_pay_beta/main/domain/entities/transaction/entities.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_details_bloc.dart';

void showVerifyTokenModal(context, Obligation obligation, TransactionDetailsState state) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {

      return TokenVerificationPopup(
          width: MediaQuery.of(context).size.width,
          obligation: obligation,
          onVerifyToken: (token) {
            //Set obligation token
            if(obligation.id != null) {
              context.read<TransactionDetailsBloc>().add(
                  TransactionDetailsEvent.verifyToken(obligation.id??-1, token, obligation, state)
              );
            }
          });
    },
  );
}
