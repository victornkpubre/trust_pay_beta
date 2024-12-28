import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/components/tiles/transaction_members_tile.dart';
import 'package:trust_pay_beta/components/tiles/user_profile_tile.dart';

class PayeeUserIndicator extends StatelessWidget {
  final String? title;
  final List<UserInput> users;
  final DateTime date;
  final double amount;
  final double width;
  final bool group;
  final double percentageCompletion;
  final bool showIndicator;
  final bool showShadow;
  const PayeeUserIndicator(
      {super.key,
      required this.date,
      required this.amount,
      required this.percentageCompletion,
      required this.width,
      required this.users,
      this.title, 
      this.showIndicator = true, 
      required this.group, 
      this.showShadow = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: AppColor.secondary,
        boxShadow: showShadow? [boxShadowThree]: null,
        borderRadius: showIndicator?
        const BorderRadius.only(
          topLeft: Radius.circular(AppSize.s10),
          topRight: Radius.circular(AppSize.s10)
        ):
        const BorderRadius.all(Radius.circular(AppSize.s10))
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.s8),
            child: Column(
              children: [
                const SizedBox(height: AppSize.s8),
                title != null
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: Text(title!, style: appTextGray18))
                    : Container(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    !group? 
                    Expanded(
                        child: UserProfileTile(
                          size: AppSize.s48,
                          username: users[0].username,
                          account: users[0].account,
                          image: users[0].image,
                          expanded: false,
                          primaryColor: AppColor.grayAccent,
                          secondaryColor: AppColor.grayAccent,
                        ),
                      )
                    : Expanded(
                        child: TransactionMembersTile(
                            showCount: true,
                            iconSize: AppSize.s48,
                            primaryColor: AppColor.darkGray,
                            secondaryColor: AppColor.lightGray,
                            members: users
                        ),
                      ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          parseAmountDouble(amount),
                          textAlign: TextAlign.center,
                          style: appTextGreen16Bold,
                        ),
                        const SizedBox(height: AppSize.s4),
                        Text(
                          parseDate(date),
                          style: TextStyle(
                            color: AppColor.darkGray,
                            fontSize: FontSize.s14,
                            fontFamily: 'Source Sans Pro',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          showIndicator? Padding(
            padding: const EdgeInsets.all(2),
            child: Stack(
              children: [
                Container(
                  height: 6,
                  width: width,
                  decoration: ShapeDecoration(
                    color: AppColor.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s10),
                    ),
                  ),
                ),
                Container(
                  height: 6,
                  width: width * percentageCompletion,
                  decoration: ShapeDecoration(
                    color: AppColor.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s10),
                    ),
                  ),
                ),
              ],
            ),
          ): const SizedBox(height: 4)
        ],
      ),
    );
  }
}