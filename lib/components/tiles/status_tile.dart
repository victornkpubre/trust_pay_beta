import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/texts/status_text.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

class StatusTile extends StatelessWidget {
  final TransactionStatus status;
  final double size;
  const StatusTile({super.key, required this.status, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: getBackgroundColor(TransactionStatus.pending),
      ),
      child: StatusText(status: status, fontSize: size),
    );
  }
}
