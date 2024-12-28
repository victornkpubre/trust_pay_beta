import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/buttons/add_btn.dart';
import 'package:trust_pay_beta/components/indicators/payee_user_indicator.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/components/tiles/transaction_members_tile.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/presentation/base/edit_user_list_view.dart';
import 'package:trust_pay_beta/main/presentation/base/user_search_view.dart';

class AddContributorsWidget extends StatelessWidget {
  final String title;
  final double amount;
  final User user;
  final DateTime date;
  final List<User> contributors;
  final Function(User) onAddContributor;
  final Function(List<User>) onEditContributor;
  const AddContributorsWidget({
    super.key,
    required this.width, required this.title, required this.amount, required this.user, required this.date, required this.contributors, required this.onAddContributor, required this.onEditContributor,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(AppSize.s16),
          decoration: BoxDecoration(
            color: AppColor.lightPurple,
            borderRadius: BorderRadius.circular(AppSize.s10),
            boxShadow: [boxShadowThree],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: appTextGray16Bold),
                  Text(parseAmountDouble(amount) , style: appTextAmber16),
                ],
              ),
              const SizedBox(height: 16),
    
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Contributors - ${contributors.length}', style: appTextPrimary12),
                  InkWell(
                    onTap: () async {
                      List<User>? result = await Navigator.push(context, MaterialPageRoute(builder: (context) => EditUserListView(list: contributors)));
                      if (result != null) {
                        onEditContributor(result);
                      }
                    },
                    child: Text('Edit', style: appTextPrimary14Bold)
                  ),
                ],
              ),
              const SizedBox(height: 4),
    
              Row(
                children: [
                  Expanded(
                    child: TransactionMembersTile(
                        iconSize: width / 10,
                        members: contributors.map((u) => u.toUserInput()).toList(),
                        primaryColor: AppColor.gray,
                        secondaryColor: AppColor.grayAccent,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
    
              Text('First Harvest - ${parseDateSecondary(DateTime(date.year, date.month+1, date.day))}', style: appTextGray12.copyWith(
                color: AppColor.grayAccent
              ))
            ],
          ),
        ),
        const SizedBox(height: 16),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('First Harvester', style: appTextGray14Bold.copyWith(
              color: AppColor.grayAccent
            )),
            const SizedBox(height: AppSize.s8),
            PayeeUserIndicator(
              date: DateTime(date.year, date.month, date.day), 
              group: false,
              showIndicator: false,
              showShadow: true,
              amount: amount, 
              percentageCompletion: 0, 
              width: width, 
              users: [contributors[0].toUserInput()], 
            ),
          ],
        ),
        const SizedBox(height: 16),

        Align(
          alignment: Alignment.centerRight,
          child: AddButtton(
            title: "Add Contributor",
            solid: true,
            onTap: () async {
              User? result = await Navigator.push(context, MaterialPageRoute(builder: (context) => const UserSearchView()));
              if (result != null) {
                onAddContributor(result);
              }
            }
          ),
        ),
        const SizedBox(height: 64),
    
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Monthly Payout", style: appTextGray14Bold.copyWith(
            color: AppColor.grayAccent
          ))
        ),
        const SizedBox(height: 8),
    
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: AppColor.whiteSecondary,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: AppColor.lightGray),
          ),
          child: Center(child: Text(parseAmountDouble(amount), style: appTextBlack24Bold)),
        ),
      ],
    );
  }
}