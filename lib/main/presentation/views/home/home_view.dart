import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/user_image.dart';
import 'package:trust_pay_beta/components/buttons/main_menu_button.dart';
import 'package:trust_pay_beta/components/buttons/quick_menu_btn.dart';
import 'package:trust_pay_beta/components/data_cards/account_card.dart';
import 'package:trust_pay_beta/components/list_iems/transaction_obligation_item.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/app/routes.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/presentation/base/app_horizontal_menu.dart';
import 'package:trust_pay_beta/main/presentation/base/progress_indicator.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction/transaction_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/view/transaction_details_view.dart';

class HomeView extends StatelessWidget {
  static const String routeName = '/home';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: MainMenuButton(
          size: AppSize.s48,
          padding: AppSize.s8,
          icon: SvgIconAssets.menu,
          onTap: () {
            Navigator.of(context).pushNamed(Routes.catalogue);
          },
          background: AppColor.primary),
      body: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, transactionState) {
          return BlocBuilder<UserBloc, UserState>(
            builder: (context, userState) {
              List<Transaction>? transactions = transactionState.transactions;
              User? user = userState.user;

              return transactions == null || user == null
                  ? const AppCircleProgressIndicator()
                  : Container(
                      color: AppColor.white,
                      child: Stack(
                        children: [
                          _buildBackgroundPattern(width, height),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppSize.s16),
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height: MediaQuery.of(context)
                                            .viewPadding
                                            .top),
                                    const SizedBox(height: AppSize.s16),
                                    _buildTitleSection(user),
                                    const SizedBox(height: AppSize.s16),
                                    AccountCard(
                                        balance:
                                            user.account?.balance?.toString() ??
                                                '0',
                                        width: width,
                                        height: width * 0.45,
                                        solid: false),
                                    const SizedBox(height: AppSize.s16),
                                  ],
                                ),
                              ),
                              Container(
                                color: AppColor.secondary,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppSize.s16),
                                width: width,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: AppSize.s8),
                                          child: Text('Quick Actions',
                                              style: appTextGray16),
                                        ),
                                      ],
                                    ),
                                    AppHorizontalMenu(
                                      itemSize: width / 3.5,
                                      items: _buildQuickMenuItems(
                                          context: context,
                                          size: width / 3.5,
                                          onClick: (index) {
                                            Navigator.pushNamed(context,
                                                Routes.transactionsHome,
                                                arguments:
                                                    _getTransactionType(index));
                                          }),
                                    ),
                                    const SizedBox(height: AppSize.s8),
                                    // AppCarousel(height: 200),
                                  ],
                                ),
                              ),
                              const SizedBox(height: AppSize.s8),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppSize.s16),
                                  child: _buildHistorySection(
                                      context, transactions, height),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
            },
          );
        },
      ),
    );
  }
}

_buildHistorySection(context, List<Transaction> itemInputs, height) {
  return Column(children: [
    const SizedBox(height: AppSize.s8),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Transaction History",
          style: appTextGray14,
        ),
        Text(
          "View all",
          style: appTextPrimary14Bold,
        ),
      ],
    ),
    const SizedBox(height: AppSize.s16),
    Expanded(
      child: SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: itemInputs.map((item) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.transactionsDetails,
                          arguments: TransactionDetailsViewArguments(
                              transaction: item,
                              viewType: TransactionDetailsViewState.details));
                    },
                    child: TransactionObligationItem(
                      size: height / 16,
                      amount: item.total,
                      title: item.title,
                      date: item.expiryDate,
                      transaction: item.toTransactionInput(),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s8,
                  )
                ],
              );
            }).toList()),
      ),
    )
  ]);
}

_buildQuickMenuItems(
    {required BuildContext context,
    required double size,
    required Function(int index) onClick}) {
  return List.generate(4, (index) {
    return QuickMenuButton(
        color: AppColor.white,
        type: _getTransactionType(index),
        size: size,
        onTap: () {
          onClick(index);
        });
  });
}

_getTransactionType(index) {
  switch (index) {
    case 0:
      return TransactionType.secureSales;
    case 1:
      return TransactionType.betsWagers;
    case 2:
      return TransactionType.billSplitter;
    case 3:
      return TransactionType.moneyPool;
    default:
      return TransactionType.moneyPool;
  }
}

_buildBackgroundPattern(width, height) {
  return Align(
    alignment: Alignment.topCenter,
    child: Stack(
      children: [
        Container(
          color: AppColor.primary,
          width: width,
          height: height * 0.3,
        ),
        Image.asset(
          ImageAssets.patternTwo,
          fit: BoxFit.cover,
          width: width,
          height: height * 0.3,
        ),
      ],
    ),
  );
}

_buildTitleSection(User user) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          UserImage(image: user.profileImage, size: AppSize.s48),
          const SizedBox(width: AppSize.s4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hello ${user.firstName}', style: appTextWhite18Bold),
              Text(
                'Welcome to TrustPay',
                style: appTextWhite14,
              ),
            ],
          ),
        ],
      ),
      Row(
        children: [
          SvgPicture.asset(SvgIconAssets.search_icon,
              height: AppSize.s32, width: AppSize.s32),
          const SizedBox(width: AppSize.s8),
          SvgPicture.asset(SvgIconAssets.alert_icon,
              height: AppSize.s32, width: AppSize.s32),
        ],
      ),
    ],
  );
}
