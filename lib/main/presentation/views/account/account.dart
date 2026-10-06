import 'package:flutter/material.dart';
import 'package:trust_pay_beta/main/data/network/error_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/buttons/back_button.dart';
import 'package:trust_pay_beta/components/data_cards/account_card.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';
import 'package:trust_pay_beta/main/presentation/base/app_carousel.dart';
import 'package:trust_pay_beta/main/presentation/base/progress_indicator.dart';
import 'package:trust_pay_beta/main/presentation/base/toast.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_details_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';
import 'package:trust_pay_beta/main/presentation/intents/amount_input_view.dart';
import 'package:trust_pay_beta/main/presentation/views/modals/payment_modal.dart';
import 'package:trust_pay_beta/main/presentation/views/payment/hosted_checkout_view.dart';

class AccountView extends StatefulWidget {
  static const String routeName = '/account';

  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  void initState() {
    _loadAccounts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: AppColor.white,
        body: BlocConsumer<UserBloc, UserState>(
          listener: (context, userState) {
            if (userState.status == UserBlocStatus.error && isScreenOnTop(context)) {
              showErrorSnackBar(
                context: context,
                message: userState.message ?? ErrorMessages.unknown,
                onRetry: () => context.read<UserBloc>().retry(),
              );
            }
            if (userState.status == UserBlocStatus.depositInitiated && userState.checkoutLink != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HostedCheckoutView(
                  checkoutLink: userState.checkoutLink!,
                  paymentId: userState.pendingPaymentId!,
                )),
              );
            }
            // Once both wallets are known, fetch their combined payment
            // history in one go (their ids aren't known until this point).
            if (userState.status == UserBlocStatus.accountsLoaded && userState.accounts != null) {
              context.read<UserBloc>().add(UserEvent.getAllAccountHistory(userState, userState.accounts!));
            }
          },
          builder: (context, userState) {
            return BlocConsumer<TransactionDetailsBloc, TransactionDetailsState>(
              listener: (context, transactionDetailsState) {
                if(transactionDetailsState.state==TransactionDetailsBlocStatus.error && isScreenOnTop(context)) {
                  showErrorSnackBar(
                    context: context,
                    message: transactionDetailsState.errorMessage,
                    onRetry: () => context.read<TransactionDetailsBloc>().retry(),
                  );
                }
              },
              builder: (context, transactionDetailsState) {
                final accounts = userState.accounts ?? (userState.user?.account != null
                    ? [userState.user!.account!]
                    : <Account>[]);

                return SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(AppSize.s16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(height: MediaQuery.of(context).viewPadding.top),
                        Stack(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Account',
                                      style: appTextBlack24Bold,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const Positioned(
                                top: 4,
                                left: 8,
                                child: AppBackButton(size: AppSize.s16)
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSize.s32),

                        // One wallet card per currency (NGN + GBP), both
                        // solid/purple — swipeable since a user only ever
                        // needs one at a time.
                        AppCarousel(
                          width: width,
                          height: width * 0.5,
                          color: Colors.transparent,
                          viewportFraction: 1,
                          autoplay: false,
                          onPageChange: (index) {},
                          children: accounts.map((account) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AccountCard(
                              balance: account.balance.toString(),
                              currencySymbol: currencySymbolFor(account.currency),
                              accountNumber: account.accountNumber.toString(),
                              currency: account.currency,
                              width: width,
                              height: width * 0.48,
                              solid: true,
                              onAccountBtnClicked: (){},
                              onDeposit: () async {
                                await onDeposit(context, userState, account.currency);
                              },
                              onWithdraw: () async {
                                await onWithdraw(context, userState, account.currency);
                              },
                            ),
                          )).toList(),
                        ),
                        const SizedBox(height: AppSize.s8),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Payment History', style: appTextGray24)
                        ),
                        const SizedBox(height: AppSize.s16),

                        userState.accountHistory==null?
                            const Center(
                              child: AppCircleProgressIndicator(),
                            )
                        : userState.accountHistory!.isEmpty?
                          const Center(
                            child: Text('No Transactions Payments'),
                          )
                        : Column(
                          children: userState.accountHistory!.where((h) => h.amount!=0).map((historyEntry) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    historyEntry.amount < 0? Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: AppColor.amber, width: 4),
                                        shape: BoxShape.circle
                                      ),
                                      padding: const EdgeInsets.all(4),
                                      child: Icon(FontAwesomeIcons.minus, size: width*0.03, color: AppColor.amber),
                                    ): Container(),

                                    historyEntry.amount>0? Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: AppColor.primary, width: 2),
                                        shape: BoxShape.circle
                                      ),
                                      padding: const EdgeInsets.all(4),
                                      child: Icon(FontAwesomeIcons.plus, size: width*0.03, color: AppColor.primary),
                                    ): Container(),
                                    const SizedBox(width: 32),

                                    Expanded(
                                      child: Text(
                                          parseAmount(
                                              historyEntry.amount<0? historyEntry.amount*-1: historyEntry.amount,
                                              historyEntry.currency
                                          ),
                                          style: historyEntry.amount>0?
                                            appTextGreen24.copyWith(fontSize: width*0.045):
                                          appTextRed24.copyWith(fontSize: width*0.045)
                                      ),
                                    ),
                                    const SizedBox(width: 8),

                                    Text(parseDateMonthYear(historyEntry.date), style: appTextGray24.copyWith(fontSize: width*0.045)),
                                    const SizedBox(width: 8),

                                    Text(parseTime(historyEntry.date), style: appTextGray24.copyWith(fontSize: width*0.045))
                                  ],
                                ),
                                const SizedBox(height: AppSize.s16)
                              ],
                            );
                          }).toList()
                        )
                      ],
                    ),
                  ),
                );
              }
            );
          },
        )
    );
  }

  void _loadAccounts() {
    final userState = context.read<UserBloc>().state;
    context.read<UserBloc>().add(UserEvent.getAccounts(userState, userState.user!.id!));
  }
}

Future<void> onDeposit(BuildContext context, UserState userState, String currency) async {
  String? amount = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AmountInputView())
  );

  if(amount!=null && amount.isNotEmpty) {
    showPaymentModal(
      context,
      PaymentMode.payIn,
      null,
      (type) => context.read<UserBloc>().add(
        UserEvent.initiateDeposit(userState, double.parse(amount).round(), currency)
      ),
      double.parse(amount)
    );
  }
}

Future<void> onWithdraw(BuildContext context, UserState userState, String currency) async {
  String? amount = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AmountInputView())
  );

  if(amount!=null && amount.isNotEmpty) {
    context.read<UserBloc>().add(UserEvent.walletWithdraw(userState, double.parse(amount), -1));
  }
}
