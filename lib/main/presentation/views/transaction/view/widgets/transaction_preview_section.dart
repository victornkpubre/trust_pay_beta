import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/list_iems/user_profile_status_list_item.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/view/transaction_details_view.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/view/widgets/preview_sections/bet_wager.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/view/widgets/preview_sections/bill_splitter.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/view/widgets/preview_sections/group_goals.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/view/widgets/preview_sections/money_pool.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/view/widgets/preview_sections/secure_sales.dart';


class TransactionDetailsPreviewSection extends StatefulWidget {
  final double width;
  final TransactionDetailsViewState state;
  final Transaction transaction;
  final User currentUser;
  const TransactionDetailsPreviewSection({
    super.key, 
    required this.width, 
    required this.transaction, 
    required this.currentUser, 
    required this.state, 
  });

  @override
  State<TransactionDetailsPreviewSection> createState() => _TransactionDetailsPreviewSectionState();
}

class _TransactionDetailsPreviewSectionState extends State<TransactionDetailsPreviewSection> {
  late List<bool> payoutVisibilities; 

  @override
  void initState() {
    payoutVisibilities = [];
   
    for (var o in widget.transaction.obligations) {
      if(o.type == ObligationType.payout) {
        payoutVisibilities.add(false);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ObligationInput> obligations = widget.transaction.obligations.map((o) => o.toObligationInput()).toList();
    List<UserInput> userInputs = widget.transaction.members.map((m) => m.toUserInput()).toList();

    switch (widget.transaction.type) {
      case TransactionType.secureSales:
        return SecureSalesPreview(obligations);
      case TransactionType.billSplitter:
        return widget.transaction.members.isNotEmpty? 
          BillSplitterPreview(width: widget.width, state: widget.state, transaction: widget.transaction, currentUser: widget.currentUser, users: userInputs):
          Container();
      case TransactionType.betsWagers:
        return widget.transaction.mediation != null?
          BetWagerPreview(
            width: widget.width, 
            state: widget.state, 
            username: userInputs[1].username, 
            mediation: widget.transaction.mediation!,
            date: widget.transaction.expiryDate
          ):
          Container();
      case TransactionType.groupGoals:
        return GroupGoalPreview(
          width: widget.width, 
          transaction: widget.transaction, 
          currentUser: widget.currentUser, 
          state: widget.state
        );
      default:
        return MoneyPoolPreview(
          width: widget.width, 
          transaction: widget.transaction, 
          currentUser: widget.currentUser, 
          state: widget.state, 
          payoutVisibility: payoutVisibilities, 
          onVisibilityToggle: (index){
            for (var i = 0; i < payoutVisibilities.length; i++) {
              if(i == index){
                payoutVisibilities[i] = !payoutVisibilities[i];
              }
              else {
                payoutVisibilities[i] = false;
              }
            }
            setState(() {
              
            });
          }
        );
    }
  }
}


buildPayoutTile(Obligation o, bool expanded, User binding) {
  return Container(
    color: expanded? AppColor.lightGray: null,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        !expanded? const SizedBox(height: AppSize.s16): Container(),
        Container(
          padding: expanded? const EdgeInsets.only(
            top: AppSize.s4,
            right: AppSize.s8,
            left: AppSize.s8,
          ): null,
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
                        color: o.status==ObligationStatus.paid?AppColor.green: null,
                        borderRadius: BorderRadius.circular(AppSize.s24),
                        border: Border.all(color: o.status==ObligationStatus.paid? 
                          AppColor.green: AppColor.amber, width: 2
                        )
                      ),
                      child: o.status==ObligationStatus.paid? Icon(Icons.check, size: AppSize.s16, color: AppColor.white): null,
                    ),
                  ),
                  const SizedBox(width: AppSize.s8),
                  Text(parseDateMonthYear(o.dueDate), style: appTextGray16)
                ],
              ),
              Icon(expanded? FontAwesomeIcons.angleUp: FontAwesomeIcons.angleRight, size: AppSize.s16)
            ],
          ),
        ),
        !expanded? const SizedBox(height: AppSize.s16): Container(),
    
        !expanded? Container():
        Column(
          children: [
            const SizedBox(height: AppSize.s16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
              child: UserProfileStatusListItem(
                user: binding.toUserInput(),
                amount: o.amount,
                obligationStatus: o.status,
                textColor: AppColor.darkGray,
                onDelete: () {},
              ),
            ),
            const SizedBox(height: AppSize.s16),
          ],
        ),
      ],
    ),
  );
}

double getPercentageOfBillPaid(Transaction transaction) {
  double totalPayment = 0;
  double paymentMade = 0;

  for (var value in transaction.obligations) {
    if(value.type == ObligationType.payment) {
      totalPayment = totalPayment + value.amount;
    }

    if(value.type == ObligationType.payment && value.status == ObligationStatus.paid) {
      paymentMade = paymentMade + value.amount;
    }
  }

  return paymentMade/totalPayment;
}

double? getUserObligationAmount(User user, List<Obligation> obligations) {
  Obligation o = obligations.firstWhere((obligation) {
    if(obligation.binding == null) return false;
    return obligation.binding! == user.id && obligation.type == ObligationType.payment;
  });

  return o.amount;
}