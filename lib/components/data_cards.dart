import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/data_cards/account_card.dart';
import 'package:trust_pay_beta/components/data_cards/obligation_card.dart';
import 'package:trust_pay_beta/components/data_cards/seller_card.dart';
import 'package:trust_pay_beta/components/data_cards/transaction_alert_card.dart';
import 'package:trust_pay_beta/components/data_cards/transaction_details_card.dart';
import 'package:trust_pay_beta/components/data_cards/transaction_stats_card.dart';
import 'package:trust_pay_beta/components/data_cards/user_transaction_details_card.dart';
import 'package:trust_pay_beta/components/data_cards/user_transaction_info_card.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

import 'base/dummy_data.dart';

class DataCards extends StatefulWidget {
  const DataCards({super.key});

  @override
  State<DataCards> createState() => _DataCardsState();
}

class _DataCardsState extends State<DataCards> {
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
                  Text("Data Cards",
                      style: TextStyle(
                        fontSize: 32,
                        color: showWidget ? AppColor.white : Colors.black,
                      )),
                ],
              ),
            )),
        showWidget
            ? Column(
                children: [
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("AccountCard", style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  const AccountCard(
                      width: 350, height: 184, solid: false, balance: "50,000"),
                  const SizedBox(height: 64),
                  const AccountCard(
                      width: 350, height: 184, solid: true, balance: "50,000"),
                  const SizedBox(height: 64),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("TransactionAlertCard",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  TransactionAlertCard(
                    width: 350,
                    height: 184,
                    username: 'Victor Nelson',
                    transaction: transactions[0],
                    currentUser: users[0],
                    userImage: ProfileIconAssets.avatar,
                  ),
                  const SizedBox(height: 64),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("SellerDataCard",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  SellerDataCard(
                    profileImage: ProfileIconAssets.avatar,
                    username: "Sarah Doe",
                    accountNumber: '#7672882',
                    trades: '25',
                    completionRate: '99%',
                    expanded: true,
                    width: MediaQuery.of(context).size.width,
                    onCancel: () {},
                  ),
                  const SizedBox(height: 64),
                  SellerDataCard(
                    profileImage: ProfileIconAssets.avatar,
                    username: "Sarah Doe",
                    accountNumber: '#7672882',
                    trades: '25',
                    completionRate: '99%',
                    expanded: false,
                    width: MediaQuery.of(context).size.width,
                    onCancel: () {},
                  ),
                  const SizedBox(height: 64),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("TransactionStatsCard",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  const TransactionStatsCard(
                    width: 350,
                    transactions: 22,
                    successful: 12,
                    pending: 10,
                    type: TransactionType.betsWagers,
                    percentageComplete: 0.2,
                  ),
                  const SizedBox(height: 64),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("ObligationCard",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  const ObligationCard(
                    amount: "100,000",
                    title: "Aso-ebi Outfit",
                    description:
                        '25 yards of Ghanian fabric material to be delivered with 10 yards of thick and original Gele material.',
                    width: 355,
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("TransactionDetailsCard",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  TransactionDetailsCard(
                    title: "110k take 1m",
                    width: 350,
                    date: DateTime.now(),
                    type: TransactionType.secureSales,
                    status: TransactionStatus.accepted,
                    amount: "100,000",
                    members: [
                      UserInput(
                          image: ProfileIconAssets.avatar,
                          username: "Sarah Doe",
                          account: "#4234564",
                          totalTransaction: 25,
                          completionRate: 89),
                      UserInput(
                          image: ProfileIconAssets.avatar,
                          username: "Sarah Doe",
                          account: "#4234564",
                          totalTransaction: 25,
                          completionRate: 89),
                      UserInput(
                          image: ProfileIconAssets.avatar,
                          username: "Sarah Doe",
                          account: "#4234564",
                          totalTransaction: 25,
                          completionRate: 89)
                    ],
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("UserTransactionInfoCard",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  const UserTransactionInfoCard(
                    width: 335,
                    percentageComplete: 0.3,
                    type: TransactionType.secureSales,
                    amount: 12,
                    username: "Victor Nelson",
                    profileImage: ProfileIconAssets.avatar,
                  ),
                  const SizedBox(height: 32),
                  UserTransactionDetailsCard(
                    width: 335,
                    title: "110k take 1m",
                    createdAt: DateTime.now(),
                    nextHarvestDate: DateTime.now(),
                    status: TransactionStatus.accepted,
                    percentageComplete: 0.78,
                    amount: "1,000,000",
                    members: [
                      UserInput(
                          image: ProfileIconAssets.avatar,
                          username: "Sarah Doe",
                          account: "#4234564",
                          totalTransaction: 25,
                          completionRate: 89),
                      UserInput(
                          image: ProfileIconAssets.avatar,
                          username: "Sarah Doe",
                          account: "#4234564",
                          totalTransaction: 25,
                          completionRate: 89),
                      UserInput(
                          image: ProfileIconAssets.avatar,
                          username: "Sarah Doe",
                          account: "#4234564",
                          totalTransaction: 25,
                          completionRate: 89)
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              )
            : Container(),
      ],
    );
  }
}
