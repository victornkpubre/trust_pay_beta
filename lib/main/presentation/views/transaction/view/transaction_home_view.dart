import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/popups/create_transaction_choice_popup.dart';
import 'package:trust_pay_beta/components/feedback/retry_error_listener.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/data_cards/user_transaction_details_card.dart';
import 'package:trust_pay_beta/components/data_cards/user_transaction_info_card.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/app/routes.dart';
import 'package:trust_pay_beta/main/data/data_source/local_database/preferences.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/presentation/base/notification_stream.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction/transaction_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/create/bets_wagers/create_bets_wagers.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/create/bill_splitter/create_bill_splitter_view.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/create/money_pool/create_money_pool.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/create/secure_sales/create_secure_sales_view.dart';

class TransactionHomeView extends StatefulWidget {
  static const String routeName = '/transaction';
  final TransactionType type;
  const TransactionHomeView({super.key, required this.type});

  @override
  State<TransactionHomeView> createState() => _TransactionHomeViewState();
}

class _TransactionHomeViewState extends State<TransactionHomeView> {
  int currentTab = 0;
  late PageController controller;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final type = widget.type;

    return Scaffold(
      backgroundColor: AppColor.white,
      body: TransactionErrorListener(child: UserErrorListener(child: BlocBuilder<TransactionBloc, TransactionBlocState>(
        builder: (context, transactionState) {
          return BlocBuilder<UserBloc, UserState>(
            builder: (context, userState) {
              final user = userState.user;
              final transactions = transactionState.transactionHistory;

              if(user?.userStatistics == null) {
                if(user?.id != null) {
                  context.read<UserBloc>().add(UserEvent.loadUser(user!.id!, userState));
                }
              }

              return
                Stack(
                  children: [
                    Column(mainAxisSize: MainAxisSize.max, children: [
                      Container(
                        color: AppColor.secondary,
                        padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
                        child: Column(
                          children: [
                            SizedBox(height: MediaQuery.of(context).viewPadding.top),
                            const SizedBox(height: AppSize.s16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          width: width / 13, getIcon(type)),
                                      const SizedBox(width: AppSize.s4),
                                      Text(
                                        getTitle(type),
                                        style: appTextBlack18Bold,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                BlocBuilder<TransactionBloc, TransactionBlocState>(
                                    builder: (context, transactionState) {
                                      return Row(
                                        children: [
                                          InkWell(
                                              onTap: () => Navigator.of(context).pushNamed(Routes.searchView),
                                              child: SvgPicture.asset(SvgIconAssets.search_icon_secondary, height: AppSize.s32, width: AppSize.s32)),
                                          const SizedBox(width: AppSize.s8),
                                          InkWell(
                                            onTap: () => Navigator.of(context).pushNamed(Routes.notificationView),
                                            child: Stack(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: SvgPicture.asset(SvgIconAssets.alert_icon_secondary,
                                                        height: AppSize.s38, width: AppSize.s38
                                                    ),
                                                  ),
                                                  transactionState.liveTransactions==null? Container():
                                                  transactionState.liveTransactions!.isNotEmpty?Positioned(
                                                    top: 0,
                                                    right: 0,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: AppColor.red,
                                                          shape: BoxShape.circle
                                                      ),
                                                      padding: const EdgeInsets.all(AppSize.s8),
                                                      child: Text(
                                                        transactionState.liveTransactions!.length.toString(),
                                                        style: appTextWhite14Bold,
                                                      ),
                                                    ),
                                                  ): Container()
                                                ]
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                ),
                              ],
                            ),
                            const SizedBox(height: AppSize.s16),

                            UserTransactionInfoCard(
                              loading: userState.user?.userStatistics == null,
                              width: width - AppSize.s32,
                              percentageComplete: user?.userStatistics==null?0:
                                computePercentageComplete(user),
                              type: type,
                              amount: user?.userStatistics?.allTransactions??0,
                              username: "${user?.firstName} ${user?.lastName}",
                              profileImage: user?.profileImage??ProfileIconAssets.avatar,
                            ),
                            const SizedBox(height: AppSize.s16),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppSize.s16),
                      Row(
                        children: [
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: AppSize.s16),
                              child: Text("Transactions", style: appTextBlack18Bold)),
                        ],
                      ),
                      const SizedBox(height: AppSize.s8),

                      //TabBar
                      _buildTabBar(controller),

                      transactions == null?
                      Container(
                        color: AppColor.white,
                        child: Center(
                            child: CircularProgressIndicator(
                          color: AppColor.primary,
                        )),
                      ):
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(AppSize.s16),
                            // color: Colors.red,
                            child: PageView.builder(
                                controller: controller,
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  final transactionByType = transactions.where((t) => t.type==type).toList();
                                  List<List<Transaction>> filteredTransaction = filterTransaction(transactionByType);
                                  bool tabEmpty = filteredTransaction[index].isEmpty;

                                  return SingleChildScrollView(
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: tabEmpty?
                                            [
                                              SizedBox(
                                                height: width,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                        ImageAssets.no_transactions,
                                                        width: width/3,
                                                        height: width/3,
                                                    ),
                                                    Text('No Transactions', style: appTextGray16Bold),
                                                  ],
                                                ),
                                              )
                                            ]:
                                        filteredTransaction[index].map((transaction) => Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    UserTransactionDetailsCard(
                                                      width: width,
                                                      title: transaction.title,
                                                      createdAt:
                                                          transaction.dateCreated,
                                                      status: transaction.status,
                                                      percentageComplete:
                                                          transaction.percentageComplete,
                                                      amount: transaction.total
                                                          .toString(),
                                                      currency: transaction.currency,
                                                      members: transaction.members
                                                          .map((u) => u.toUserInput())
                                                          .toList(),
                                                    ),
                                                    const SizedBox(
                                                        height: AppSize.s16)
                                                  ],
                                                ))
                                            .toList()),
                                  );
                                }),
                          ),
                        ),
                      )
                    ]),
                    Positioned(
                      bottom: AppSize.s32,
                      left: AppSize.s16,
                      right: AppSize.s16,
                      child: Center(
                        child: PrimaryButton(
                          title: 'Create Transaction',
                          icon: Icons.add,
                          onTap: () => showCreateTransactionChoice(
                            context,
                            typeName: getTitle(type),
                            onUseAi: () => Navigator.of(context).pushNamed(
                              Routes.aiChatView,
                              arguments: "I'd like to create a ${getTitle(type)} transaction.",
                            ),
                            onUseForm: () {
                            String route = '';
                            switch (type){
                              case TransactionType.secureSales:
                                route = CreateSecureSalesTransaction.routeName;
                                break;
                              case TransactionType.betsWagers:
                                route = CreateBetWagerTransaction.routeName;
                                break;
                              case TransactionType.billSplitter:
                                route = CreateBillSplitterTransaction.routeName;
                                break;
                              case TransactionType.moneyPool:
                                route = CreateMoneyPoolTransaction.routeName;
                                break;
                              default:
                                route = CreateSecureSalesTransaction.routeName;
                                break;
                            }
                            Navigator.pushReplacementNamed(context, route);
                            },
                          ),
                        ),
                      ),
                    ),

                    transactionState.status == TransactionBlocStatus.loading?
                    Positioned.fill(
                        child: Container(
                          color: AppColor.popUpGray,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColor.primary,
                              strokeWidth: AppSize.s4,
                            ),
                          ),
                        )
                    ): Container()
                  ],
                );
            },
          );
        }
      ))),
    );
  }
}

List<List<Transaction>> filterTransaction(List<Transaction> transactions) {
  List<List<Transaction>> list = [[],[],[]];
  list[0].addAll(transactions);
  list[0].sort((a,b) => a.dateCreated.compareTo(b.dateCreated));

  for (var item in transactions) {
    switch (item.status){
      case TransactionStatus.pending:
        list[1].add(item);
        break;
      case TransactionStatus.completed:
        list[2].add(item);
        break;
      default:
        break;
    }
  }
  return list;
}

_buildTabBar(PageController controller) {
  return Container(
    padding: const EdgeInsets.all(AppSize.s8),
    margin: const EdgeInsets.symmetric(horizontal: AppSize.s16),
    decoration: BoxDecoration(
        color: AppColor.secondary,
        borderRadius: BorderRadius.circular(AppSize.s32)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        InkWell(
          onTap: () => controller.animateToPage(0,
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 250)),
          child: Container(
            padding: const EdgeInsets.symmetric(
                vertical: AppSize.s8, horizontal: AppSize.s16),
            decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(AppSize.s16)),
            child: const Text("Recent"),
          ),
        ),
        // const SizedBox(width: AppSize.s16),
        InkWell(
          onTap: () => controller.animateToPage(1,
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 250)),
          child: Container(
            padding: const EdgeInsets.symmetric(
                vertical: AppSize.s8, horizontal: AppSize.s16),
            decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(AppSize.s16)),
            child: const Text("Pending"),
          ),
        ),
        // const SizedBox(width: AppSize.s16),
        InkWell(
          onTap: () => controller.animateToPage(2,
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 250)),
          child: Container(
            padding: const EdgeInsets.symmetric(
                vertical: AppSize.s8, horizontal: AppSize.s16),
            decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(AppSize.s16)),
            child: const Text("Successful"),
          ),
        ),
      ],
    ),
  );
}
