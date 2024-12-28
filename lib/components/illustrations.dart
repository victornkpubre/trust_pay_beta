import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/illustrations/transaction_confrimation.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

class Illustrations extends StatelessWidget {
  const Illustrations({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("ILLUSTRATIONS", style: TextStyle(fontSize: 32)),
        SizedBox(height: 32),
        TransactionConfirmationIllustration(
          senderImage: ProfileIconAssets.avatar,
          receiverImage: ProfileIconAssets.avatar,
          type: TransactionType.secureSales,
          height: 64,
          state: TransactionConfirmationState.rejecting,
        )
      ],
    );
  }
}
