import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/base/user_image.dart';
import 'package:trust_pay_beta/components/buttons/back_button.dart';
import 'package:trust_pay_beta/components/inputs/app_search_input.dart';
import 'package:trust_pay_beta/components/list_iems/transaction_obligation_item.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/components/base/dummy_data.dart';

class SearchView extends StatelessWidget {
  static const String routeName = '/search';
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final searchController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Container(
          child: Column(mainAxisSize: MainAxisSize.max, children: [
        const SizedBox(height: AppSize.s16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
          child: Align(
            alignment: Alignment.topCenter,
            child: Row(
              children: [
                const AppBackButton(size: AppSize.s16),
                const SizedBox(width: AppSize.s16),
                Expanded(
                    child: AppSearchInput(
                  hint: 'Search...',
                  controller: searchController,
                )),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSize.s8),
        Expanded(
            child: SingleChildScrollView(
                child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Users', style: appTextGray16),
              const SizedBox(height: AppSize.s4),
              Wrap(
                spacing: AppSize.s16,
                runSpacing: AppSize.s8,
                children: users.map((u) {
                  UserInput user = u.toUserInput();
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      UserImage(image: user.image, size: width / 8),
                      const SizedBox(width: AppSize.s4),
                      Column(
                        children: [
                          Text(user.username, style: appTextBlack16Bold),
                          Text(user.account, style: appTextGray16),
                        ],
                      )
                    ],
                  );
                }).toList(),
              ),
              const SizedBox(height: AppSize.s16),
              Text('Transactions', style: appTextGray16),
              const SizedBox(height: AppSize.s4),
              Column(
                children: transactions
                    .map((item) => Column(
                          children: [
                            TransactionObligationItem(
                              size: width / 8,
                              amount: item.total,
                              title: item.title,
                              date: item.expiryDate,
                              transaction: item.toTransactionInput(),
                            ),
                            const SizedBox(
                              height: AppSize.s8,
                            )
                          ],
                        ))
                    .toList(),
              ),
            ],
          ),
        )))
      ])),
    );
  }
}
