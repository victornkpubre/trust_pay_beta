import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/buttons/add_btn.dart';
import 'package:trust_pay_beta/components/inputs/app_secondary_dropdown.dart';
import 'package:trust_pay_beta/components/list_iems/add_user_item.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/components/tiles/payee_tile.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';
import 'package:trust_pay_beta/main/presentation/base/user_search_view.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/create/bill_splitter/create_bill_splitter_view.dart';

class TransactionDetails extends StatefulWidget {
  final double width;
  final DateTime? date;
  final User payee;
  final User user;
  final int splitType;
  final bool deleting;
  final bool editing;
  final List<double> subAmounts;
  final List<double> percentages;
  final List<User> contributors;
  final TextEditingController amountController;
  final TextEditingController titleController; 
  final Function(int) onDelete;
  final Function(double?) onChange;
  final Function(User) onUserSelected;
  final Function(int) onSplitTypeSelected;


  const TransactionDetails({super.key, required this.width, this.date, required this.payee, required this.user, required this.splitType, required this.deleting, required this.editing, required this.subAmounts, required this.percentages, required this.contributors, required this.amountController, required this.titleController, required this.onDelete, required this.onUserSelected, required this.onSplitTypeSelected, required this.onChange});

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  late bool deleting;

  @override
  void initState() {
    deleting = widget.deleting;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      PayeeTile(
        payee: widget.payee.toUserInput().username, 
        amount: double.parse(widget.amountController.text.toString().replaceAll('.', '').replaceAll(',', '')),
        date: widget.date!, 
        title: widget.titleController.text
      ),
      AppSecondaryDropDownInput(
          width: widget.width,
          items: getSplitTypes(),
          onSelect: (index) {
            widget.onSplitTypeSelected(index);
            getSplitTypes();
          }),
      const SizedBox(height: AppSize.s16),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Contributors', style: appTextGray16),
        ],
      ),
      const SizedBox(height: AppSize.s8),
      ListView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        itemCount: widget.contributors.length,
        itemBuilder: (context, index) {
          UserInput userInput = widget.contributors[index].toUserInput();

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(thickness: 1, color: AppColor.lightGray, height: 0),
              const SizedBox(height: AppSize.s8),
              GestureDetector(
                onHorizontalDragEnd: (DragEndDetails drag) {
                  if(drag.primaryVelocity == null) return;
                  if(drag.primaryVelocity! < 0) {
                    setState(() {
                      deleting = true;
                    });

                    Future.delayed(const Duration(seconds: 2)).then((_) {
                      setState(() {
                        deleting = false;
                      });
                    });
                  }
                  else {
                    setState(() {
                      deleting = false;
                    });
                  }
                },
                child: AddUserItem(
                  username: userInput.username,
                  image: userInput.image,
                  account: userInput.account,
                  percentage: SplitType.values[widget.splitType] == SplitType.splitByPercentage? 
                    widget.percentages[index].toString(): null,
                  deleting: deleting,
                  editing: widget.editing,
                  amount: parseAmountDouble(widget.subAmounts[index]),
                  selecting: false,
                  selected: false,
                  onChange: (value) {
                    if(value != null) {
                      if(SplitType.values[widget.splitType] == SplitType.splitByPercentage) {
                        widget.percentages[index] = value;
                      }
                      else {
                        widget.subAmounts[index] = value;
                      }
                      widget.onChange(value);
                    }
                  },
                  onDelete: () {
                    if(widget.contributors[index] == widget.user) {
                      toast(
                        message: "Wrong Entry: You can't remove yourself from the list. Try cancelling the transaction", 
                        color: AppColor.red
                      );
                    }
                    else {
                      widget.onDelete(index);
                    }
                  },
                ),
              ),
              const SizedBox(height: AppSize.s8),
            ],
          );
        }
      ),
      const SizedBox(height: AppSize.s8),
      Align(
        alignment: Alignment.centerLeft,
        child: AddButtton(
            title: "Add Contributor",
            solid: false,
            onTap: () async {
              User? result = await Navigator.push(context, MaterialPageRoute(builder: (context) => const UserSearchView()));
              if (result != null) {
                widget.onUserSelected(result);
              }
            }),
      ),
      const SizedBox(height: AppSize.s32),
    ],
  );
  }
}

List<double> getSubAmounts(int length, int splitType, TextEditingController amountController, List<double> amounts) {
  if(SplitType.values[splitType] == SplitType.splitManually || SplitType.values[splitType] == SplitType.splitByPercentage) {
    if(amounts.isNotEmpty) {
      return amounts;
    }
  }
  double amount = 0;
  String amountValue =  amountController.text.replaceAll('.', '').replaceAll(',', '');
  amount =  amountValue.isEmpty?0: double.parse(amountValue);
  return List.generate(length, (i) => amount/length);
}

List<double> getPercentages(int length, int splitType, List<double> amounts) {
  if(SplitType.values[splitType] == SplitType.splitManually || SplitType.values[splitType] == SplitType.splitByPercentage) {
    if(amounts.isNotEmpty) {
      return amounts;
    }
  }
  return List.generate(length, (i) => double.parse((100/length).toStringAsFixed(2)));
}

bool formValidation(DateTime? date, TextEditingController amountController, TextEditingController titleController) {
  return date != null &&
    amountController.text.isNotEmpty &&
    titleController.text.isNotEmpty;
}

bool transactionValidation(Transaction transaction) {
  print("Total: ${transaction.total}");
  print("Obligations: ${transaction.obligations}");
  double obligationTotal = transaction.obligations.fold(0.0, (i, o){
    return i+o.amount;
  });
  bool transactionSubAmountsMatchTotal = obligationTotal == transaction.total;

  // bool transactionHasMinObligationRequiredByType = false; 
  // switch (transaction.type) {
  //   case TransactionType.betsAndWager:
  //     transactionHasMinObligationRequiredByType = true;
  //     break;
  //   case TransactionType.secureSales:
  //   case TransactionType.billSplitter:
  //   case TransactionType.groupGoals:
  //   case TransactionType.moneyPool:
  //     transactionHasMinObligationRequiredByType = transaction.obligations.length > 1;
  //     break;
  //   default:
  // }

  bool transactionHasMinMembersRequiredByType = false; 
  switch (transaction.type) {
    case TransactionType.betsWagers:
      transactionHasMinMembersRequiredByType = true;
      break;
    case TransactionType.secureSales:
    case TransactionType.billSplitter:
    case TransactionType.groupGoals:
    case TransactionType.moneyPool:
      transactionHasMinMembersRequiredByType = transaction.members.length > 1;
      break;
    default:
  }

  return transactionHasMinMembersRequiredByType && transactionSubAmountsMatchTotal;
}

List<String> getSplitTypes() {
  return SplitType.values.map((e) {
    switch (e) {
      case SplitType.splitEvenly:
        return "Split Evenly";
      case SplitType.splitByPercentage:
        return "Split By Percentage ";
      default:
        return "Split Manually";
    }
  }).toList();
}

