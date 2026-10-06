import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/back_button.dart';
import 'package:trust_pay_beta/components/buttons/quick_menu_btn.dart';
import 'package:trust_pay_beta/components/data_cards/transaction_stats_card.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/app/routes.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/presentation/base/app_carousel.dart';
import 'package:trust_pay_beta/main/presentation/base/progress_indicator.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';

class ServicesView extends StatelessWidget {
  static const String routeName = '/services';
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.white,
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, userState) {
          final user = userState.user;
          return user==null?
          Container(
              color: AppColor.white,
              child: const Center(child: AppCircleProgressIndicator())
          ):
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: MediaQuery.of(context).viewPadding.top),
              const SizedBox(height: AppSize.s16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Services',
                              style: appTextBlack18Bold,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const AppBackButton(size: AppSize.s16),
                  ],
                ),
              ),
              const SizedBox(height: AppSize.s8),
              Expanded( child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppCarousel(
                      height: height / 3,
                      viewportFraction: 0.8,
                      color: AppColor.secondary,
                      children: TransactionType.values.where((value) => value!=TransactionType.groupGoals).map((type) {
                        return TransactionStatsCard(
                            width: MediaQuery.of(context).size.width,
                            percentageComplete: getPercentageCompleteByType(type, user.transactionStatistics!),
                            type: type,
                            transactions: getTotalTransactions(type, user.transactionStatistics!),
                            successful: getSuccessfulTransactions(type, user.transactionStatistics!),
                            pending: getPendingTransactions(type, user.transactionStatistics!),
                        );
                      }).toList(),
                      onPageChange: (index){},
                    ),
                    const SizedBox(height: AppSize.s16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              child: const Text('Services', textAlign: TextAlign.start)
                            ),
                            const SizedBox(height: AppSize.s4),
                            Wrap(
                              runSpacing: AppSize.s8,
                              spacing: AppSize.s10,
                              children: TransactionType.values.where((value) => value!=TransactionType.groupGoals)
                                  .map((type) => QuickMenuButton(
                                        size: width / 3.5,
                                        color: AppColor.secondary,
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            Routes.transactionsHome,
                                            arguments: type
                                          );
                                        },
                                        type: type,
                                      ))
                                  .toList(),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSize.s16),
                    Image.asset(
                      ImageAssets.banner,
                      fit: BoxFit.fitWidth,
                      width: width,
                    )
                  ],
                )
              ))
            ]
          );
        },
      ),
    );
  }
}

double getPercentageCompleteByType(TransactionType type, TransactionStatistics transactionStatistics) {
  switch(type) {
    case TransactionType.secureSales:
      return transactionStatistics.secureSales[0]==0?0:transactionStatistics.secureSales[1]/transactionStatistics.secureSales[0];
    case TransactionType.betsWagers:
      return transactionStatistics.betsAndWager[0]==0?0: transactionStatistics.betsAndWager[1]/transactionStatistics.betsAndWager[0];
    case TransactionType.moneyPool:
      return transactionStatistics.moneyPool[0]==0?0: transactionStatistics.moneyPool[1]/transactionStatistics.moneyPool[0];
    case TransactionType.billSplitter:
      return transactionStatistics.billSplitter[0]==0?0: transactionStatistics.billSplitter[1]/transactionStatistics.billSplitter[0];
    default:
      return 0;
  }
}

int getTotalTransactions(TransactionType type, TransactionStatistics transactionStatistics) {
  switch(type) {
    case TransactionType.secureSales:
      return transactionStatistics.secureSales[0];
    case TransactionType.betsWagers:
      return transactionStatistics.betsAndWager[0];
    case TransactionType.moneyPool:
      return transactionStatistics.moneyPool[0];
    case TransactionType.billSplitter:
      return transactionStatistics.billSplitter[0];
    default:
      return 0;
  }
}

getPendingTransactions(TransactionType type, TransactionStatistics transactionStatistics) {
  switch(type) {
    case TransactionType.secureSales:
      return transactionStatistics.secureSales[2];
    case TransactionType.betsWagers:
      return transactionStatistics.betsAndWager[2];
    case TransactionType.moneyPool:
      return transactionStatistics.moneyPool[2];
    case TransactionType.billSplitter:
      return transactionStatistics.billSplitter[2];
    default:
      return 0;
  }
}

getSuccessfulTransactions(TransactionType type, TransactionStatistics transactionStatistics) {
  switch(type) {
    case TransactionType.secureSales:
      return transactionStatistics.secureSales[1];
    case TransactionType.betsWagers:
      return transactionStatistics.betsAndWager[1];
    case TransactionType.moneyPool:
      return transactionStatistics.moneyPool[1];
    case TransactionType.billSplitter:
      return transactionStatistics.billSplitter[1];
    default:
      return 0;
  }
}
