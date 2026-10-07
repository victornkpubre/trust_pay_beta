import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/base/user_image.dart';
import 'package:trust_pay_beta/components/buttons/back_button.dart';
import 'package:trust_pay_beta/components/inputs/app_search_input.dart';
import 'package:trust_pay_beta/components/list_iems/transaction_obligation_item.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction/transaction_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';


class SearchView extends StatelessWidget {
  static const String routeName = '/search';
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final searchController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColor.white,
      body: BlocBuilder<TransactionBloc, TransactionBlocState>(
        builder: (context, transactionState) {
          return BlocBuilder<UserBloc, UserState>(
              builder: (context, userState) {
                return Column(mainAxisSize: MainAxisSize.max, children: [
                  SizedBox(height: MediaQuery.of(context).viewPadding.top),
                  const SizedBox(height: AppSize.s16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        children: [
                          const AppBackButton(size: AppSize.s16),
                          const SizedBox(width: AppSize.s16),
                          Expanded(child: AppSearchInput(
                            hint: 'Search...',
                            controller: searchController,
                            onChange: (text) {
                              if (text.length > 1) {
                                context.read<TransactionBloc>().add(TransactionEvent.searchTransaction(text, AppConstants.pageSize, 1, transactionState));
                                context.read<UserBloc>().add(UserEvent.searchUsers(userState, text, AppConstants.pageSize, 1));
                              }
                            },
                          )),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSize.s8),

                  Expanded(child: SingleChildScrollView(child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        userState.userSearchResults!=null&&userState.userSearchResults!.isNotEmpty? Text('Users', style: appTextGray16): Container(),
                        const SizedBox(height: AppSize.s4),
                        Wrap(
                          spacing: AppSize.s16,
                          runSpacing: AppSize.s8,
                          children: userState.userSearchResults?.map((u) {
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
                          }).toList()??[],
                        ),
                        const SizedBox(height: AppSize.s16),
                        transactionState.transactionSearchResult!=null&&transactionState.transactionSearchResult!.isNotEmpty? Text('Transactions', style: appTextGray16): Container(),
                        const SizedBox(height: AppSize.s4),
                        Column(
                          children: transactionState.transactionSearchResult?.map((item) => Column(
                            children: [
                              TransactionObligationItem(
                                size: width / 8,
                                amount: item.total,
                                currency: item.currency,
                                title: item.title,
                                date: item.expiryDate,
                                transaction: item.toTransactionInput(),
                              ),
                              const SizedBox(
                                height: AppSize.s8,
                              )
                            ],
                          )).toList()??[],
                        ),
                      ],
                    ),
                  )))
                ]);
              },
            );
        },
      ),
    );
  }
}
