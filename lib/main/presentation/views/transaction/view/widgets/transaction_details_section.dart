import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_details_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';
import '../../../../../../components/base/app_sizes.dart';
import '../../../../../../components/base/base.dart';
import '../../../../../../components/list_iems/user_profile_status_list_item.dart';
import '../../../../../../components/style/colors.dart';
import '../../../../../../components/style/text.dart';
import 'detail_sections/bet_wager.dart';
import 'detail_sections/bill_splitter.dart';
import 'detail_sections/group_goals.dart';
import 'detail_sections/money_pool.dart';
import 'detail_sections/secure_sales.dart';


class TransactionDetailsSection extends StatelessWidget {
  final double width;
  final Transaction transaction;
  final TransactionDetailsState state;

  const TransactionDetailsSection(
      {super.key,
      required this.transaction,
      required this.width,
      required this.state});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionDetailsBloc, TransactionDetailsState>(
      builder: (context, transactionState) {
        return BlocBuilder<UserBloc, UserState>(
          builder: (context, userState) {
            return Container(
              child: getWidget(context, transactionState, userState, width),
            );
          },
        );
      },
    );
  }

  Widget getWidget(BuildContext context, TransactionDetailsState transactionState, UserState userState, double width) {
    List<Obligation> obligations = transaction.obligations
        .where((o) => o.type == ObligationType.delivery)
        .toList();
    switch (transaction.type) {
      case TransactionType.secureSales:
        return userState.user==null?Container(): SecureSalesDetails(
            width: width,
            context: context,
            currentUser: userState.user!,
            transaction: transaction,
            state: state,
            obligations: obligations,
            tokens: obligations.map((o) => o.token ?? '').toList(),
            tokenVisibilities: state.tokenVisibilities,
            onTokenVisibilityToggle: (index) {
              context
                  .read<TransactionDetailsBloc>()
                  .add(TransactionDetailsEvent.toggleTokenVisibility(index, state));
            });
      case TransactionType.billSplitter:
        return BillSplitterDetails(
            width: width,
            percentageCompletion: transaction.percentageComplete,
            payee: transaction.payee,
            transaction: transaction);
      case TransactionType.betsWagers:
        return BetWagerDetails(
            width: width,
            url: transaction.mediation!.getUrl()!,
            details: transaction.mediation!.details,
            username: transaction.members[0].firstName,
            date: transaction.dateCreated);
      case TransactionType.groupGoals:
        return GroupGoalDetails(
            width: width,
            transaction: transaction,
            fulfilmentVisibilities: state.fulfilmentVisibilities,
            onVisibilityToggle: (index) {
              context
                  .read<TransactionDetailsBloc>()
                  .add(TransactionDetailsEvent.toggleFulfilmentVisibility(index, state));
            });
      case TransactionType.moneyPool:
        return MoneyPoolDetails(
            width: width,
            transaction: transaction,
            payoutVisibility: state.payoutVisibilities,
            onVisibilityToggle: (index) {
              context
                  .read<TransactionDetailsBloc>()
                  .add(TransactionDetailsEvent.togglePayoutVisibilities(index, state));
            });
      default:
        return userState.user==null?Container(): SecureSalesDetails(
            width: width,
            context: context,
            currentUser: userState.user!,
            transaction: transaction,
            state: state,
            obligations: obligations,
            tokens: obligations.map((o) => o.token ?? '').toList(),
            tokenVisibilities: state.tokenVisibilities,
            onTokenVisibilityToggle: (index) {
              context
                  .read<TransactionDetailsBloc>()
                  .add(TransactionDetailsEvent.toggleTokenVisibility(index, state));
            });
    }
  }
}

bool noTokensGenerated(List<String> tokenList) {
  return tokenList.fold(false, (i, element) {
    if (element.isNotEmpty) {
      return true;
    } else {
      return i || false;
    }
  });
}


Widget buildPayoutTile(Transaction transaction, Obligation obligation,
    List<Obligation> obligations, bool expanded) {
  User payee =
  transaction.members.firstWhere((t) => t.id == obligation.binding);
  return Container(
    color: expanded ? AppColor.lightGray : null,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        !expanded ? const SizedBox(height: AppSize.s16) : Container(),
        Container(
          padding: expanded
              ? const EdgeInsets.only(
            top: AppSize.s4,
            right: AppSize.s8,
            left: AppSize.s8,
          )
              : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: AppSize.s24,
                    height: AppSize.s24,
                    child: Container(
                      decoration: BoxDecoration(
                          color: obligation.status == ObligationStatus.paid
                              ? AppColor.green
                              : null,
                          borderRadius: BorderRadius.circular(AppSize.s24),
                          border: Border.all(
                              color: obligation.status == ObligationStatus.paid
                                  ? AppColor.green
                                  : AppColor.amber,
                              width: 2)),
                      child: obligation.status == ObligationStatus.paid
                          ? Icon(Icons.check,
                          size: AppSize.s16, color: AppColor.white)
                          : null,
                    ),
                  ),
                  const SizedBox(width: AppSize.s8),
                  Text(parseDateMonthYear(obligation.dueDate),
                      style: appTextGray16)
                ],
              ),
              Icon(
                  expanded
                      ? FontAwesomeIcons.angleUp
                      : FontAwesomeIcons.angleRight,
                  size: AppSize.s16)
            ],
          ),
        ),
        !expanded ? const SizedBox(height: AppSize.s16) : Container(),
        !expanded
            ? Container()
            : Column(
          children: [
            const SizedBox(height: AppSize.s8),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: AppSize.s16),
              child: Column(
                children: [
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Harvester')
                  ),
                  UserProfileStatusListItem(
                    user: payee.toUserInput(),
                    amount: obligation.amount,
                    obligationStatus: obligation.status,
                    textColor: AppColor.darkGray,
                    onDelete: () {},
                  ),
                  const SizedBox(height: AppSize.s16),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Contributors')),
                  Column(
                    children: obligations.map((obligation) {
                      User binding = transaction.members
                          .firstWhere((t) => t.id == obligation.binding);
                      return obligation.binding == null
                          ? Container()
                          : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          UserProfileStatusListItem(
                            user: binding.toUserInput(),
                            textColor: AppColor.darkGray,
                            amount: obligation.amount,
                          ),
                          const SizedBox(height: AppSize.s16),
                        ],
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
            const SizedBox(height: AppSize.s8),
          ],
        ),
      ],
    ),
  );
}