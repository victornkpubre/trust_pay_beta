import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/popups/confirmation_popup.dart';
import 'package:trust_pay_beta/components/popups/flows/payment_flow_popup.dart';
import 'package:trust_pay_beta/components/popups/flows/token_generation_popup.dart';
import 'package:trust_pay_beta/components/popups/flows/token_verification_popup.dart';
import 'package:trust_pay_beta/components/popups/flows/transaction_acceptance_popup.dart';
import 'package:trust_pay_beta/components/popups/flows/transaction_rejection_popup.dart';
import 'package:trust_pay_beta/components/popups/invalid_transaction_popup.dart';
import 'package:trust_pay_beta/components/popups/rejection_feedback_popup.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/components/base/dummy_data.dart';
import 'package:trust_pay_beta/main/domain/usecases/base/base.dart';

class PopUps extends StatefulWidget {
  const PopUps({super.key});

  @override
  State<PopUps> createState() => _PopUpsState();
}

class _PopUpsState extends State<PopUps> {
  bool showWidget = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
            onTap: () {
              setState(() {
                showWidget = !showWidget;
              });
            },
            child: Container(
              color: showWidget ? AppColor.primary : Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Pop Ups",
                      style: TextStyle(
                        fontSize: 32,
                        color: showWidget ? AppColor.white : Colors.black,
                      )),
                ],
              ),
            )),

        // AcceptTransactionPopup(
        //   width: MediaQuery.of(context).size.width,
        //   transactionTitle: "Resturant Bills",
        //   type: TransactionType.secureSales,
        //   onCancel: () {},
        //   onComplete: () {},
        //   sender:
        //       UserInput(username: "johnson", image: ProfileIconAssets.avatar),
        //   receiver:
        //       UserInput(username: "noname", image: ProfileIconAssets.avatar),
        // ),
        // const SizedBox(height: 32),
        // RejectTransactionPopup(
        //   feedBackController: TextEditingController(text: ""),
        //   width: MediaQuery.of(context).size.width,
        //   transactionTitle: "Resturant Bills",
        //   type: TransactionType.secureSales,
        //   onCancel: () {},
        //   onComplete: () {},
        //   sender:
        //       UserInput(username: "johnson", image: ProfileIconAssets.avatar),
        //   receiver:
        //       UserInput(username: "noname", image: ProfileIconAssets.avatar),
        // ),
        // const SizedBox(height: 32),
        showWidget
            ? Column(
                children: [
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("ConfirmationPopup",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  ConfirmationPopup(
                    width: 350,
                    transactionTitle: "Sales with Sarah",
                    action: "Verification",
                    state: ConfirmationPopupState.accepted,
                    onClick: () {},
                  ),
                  const SizedBox(height: 32),
                  ConfirmationPopup(
                    width: 350,
                    transactionTitle: "Sales with Sarah",
                    action: "Verification",
                    state: ConfirmationPopupState.completed,
                    onClick: () {},
                  ),
                  const SizedBox(height: 32),
                  ConfirmationPopup(
                    width: 350,
                    transactionTitle: "Sales with Sarah",
                    action: "Verification",
                    state: ConfirmationPopupState.rejected,
                    onClick: () {},
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("InvalidTransactionPopup",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  InvalidTransactionPopup(
                      width: 350,
                      message:
                          "The total contribution does not match the total for the transaction. Change the total or the contribution",
                      onClick: () {}),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("RejectionFeedbackPopup",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("ConfirmationPopup",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  ConfirmationPopup(
                    width: 350,
                    transactionTitle: "Sales with Sarah",
                    action: "Verification",
                    state: ConfirmationPopupState.accepted,
                    onClick: () {},
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("PaymentFlowPopup",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  PaymentFlowPopup(
                    paymentMode: PaymentMode.payOut,
                    width: 350,
                    amount: 'NGN 100,000',
                    rawAmount: 100000,
                    onSubmit: (type) {
                      return true;
                    },
                    onHome: () {},
                    onReview: () {},
                  ),
                  const SizedBox(height: 32),
                  PaymentFlowPopup(
                    paymentMode: PaymentMode.payIn,
                    width: 350,
                    amount: 'NGN 100,000',
                    rawAmount: 100000,
                    onSubmit: (type) {
                      return true;
                    },
                    onHome: () {},
                    onReview: () {},
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("TokenGenerationPopup",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  TokenGenerationPopup(
                    width: 350,
                    obligations: const [],
                    onSelect: (int) {},
                    onGenerateToken: (int) {},
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("TokenVerificationPopup",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  TokenVerificationPopup(
                    width: 350,
                    obligation: obligationsSecureSales[0],
                    onVerifyToken: (int) {},
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("TransactionAcceptancePopup",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  TransactionAcceptancePopup(
                    amount: 10000,
                    width: double.maxFinite,
                    type: TransactionType.secureSales,
                    transactionDetails: "Chelsea wins ManU",
                    username: "Victor Nelson",
                    transactionTitle: "Sales with Nelson",
                    expiryDate: DateTime.now().add(const Duration(days: 14)),
                    onAccept: () {},
                    onCancel: () {},
                    owner: users.first,
                    user: users.last,
                    users: [
                      UserTransactionInput(
                        image: ProfileIconAssets.avatar,
                        username: "Sarah Doe",
                        account: "#4234564",
                        totalTransaction: 25,
                        completionRate: 89,
                        status: TransactionStatus.pending,
                      ),
                    ],
                    obligations: [
                      TransactionPopupInput(
                        title: 'Aso-ebi Outfit',
                        amount: "100,000",
                        date: DateTime.now(),
                      ),
                      TransactionPopupInput(
                        title: 'Lace',
                        amount: "60,000",
                        date: DateTime.now(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  TransactionRejectionPopup(
                    amount: 10000,
                    width: double.maxFinite,
                    type: TransactionType.billSplitter,
                    transactionDetails: "Chelsea wins ManU",
                    username: "Victor Nelson",
                    transactionTitle: "Sales with Nelson",
                    expiryDate: DateTime.now().add(const Duration(days: 14)),
                    onReject: (note) {},
                    onCancel: () {},
                    owner: users.first,
                    user: users.last,
                    users: [
                      UserTransactionInput(
                        image: ProfileIconAssets.avatar,
                        username: "Sarah Doe",
                        account: "#4234564",
                        totalTransaction: 25,
                        completionRate: 89,
                        status: TransactionStatus.pending,
                      ),
                      UserTransactionInput(
                        image: ProfileIconAssets.avatar,
                        username: "Sarah Doe",
                        account: "#4234564",
                        totalTransaction: 25,
                        completionRate: 89,
                        status: TransactionStatus.pending,
                      ),
                      UserTransactionInput(
                        image: ProfileIconAssets.avatar,
                        username: "Sarah Doe",
                        account: "#4234564",
                        totalTransaction: 25,
                        completionRate: 89,
                        status: TransactionStatus.pending,
                      ),
                      UserTransactionInput(
                        image: ProfileIconAssets.avatar,
                        username: "Sarah Doe",
                        account: "#4234564",
                        totalTransaction: 25,
                        completionRate: 89,
                        status: TransactionStatus.pending,
                      ),
                      UserTransactionInput(
                        image: ProfileIconAssets.avatar,
                        username: "Sarah Doe",
                        account: "#4234564",
                        totalTransaction: 25,
                        completionRate: 89,
                        status: TransactionStatus.pending,
                      ),
                    ],
                  ),
                  TransactionAcceptancePopup(
                    amount: 10000,
                    width: double.maxFinite,
                    type: TransactionType.betsWagers,
                    transactionDetails: "Chelsea wins ManU",
                    username: "Victor Nelson",
                    transactionTitle: "Sales with Nelson",
                    expiryDate: DateTime.now().add(const Duration(days: 14)),
                    onAccept: () {},
                    onCancel: () {},
                    url: 'https://www.sportybet.com/ng/?utm_source=google&utm_medium=cpc&utm_campaign=10261656174&utm_content=102498664686&utm_term=sport%20bet&utm_source=google&utm_medium=cpc&utm_campaign=10261656174&utm_content=102498664686&utm_term=sport%20bet&gclid=Cj0KCQjwz7C2BhDkARIsAA_SZKad6xkjkdmjE0FroMWESAtRuPLlaq-J5C6yQWoocrdB_X5bYNsqD2waAnAqEALw_wcB',
                    owner: users.first,
                    user: users.last,
                    users: [
                      UserTransactionInput(
                        image: ProfileIconAssets.avatar,
                        username: "Sarah Doe",
                        account: "#4234564",
                        totalTransaction: 25,
                        completionRate: 89,
                        status: TransactionStatus.pending,
                      ),
                      UserTransactionInput(
                        image: ProfileIconAssets.avatar,
                        username: "Sarah Doe",
                        account: "#4234564",
                        totalTransaction: 25,
                        completionRate: 89,
                        status: TransactionStatus.pending,
                      ),
                      UserTransactionInput(
                        image: ProfileIconAssets.avatar,
                        username: "Sarah Doe",
                        account: "#4234564",
                        totalTransaction: 25,
                        completionRate: 89,
                        status: TransactionStatus.pending,
                      ),
                      UserTransactionInput(
                        image: ProfileIconAssets.avatar,
                        username: "Sarah Doe",
                        account: "#4234564",
                        totalTransaction: 25,
                        completionRate: 89,
                        status: TransactionStatus.pending,
                      ),
                      UserTransactionInput(
                        image: ProfileIconAssets.avatar,
                        username: "Sarah Doe",
                        account: "#4234564",
                        totalTransaction: 25,
                        completionRate: 89,
                        status: TransactionStatus.pending,
                      ),
                    ],
                  ),
                  TransactionAcceptancePopup(
                    amount: 10000,
                    width: double.maxFinite,
                    type: TransactionType.moneyPool,
                    transactionDetails: "Chelsea wins ManU",
                    username: "Victor Nelson",
                    transactionTitle: "Sales with Nelson",
                    expiryDate: DateTime.now().add(const Duration(days: 14)),
                    onAccept: () {},
                    onCancel: () {},
                    owner: users.first,
                    user: users.last,
                    users: [
                      UserTransactionInput(
                        image: ProfileIconAssets.avatar,
                        username: "Sarah Doe",
                        account: "#4234564",
                        totalTransaction: 25,
                        completionRate: 89,
                        status: TransactionStatus.pending,
                      ),
                      UserTransactionInput(
                        image: ProfileIconAssets.avatar,
                        username: "Sarah Doe",
                        account: "#4234564",
                        totalTransaction: 25,
                        completionRate: 89,
                        status: TransactionStatus.pending,
                      ),
                      UserTransactionInput(
                        image: ProfileIconAssets.avatar,
                        username: "Sarah Doe",
                        account: "#4234564",
                        totalTransaction: 25,
                        completionRate: 89,
                        status: TransactionStatus.pending,
                      ),
                      UserTransactionInput(
                        image: ProfileIconAssets.avatar,
                        username: "Sarah Doe",
                        account: "#4234564",
                        totalTransaction: 25,
                        completionRate: 89,
                        status: TransactionStatus.pending,
                      ),
                      UserTransactionInput(
                        image: ProfileIconAssets.avatar,
                        username: "Sarah Doe",
                        account: "#4234564",
                        totalTransaction: 25,
                        completionRate: 89,
                        status: TransactionStatus.pending,
                      ),
                    ],
                  ),
                ],
              )
            : Container(),
      ],
    );
  }
}
