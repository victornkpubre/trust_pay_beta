import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/popups/confirmation_popup.dart';
import 'package:trust_pay_beta/components/popups/flows/payment_flow_popup.dart';
import 'package:trust_pay_beta/components/popups/flows/token_generation_popup.dart';
import 'package:trust_pay_beta/components/popups/flows/token_verification_popup.dart';
import 'package:trust_pay_beta/components/popups/flows/transaction_acceptance_popup.dart';
import 'package:trust_pay_beta/components/popups/invalid_transaction_popup.dart';
import 'package:trust_pay_beta/components/popups/rejection_feedback_popup.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/presentation/base/dummy_data.dart';

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
                  RejectionFeedbackPopup(
                    width: 350,
                    username: "Sarah Doe",
                    message:
                        "I don't agree with the split. I don't think we should split the bill equally. I don't think it is fair",
                    onClick: () {},
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
                    width: 350,
                    amount: 'NGN 100,000',
                    onSubmit: () {
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
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height,
                    type: TransactionType.secureSales,
                    details: "Chelsea wins ManU",
                    username: "Victor Nelson",
                    transactionTitle: "Sales with Nelson",
                    onAccept: () {},
                    onReject: (feedback) {},
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
                      TransactionAcceptanceInput(
                        title: 'Aso-ebi Outfit',
                        amount: "100,000",
                        date: DateTime.now(),
                      ),
                      TransactionAcceptanceInput(
                        title: 'Lace',
                        amount: "60,000",
                        date: DateTime.now(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  TransactionAcceptancePopup(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height,
                    type: TransactionType.groupGoals,
                    details: "Chelsea wins ManU",
                    username: "Victor Nelson",
                    transactionTitle: "Sales with Nelson",
                    onAccept: () {},
                    onReject: (feedback) {},
                    // url:
                    //     'https://www.sportybet.com/ng/?utm_source=google&utm_medium=cpc&utm_campaign=10261656174&utm_content=102498664686&utm_term=sport%20bet&utm_source=google&utm_medium=cpc&utm_campaign=10261656174&utm_content=102498664686&utm_term=sport%20bet&gclid=Cj0KCQjwz7C2BhDkARIsAA_SZKad6xkjkdmjE0FroMWESAtRuPLlaq-J5C6yQWoocrdB_X5bYNsqD2waAnAqEALw_wcB',
                    //url: '/storage/emulated/0/Android/data/my_app/files/Pictures/ca04f332.png',
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
                  const SizedBox(height: 8),
                  TransactionAcceptancePopup(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height,
                    type: TransactionType.billSplitter,
                    details: "Chelsea wins ManU",
                    username: "Victor Nelson",
                    transactionTitle: "Sales with Nelson",
                    onAccept: () {},
                    onReject: (feedback) {},
                    // url:
                    //     'https://www.sportybet.com/ng/?utm_source=google&utm_medium=cpc&utm_campaign=10261656174&utm_content=102498664686&utm_term=sport%20bet&utm_source=google&utm_medium=cpc&utm_campaign=10261656174&utm_content=102498664686&utm_term=sport%20bet&gclid=Cj0KCQjwz7C2BhDkARIsAA_SZKad6xkjkdmjE0FroMWESAtRuPLlaq-J5C6yQWoocrdB_X5bYNsqD2waAnAqEALw_wcB',
                    //url: '/storage/emulated/0/Android/data/my_app/files/Pictures/ca04f332.png',
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
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height,
                    type: TransactionType.betsWagers,
                    details: "Chelsea wins ManU",
                    username: "Victor Nelson",
                    transactionTitle: "Sales with Nelson",
                    onAccept: () {},
                    onReject: (feedback) {},
                    url:
                        'https://www.sportybet.com/ng/?utm_source=google&utm_medium=cpc&utm_campaign=10261656174&utm_content=102498664686&utm_term=sport%20bet&utm_source=google&utm_medium=cpc&utm_campaign=10261656174&utm_content=102498664686&utm_term=sport%20bet&gclid=Cj0KCQjwz7C2BhDkARIsAA_SZKad6xkjkdmjE0FroMWESAtRuPLlaq-J5C6yQWoocrdB_X5bYNsqD2waAnAqEALw_wcB',
                    //url: '/storage/emulated/0/Android/data/my_app/files/Pictures/ca04f332.png',
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
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height,
                    type: TransactionType.moneyPool,
                    details: "Chelsea wins ManU",
                    username: "Victor Nelson",
                    transactionTitle: "Sales with Nelson",
                    onAccept: () {},
                    onReject: (feedback) {},
                    // url:
                    //     'https://www.sportybet.com/ng/?utm_source=google&utm_medium=cpc&utm_campaign=10261656174&utm_content=102498664686&utm_term=sport%20bet&utm_source=google&utm_medium=cpc&utm_campaign=10261656174&utm_content=102498664686&utm_term=sport%20bet&gclid=Cj0KCQjwz7C2BhDkARIsAA_SZKad6xkjkdmjE0FroMWESAtRuPLlaq-J5C6yQWoocrdB_X5bYNsqD2waAnAqEALw_wcB',
                    //url: '/storage/emulated/0/Android/data/my_app/files/Pictures/ca04f332.png',
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
