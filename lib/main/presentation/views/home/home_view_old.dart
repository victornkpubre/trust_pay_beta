import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/base/user_image.dart';
import 'package:trust_pay_beta/components/buttons/main_menu_button.dart';
import 'package:trust_pay_beta/components/buttons/quick_menu_btn.dart';
import 'package:trust_pay_beta/components/data_cards/account_card.dart';
import 'package:trust_pay_beta/components/data_cards/transaction_alert_card.dart';
import 'package:trust_pay_beta/components/list_iems/transaction_obligation_item.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/app/routes.dart';
import 'package:trust_pay_beta/main/data/data_source/local_database/preferences.dart';
import 'package:trust_pay_beta/main/domain/functions/transaction_action_extractor.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';
import 'package:trust_pay_beta/main/presentation/base/notification_stream.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/presentation/base/app_carousel.dart';
import 'package:trust_pay_beta/main/presentation/base/app_horizontal_menu.dart';
import 'package:trust_pay_beta/main/presentation/base/progress_indicator.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';
import 'package:trust_pay_beta/main/presentation/blocs/auth/auth_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction/transaction_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_details_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';
import 'package:trust_pay_beta/main/presentation/intents/amount_input_view.dart';
import 'package:trust_pay_beta/main/presentation/views/modals/accept_transaction_modal.dart';
import 'package:trust_pay_beta/main/presentation/views/modals/decline_transaction_modal.dart';
import 'package:trust_pay_beta/main/presentation/views/modals/payment_modal.dart';
import 'package:trust_pay_beta/main/presentation/views/modals/token_modal.dart';
import 'package:trust_pay_beta/main/presentation/views/modals/verify_token_modal.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/view/transaction_details_view.dart';

class HomeView extends StatelessWidget {
  static const String routeName = '/home';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    BackgroundNotificationStream.stream.listen((data) async {
      final transactionState = context.read<TransactionBloc>().state;

      //Update Notification
      context.read<TransactionBloc>().add(TransactionEvent.updateNotification(null, data.notificationId, NotificationState.delivered, transactionState));

      //Reload Transaction History
      final currentUser  = await context.read<AppPreferences>().getUser();
      context.read<TransactionBloc>().add(TransactionEvent.getUsersHistory(currentUser?.id??-1, AppConstants.pageSize, 1, transactionState));
    });

    return Scaffold(
      floatingActionButton: MainMenuButton(
        size: AppSize.s48,
        padding: AppSize.s8,
        icon: SvgIconAssets.menu,
        onTap: () async {
          Navigator.of(context).pushNamed(Routes.servicesView);
        },
        background: AppColor.primary
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, authState) {
          if(authState.status==AuthStatus.loggedOut){
            Navigator.of(context).pushNamedAndRemoveUntil(Routes.splashRoute, (Route<dynamic> route) => false);
          }
        },
        builder: (context, authState) {
          return BlocConsumer<UserBloc, UserState>(
            listener: (context, userState) {},
            builder: (context, userState) {
              return BlocConsumer<TransactionDetailsBloc, TransactionDetailsState>(
              listener: (context, transactionDetailsState) {},
              builder: (context, transactionDetailsState) {
                  return BlocConsumer<TransactionBloc, TransactionBlocState> (
                    listener: (context, transactionState){
                      if(transactionState.status==TransactionBlocStatus.error) {
                        if(transactionState.message=='Unauthenticated.') {
                          if(userState.user==null) {
                            context.read<UserBloc>().add(const UserEvent.currentUser(UserState()));
                          }
                          else {
                            context.read<AuthBloc>().add(AuthEvent.logout(userState.user!));
                          }
                        }
                        else {
                          showSnackBar(
                              context: context,
                              message: transactionDetailsState.errorMessage
                          );
                        }
                      }
                    },
                    builder: (context, transactionState) {
                      List<Transaction>? transactionHistory = transactionState.transactionHistory;
                      List<Transaction>? liveTransactions = transactionState.liveTransactions;
                      List<Container> carouselItems = [];
                      User? user = userState.user;

                      //When transaction details is updated,
                      if(transactionDetailsState.state==TransactionDetailsBlocStatus.transactionUpdated) {
                        //Reload Transaction History
                        context.read<TransactionBloc>().add(TransactionEvent.getUsersHistory(user?.id??-1, AppConstants.pageSize, 1, transactionState));
                        context.read<TransactionDetailsBloc>().add(TransactionDetailsEvent.setState(transactionDetailsState.copyWith(state: TransactionDetailsBlocStatus.initial)));
                      }

                      //Load User from preference
                      if(user == null) {
                        context.read<UserBloc>().add(UserEvent.currentUser(userState));
                      }

                      //Generate carousel items
                      if(user != null) {
                        carouselItems = getCarouselItems(context, userState, liveTransactions, width);
                      }

                      return transactionHistory== null || user == null || liveTransactions == null?
                      Container(
                        color: AppColor.white,
                        child: const Center(child: AppCircleProgressIndicator())
                      ):
                      Container(
                        color: AppColor.white,
                        child: Stack(
                          children: [
                            _buildBackgroundPattern(width, height),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
                                  child: Column(
                                    children: [
                                      SizedBox(height: MediaQuery.of(context).viewPadding.top),
                                      const SizedBox(height: AppSize.s16),
                                      _buildTitleSection(user, context),
                                      const SizedBox(height: AppSize.s10),
                                      AppCarousel(
                                        width: width,
                                        height: width * 0.45,
                                        color: Colors.transparent,
                                        viewportFraction: 1,
                                        autoplay: false,
                                        decoration: ShapeDecoration (
                                           shape: RoundedRectangleBorder (borderRadius: BorderRadius.circular(AppSize.s16)),
                                           shadows: [
                                              boxShadowThree
                                           ],
                                        ),
                                        children: carouselItems,
                                        onPageChange: (index){
                                          context.read<TransactionDetailsBloc>().add(TransactionDetailsEvent.init(liveTransactions[index]));
                                        },
                                      ),
                                      const SizedBox(height: AppSize.s16),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: AppColor.secondary,
                                  padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
                                  width: width,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: AppSize.s8),
                                            child: Text('Quick Actions',
                                                style: appTextGray16
                                            ),
                                          ),
                                        ],
                                      ),
                                      AppHorizontalMenu(
                                        itemSize: width / 3.5,
                                        items: _buildQuickMenuItems(
                                            context: context,
                                            size: width / 3.5,
                                            onClick: (index) {
                                              Navigator.pushNamed(
                                                  context,
                                                  Routes.transactionsHome,
                                                  arguments: _getTransactionType(index)
                                              );
                                            }
                                        ),
                                      ),
                                      const SizedBox(height: AppSize.s8),
                                      // AppCarousel(height: 200),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: AppSize.s8),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
                                    child: _buildHistorySection( context, transactionHistory, height, user),
                                  ),
                                ),
                                const SizedBox(height: AppSize.s16),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            }
          );
        }
      ),
    );
  }
}



void onAccept(BuildContext context, Transaction transaction, User currentUser) {
  final owner = transaction.members.firstWhere((u) =>u.id==transaction.userId);
  final state = context.read<TransactionDetailsBloc>().state;

  showAcceptTransactionModal(
      context,
      transaction,
      owner,
      () {
        context.read<TransactionDetailsBloc>().add(
            TransactionDetailsEvent.acceptTransaction(currentUser, transaction, context, state)
        );
      }
  );
}

void onDecline(BuildContext context, Transaction transaction, User currentUser) {
  final owner = transaction.members.firstWhere((u) =>u.id==transaction.userId);
  final state = context.read<TransactionDetailsBloc>().state;

  showDeclineTransactionModal(
      context,
      transaction,
      owner,
      null,
      (note){
        if(note!=null && note.isNotEmpty){
          context.read<TransactionDetailsBloc>().add(TransactionDetailsEvent.declineTransaction(currentUser, note, transaction, context, state));
        }
        else {
          showSnackBar(context: context, message: 'A reason for the rejection is required');
        }
      }
  );
}

void onFulfilObligation(BuildContext context, Transaction transaction, User user) {
  final state = context.read<TransactionDetailsBloc>().state;

  showTokenModal(
      context,
      transaction,
      state,
      (obligation, updated) {
        context.read<TransactionDetailsBloc>().add(TransactionDetailsEvent.fulfillTransactionObligation(user, obligation, updated, context, state));
      }
  );


}

void onVerifyObligation(BuildContext context, Transaction transaction, User user) {
  final state = context.read<TransactionDetailsBloc>().state;
  final obligation = transaction.obligations.firstWhere((o) => o.type.isFulfilment && o.status==ObligationStatus.fulfilled);
  showVerifyTokenModal(
    context,
    obligation,
    state,
    (obligation) {
      context.read<TransactionDetailsBloc>().add(TransactionDetailsEvent.verifyTransactionObligation(user, obligation, transaction, context, state));
    },
    currency: transaction.currency
  );
}

void onVerifyMediation(BuildContext context, Transaction transaction, User user) {
  final state = context.read<TransactionDetailsBloc>().state;
  if(state.transaction == null) {
    context.read<TransactionDetailsBloc>().add(TransactionDetailsEvent.init(transaction));
  }

  Navigator.pushNamed(
    context,
    Routes.mediationView,
  );
}

List<Container> getCarouselItems(BuildContext context, UserState userState, List<Transaction>? liveTransactions, double width) {
  List<Container> items = [];
  final user = userState.user!;

  if(liveTransactions != null) {
    items = liveTransactions.sublist(0, min(10,liveTransactions.length)).map((transaction) {
      UserInput owner =  transaction.members.firstWhere((u) {
        return transaction.userId == u.id;
      }).toUserInput();

      final action = getTransactionAction(transaction, userState.user?.id??-1);
      TransactionDetailsViewState transactionViewState = getTransactionViewState(action);

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s8),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.transactionsDetails,
              arguments: TransactionDetailsViewArguments(
                transaction: transaction,
                viewType: transactionViewState
              )
            );
          },
          child: TransactionAlertCard(
            username: owner.username,
            userImage: owner.image,
            transaction: transaction,
            currentUser: user,
            width: width,
            height: width * 0.45,
            onAccept: (transaction) => onAccept(context, transaction, user),
            onDecline: (transaction)  =>  onDecline(context, transaction, user),
            onFulfilObligation: (transaction) =>  onFulfilObligation(context, transaction, user),
            onVerifyObligation: (transaction) =>  onVerifyObligation(context, transaction, user),
            onVerifyMediation: (transaction) =>  onVerifyMediation(context, transaction, user),
            onMakePayment: (transaction) =>  onMakePayment(context, transaction, user),
            onView: (transaction){
              Navigator.pushNamed(context, Routes.transactionsDetails,
                arguments: TransactionDetailsViewArguments(
                    transaction: transaction,
                    viewType: transactionViewState
                )
              );
            },
          ),
        ),
      );
    }).toList();

    items.add(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s8),
        child: AccountCard (
          balance:user.account?.balance?.toString() ?? '0',
          width: width,
          height: width * 0.45,
          solid: false,
          onDeposit: () async {
            await onDeposit(context, userState);
          },
          onWithdraw: () async {
            await onWithdraw(context, userState);
          },
          onAccountBtnClicked: () => Navigator.of(context).pushNamed(Routes.accountView),
        ),
      ),
    );
  }

  return items;
}

Future<void> onDeposit(BuildContext context, UserState userState) async {
  String? amount = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AmountInputView())
  );

  if(amount!=null && amount.isNotEmpty) {
    showPaymentModal(context, PaymentMode.payIn, null, (type) {
      context.read<UserBloc>().add(UserEvent.walletDeposit(userState, double.parse(amount), -1));
    }, double.parse(amount));
  }
}

Future<void> onWithdraw(BuildContext context, UserState userState) async {
  String? amount = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AmountInputView())
  );

  if(amount!=null && amount.isNotEmpty) {
    context.read<UserBloc>().add(UserEvent.walletWithdraw(userState, double.parse(amount), -1));
  }
}

TransactionDetailsViewState getTransactionViewState(TransactionActionType action) {
  switch(action) {
    case TransactionActionType.acceptDecline:
      return TransactionDetailsViewState.acceptance;

    case TransactionActionType.makePayment:
      return TransactionDetailsViewState.payment;

    default:
      return TransactionDetailsViewState.details;
  }
}

void onMakePayment(BuildContext context, Transaction transaction, User user) {
  final state = context.read<TransactionDetailsBloc>().state;
  final userPaymentObligations = transaction.obligations.where((o) => o.type==ObligationType.payment && o.binding==user.id).toList();
  Obligation obligation = userPaymentObligations.first;
  if(userPaymentObligations.length > 1) {
    obligation = userPaymentObligations.fold(obligation, (prev, o) => o.dueDate.isBefore(prev.dueDate)? o: prev);
  }

  if(paymentDue(transaction.type, obligation)) {
    showPaymentModal(
        context,
        PaymentMode.payOut,
        transaction,
        (paymentType) => context.read<TransactionDetailsBloc>().add(
            TransactionDetailsEvent.makeTransactionPayment(
                user,
                obligation,
                transaction,
                context,
                paymentType,
                state
            )
        ),
        null
    );

  }

}

bool paymentDue(TransactionType type, Obligation paymentObligation) {
  switch (type) {
    case TransactionType.secureSales:
    case TransactionType.betsWagers:
      return paymentObligation.status==ObligationStatus.pending;

    default:
      return paymentObligation.status==ObligationStatus.verified;
  }
}



// UI Methods
_buildHistorySection(context, List<Transaction> itemInputs, height, user) {
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
            children: itemInputs.isEmpty?
            [
              Image.asset(
                ImageAssets.no_transactions,
                width: MediaQuery.of(context).size.width / 2,
              ),
              Text('No Transactions', style: appTextGray16Bold),

            ]:
            itemInputs.map((item) {
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      Provider.of<TransactionDetailsBloc>(context, listen: false).add(TransactionDetailsEvent.init(item));

                      final action = getTransactionAction(item, user?.id??-1);
                      TransactionDetailsViewState transactionViewState = getTransactionViewState(action);
                      Navigator.pushNamed(context, Routes.transactionsDetails,
                          arguments: TransactionDetailsViewArguments (
                              transaction: item,
                              viewType: transactionViewState
                          )
                      );

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

_buildQuickMenuItems({required BuildContext context, required double size, required Function(int index) onClick}) {
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

_buildTitleSection(User user, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      InkWell(
        onTap: (){
          final userState = context.read<UserBloc>().state;
          if(userState.user == null) {
            context.read<UserBloc>().add(UserEvent.currentUser(userState));
          }
          Navigator.of(context).pushReplacementNamed(Routes.profileView);
        },
        child: Row(
          children: [
            UserImage(image: user.profileImage, size: AppSize.s48),
            const SizedBox(width: AppSize.s4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello, ${user.firstName}', style: appTextWhite18Bold),
                Text(
                  'Welcome to TrustPay',
                  style: appTextWhite14,
                ),
              ],
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
                  child: SvgPicture.asset(SvgIconAssets.search_icon, height: AppSize.s32, width: AppSize.s32)),
              const SizedBox(width: AppSize.s8),
              InkWell(
                onTap: () => Navigator.of(context).pushNamed(Routes.notificationView),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(SvgIconAssets.alert_icon,
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
  );
}
