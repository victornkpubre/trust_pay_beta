import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/buttons/secondary_btn.dart';
import 'package:trust_pay_beta/components/popups/confirmation_popup.dart';
import 'package:trust_pay_beta/components/popups/popup_bar.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';
import 'package:trust_pay_beta/main/presentation/base/progress_indicator.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction_details/transaction_details_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';
import 'package:trust_pay_beta/main/presentation/views/payment/hosted_checkout_view.dart';

enum PaymentFlowPopupState { paying, paid }
class PaymentFlowPopup extends StatefulWidget {
  final double width;
  final String amount;
  // The actual numeric amount being charged (payOut) — needed to compute a
  // shortfall against the matching wallet; `amount` above is a pre-formatted
  // display string and isn't safely re-parseable (comma separators).
  final double rawAmount;
  final PaymentMode paymentMode;
  // Which transaction this payment is for — only meaningful for payOut,
  // where it determines which currency's wallet must be used.
  final Transaction? transaction;
  final Function(PaymentType) onSubmit;
  final Function() onReview;
  final Function() onHome;
  const PaymentFlowPopup({
    super.key,
    required this.width,
    required this.amount,
    required this.rawAmount,
    required this.onSubmit,
    required this.onReview,
    required this.onHome,
    required this.paymentMode,
    this.transaction,
  });

  @override
  State<PaymentFlowPopup> createState() => _PaymentFlowPopupState();
}

class _PaymentFlowPopupState extends State<PaymentFlowPopup> with WidgetsBindingObserver {
  PaymentFlowPopupState paymentFlowPopupState = PaymentFlowPopupState.paying;
  bool loading = false;
  bool completed = false;
  bool paymentSuccessful = false;
  double keyboardHeight = 0.0;
  // A Paystack/Stripe checkout started from this popup, and why it
  // couldn't start (shown inline — a snackbar would sit behind the sheet).
  bool startingCheckout = false;
  String? checkoutError;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if (widget.paymentMode == PaymentMode.payOut) {
      final userState = context.read<UserBloc>().state;
      if (userState.accounts == null && userState.user?.id != null) {
        context.read<UserBloc>().add(UserEvent.getAccounts(userState, userState.user!.id!));
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = View.of(context).viewInsets.bottom;
    setState(() {
      keyboardHeight = bottomInset;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listenWhen: (previous, current) => widget.paymentMode == PaymentMode.payOut,
      listener: (context, userState) {
        // The wallet button below found the balance short, started a
        // top-up for the shortfall, and this fires once that checkout
        // link is ready — close this dialog and hand off to it. Once the
        // top-up itself is confirmed, HostedCheckoutView/PaymentPendingView
        // call widget.onSubmit again to actually complete the payment,
        // exactly as if the balance had been sufficient to begin with.
        if (startingCheckout && userState.status == UserBlocStatus.error) {
          setState(() {
            startingCheckout = false;
            checkoutError = userState.message ?? 'Could not start the payment. Please try again.';
          });
          return;
        }
        if (userState.status == UserBlocStatus.depositInitiated && userState.checkoutLink != null) {
          startingCheckout = false;
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HostedCheckoutView(
              checkoutLink: userState.checkoutLink!,
              paymentId: userState.pendingPaymentId!,
              onSettled: () => widget.onSubmit(PaymentType.account),
            )),
          );
        }
      },
      child: BlocBuilder<TransactionDetailsBloc, TransactionDetailsState> (
        builder: (context, transactionDetailsState) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32))
              ),
              width: widget.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: AppSize.s8),

                  const PopUpBar(),
                  const SizedBox(height: AppSize.s16),

                  paymentFlowPopupState==PaymentFlowPopupState.paid?
                  _buildPaymentSubmittedView(
                    width: widget.width,
                    paymentSuccessful: paymentSuccessful,
                    onHome: widget.onHome,
                    errorMessage: transactionDetailsState.errorMessage,
                    onRetry: () {
                      setState(() {
                        loading = false;
                        completed = false;
                        paymentSuccessful = false;
                        paymentFlowPopupState=PaymentFlowPopupState.paying;
                      });
                    },
                    onReview: widget.onReview
                  ): Container(),

                  paymentFlowPopupState==PaymentFlowPopupState.paying?
                  _buildPaymentEntryForm(
                    context: context,
                    width: widget.width,
                    amount: widget.amount,
                    rawAmount: widget.rawAmount,
                    transaction: widget.transaction,
                    paymentMode: widget.paymentMode,
                    startingCheckout: startingCheckout,
                    checkoutError: checkoutError,
                    // Pay the full amount through the gateway: it tops the
                    // wallet up by exactly this amount, and the listener
                    // above completes the payment once that's confirmed.
                    onPayWithGateway: (userState, currency) {
                      setState(() {
                        startingCheckout = true;
                        checkoutError = null;
                      });
                      context.read<UserBloc>().add(
                        UserEvent.initiateDeposit(userState, widget.rawAmount.ceil(), currency)
                      );
                    },
                    onSubmit: (type) {
                      if (widget.paymentMode == PaymentMode.payIn) {
                        // Real-money deposit: hand off to a hosted checkout
                        // (Paystack/Stripe) rather than this popup's own
                        // paid/failed view — the caller (AccountView) pushes
                        // the checkout screen once initiateDeposit resolves.
                        Navigator.of(context).pop();
                        widget.onSubmit(type);
                        return;
                      }
                      widget.onSubmit(type);
                      setState(() {
                        loading = true;
                        paymentFlowPopupState=PaymentFlowPopupState.paid;
                      });
                    },
                  ): Container(),
                  const SizedBox(height: AppSize.s16),
                ],
              ),
            ),

            //Loading View
            BlocBuilder<UserBloc, UserState> (
                builder: (context, userState) {
                  //Using bloc status to override local loading state
                  if(loading && (
                      transactionDetailsState.state==TransactionDetailsBlocStatus.transactionUpdated
                      || transactionDetailsState.state==TransactionDetailsBlocStatus.error
                      || userState.status==UserBlocStatus.userUpdate
                  )){
                    completed = true;
                    if(transactionDetailsState.state==TransactionDetailsBlocStatus.transactionUpdated || userState.status==UserBlocStatus.userUpdate) {
                      paymentSuccessful = true;
                    }
                  }

                  return loading&&!completed?
                  Positioned.fill(child: Container(
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32))
                    ),
                    child: const Center(
                      child: AppCircleProgressIndicator(),
                    ),
                  )): Positioned.fill(child: Container());
                }
            ),
          ],
        );
      }
      ),
    );
  }
}

_buildPaymentEntryForm({
  required BuildContext context,
  required double width,
  required String amount,
  required double rawAmount,
  required PaymentMode paymentMode,
  required Function(PaymentType) onSubmit,
  required bool startingCheckout,
  required String? checkoutError,
  required void Function(UserState userState, String currency) onPayWithGateway,
  Transaction? transaction,
}) {
  return Column(children: [
    Image.asset(
      ImageAssets.logo,
      height: width / 4,
      width: width / 4,
    ),
    // const SizedBox(height: AppSize.s16),

    Text(
      'Payment',
      style: appTextBlack24Bold,
    ),
    Text(
      amount,
      style: appTextGray24Bold,
    ),
    const SizedBox(height: AppSize.s16),

    paymentMode==PaymentMode.payOut?
    BlocBuilder<UserBloc, UserState> (
        builder: (context, userState) {
        final currency = transaction?.currency ?? 'NGN';
        final accounts = userState.accounts ?? (userState.user?.account != null ? [userState.user!.account!] : <Account>[]);
        Account? matchingAccount;
        for (final a in accounts) {
          if (a.currency == currency) {
            matchingAccount = a;
            break;
          }
        }
        final balance = matchingAccount?.balance ?? 0.0;

        final canUseWallet = balance >= rawAmount;
        // Each gateway handles one currency: Paystack NGN, Stripe GBP.
        final paystackEnabled = currency == 'NGN' && !startingCheckout;
        final stripeEnabled = currency == 'GBP' && !startingCheckout;

        return Padding(
          padding: const EdgeInsets.all(AppSize.s32),
          child: Column(
            children: [
              PrimaryButton(
                  title: 'Wallet ${parseAmountDouble(balance, currency)}',
                  active: canUseWallet,
                  onTap: () {
                    if (canUseWallet) onSubmit(PaymentType.account);
                  }
              ),
              if (!canUseWallet) ...[
                const SizedBox(height: AppSize.s8),
                Text('Insufficient wallet balance', style: appTextGray14),
              ],
              const SizedBox(height: AppSize.s16),
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                        title: 'Paystack',
                        active: paystackEnabled,
                        onTap: () {
                          if (paystackEnabled) onPayWithGateway(userState, currency);
                        }
                    ),
                  ),
                  const SizedBox(width: AppSize.s14),
                  Expanded(
                    child: PrimaryButton(
                        title: 'Stripe',
                        active: stripeEnabled,
                        onTap: () {
                          if (stripeEnabled) onPayWithGateway(userState, currency);
                        }
                    ),
                  ),
                ],
              ),
              if (startingCheckout) ...[
                const SizedBox(height: AppSize.s16),
                const AppCircleProgressIndicator(),
              ],
              if (checkoutError != null) ...[
                const SizedBox(height: AppSize.s16),
                Text(checkoutError, textAlign: TextAlign.center, style: appTextRed18),
              ],
            ],
          ),
        );
      }
    ):
    // Real-money deposit: no card/bank entry here — the next screen is
    // Paystack/Stripe's own hosted checkout page, which already presents
    // card, bank transfer and direct bank-account debit as options there.
    // The app never touches raw card/bank details itself.
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
      child: Column(
        children: [
          Text(
            "You'll be taken to a secure payment page to complete this with a card or your bank account.",
            textAlign: TextAlign.center,
            style: appTextGray18,
          ),
          const SizedBox(height: AppSize.s24),
          PrimaryButton(
              title: 'Continue',
              onTap: () {
                onSubmit(PaymentType.account);
              }),
        ],
      ),
    ),

    const SizedBox(height: AppSize.s32),
  ]);
}

_buildPaymentSubmittedView(
    {required double width,
    required Function() onReview,
    required Function() onHome,
    required Function() onRetry,
    required String errorMessage,
    required bool paymentSuccessful}) {
  ConfirmationPopupState state = ConfirmationPopupState.completed;
  if (!paymentSuccessful) {
    state = ConfirmationPopupState.rejected;
  }

  return Column(
    children: [
      const SizedBox(height: AppSize.s48),
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: state == ConfirmationPopupState.rejected
              ? AppColor.lightRed
              : AppColor.green,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(4, 4),
                  color: AppColor.gray,
                  blurRadius: 4,
                  spreadRadius: 4
              )
            ]),
        child: Icon(
            state == ConfirmationPopupState.rejected
                ? FontAwesomeIcons.xmark
                : Icons.check,
            color: AppColor.white,
            size: 48),
      ),
      const SizedBox(height: 16),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: width * 5 / 8,
              child: Text(
                state == ConfirmationPopupState.rejected
                    ? 'Payment Failed'
                    : 'Payment Successful',
                textAlign: TextAlign.center,
                style: appTextBlack24Bold,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: width * 6 / 8,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: state == ConfirmationPopupState.rejected
                            ? 'Your payment failed. $errorMessage'
                            : 'Your payment was successful, the other parties will be',
                        style: appTextGray18),
                    TextSpan(
                        text: state == ConfirmationPopupState.rejected
                            ? ""
                            : " \"notified\"",
                        style: appTextGray18Bold),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
      const SizedBox(height: AppSize.s20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
        child: SecondaryButton(
          title: state == ConfirmationPopupState.rejected ? "Retry" : "Review",
          onTap: () {
            if (state == ConfirmationPopupState.rejected) {
              onRetry();
            } else {
              onReview();
            }
          },
        ),
      ),
      const SizedBox(height: AppSize.s16),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
        child: PrimaryButton(
          title: "Go Home",
          onTap: () {
            onHome();
          },
        ),
      ),
      const SizedBox(height: 32),
    ],
  );
}
