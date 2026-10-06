import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/components/popups/flows/token_verification_popup.dart';
import 'package:trust_pay_beta/main/domain/entities/transaction/entities.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_details_bloc.dart';

void showVerifyTokenModal(context, Obligation obligation, TransactionDetailsState state, Function(Obligation) onVerify, {String currency = 'NGN'}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {

      return TokenVerificationPopup(
          width: MediaQuery.of(context).size.width,
          obligation: obligation,
          currency: currency,
          onVerifyToken: (token) {
            //Check obligation token
            if(obligation.id != null ) {
              if(obligation.token!=null && token.compareTo(obligation.token!)==0) {
                onVerify(obligation);
              }
              else {
                showSnackBar(context: context, message: 'Invalid Token');
              }
            }
          });
    },
  );
}
