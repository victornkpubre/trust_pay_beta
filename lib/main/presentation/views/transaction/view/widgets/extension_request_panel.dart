import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/buttons/secondary_btn.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/components/tiles/notice_tile.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/functions/expiry.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_details_bloc.dart';

/// Moving a transaction's expiry date: any member requests a new date and
/// every other member approves it (any of them can decline). Shows the
/// request button, a waiting notice, or Approve/Decline.
class ExtensionRequestPanel extends StatelessWidget {
  final Transaction transaction;
  final User currentUser;
  final double width;

  const ExtensionRequestPanel({
    super.key,
    required this.transaction,
    required this.currentUser,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    if (!transaction.isActive) return const SizedBox.shrink();

    if (!transaction.hasExtensionRequest) {
      final expired = transaction.expiryDate.isBefore(DateTime.now());
      return SecondaryButton(
        title: expired ? 'Expired: Request Extension' : 'Extend Expiry Date',
        onTap: () => _pickDate(context),
      );
    }

    final date = DateFormat('dd-MM-yyyy').format(transaction.extensionExpiresAt!);
    final waitingFor = transaction.extensionApproversLeft
        .where((u) => u.id != currentUser.id)
        .map((u) => u.toUserInput().username)
        .join(', ');

    if (transaction.extensionRequestedBy == currentUser.id) {
      return Column(
        children: [
          _notice('Waiting for $waitingFor to approve the new expiry date: $date'),
          TextButton(
            onPressed: () => _respond(context, false),
            child: Text('Cancel request', style: TextStyle(color: AppColor.red)),
          ),
        ],
      );
    }

    if (transaction.extensionApprovals.contains(currentUser.id)) {
      return _notice('You approved the new expiry date ($date). Waiting for $waitingFor.');
    }

    final requester = transaction.members
        .where((u) => u.id == transaction.extensionRequestedBy)
        .map((u) => u.toUserInput().username)
        .firstOrNull ?? 'A member';
    return Column(
      children: [
        _notice('$requester asked to extend the expiry date to $date'),
        const SizedBox(height: AppSize.s8),
        Row(
          children: [
            Expanded(child: SecondaryButton(title: 'Decline', onTap: () => _respond(context, false))),
            const SizedBox(width: AppSize.s8),
            Expanded(child: PrimaryButton(title: 'Approve', onTap: () => _respond(context, true))),
          ],
        ),
      ],
    );
  }

  Widget _notice(String text) {
    return NoticeTile(
      width: width,
      richText: Text(text, style: appTextAmber16.copyWith(height: 1.2)),
    );
  }

  Future<void> _pickDate(BuildContext context) async {
    // Later than both tomorrow and the current expiry date.
    final dayAfterExpiry = DateTime(transaction.expiryDate.year, transaction.expiryDate.month, transaction.expiryDate.day + 1);
    final earliest = earliestExpiryDate();
    final firstDate = dayAfterExpiry.isAfter(earliest) ? dayAfterExpiry : earliest;

    final date = await showDatePicker(
      context: context,
      helpText: 'New expiry date',
      initialDate: firstDate,
      firstDate: firstDate,
      lastDate: DateTime(2050),
    );
    if (date == null || !context.mounted) return;

    final bloc = context.read<TransactionDetailsBloc>();
    bloc.add(TransactionDetailsEvent.requestExtension(currentUser, date, transaction, context, bloc.state));
  }

  void _respond(BuildContext context, bool approve) {
    final bloc = context.read<TransactionDetailsBloc>();
    bloc.add(TransactionDetailsEvent.respondToExtension(currentUser, approve, transaction, context, bloc.state));
  }
}
