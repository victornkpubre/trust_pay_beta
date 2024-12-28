import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/list_iems/add_user_item.dart';
import 'package:trust_pay_beta/components/list_iems/notification_item.dart';
import 'package:trust_pay_beta/components/list_iems/obligation_list_item.dart';
import 'package:trust_pay_beta/components/list_iems/profile_item.dart';
import 'package:trust_pay_beta/components/list_iems/transaction_obligation_item.dart';
import 'package:trust_pay_beta/components/list_iems/user_profile_status_list_item.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

class ListItems extends StatefulWidget {
  const ListItems({super.key});

  @override
  State<ListItems> createState() => _ListItemsState();
}

class _ListItemsState extends State<ListItems> {
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
                  Text("List Items",
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
                      Text("NotificationItem",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  NotificationItem(
                    size: MediaQuery.of(context).size.width/8,
                    username: "username",
                    amount: "100,000",
                    createdAt: DateTime.now(),
                    image: ProfileIconAssets.avatar,
                    transaction: TransactionInput(
                        status: TransactionStatus.pending,
                        type: TransactionType.betsWagers,
                        createdAt: DateTime(2024, 6, 22, 19, 0)),
                  ),
                  const SizedBox(height: 32),
                  NotificationItem(
                    size: MediaQuery.of(context).size.width/8,
                    username: "username",
                    amount: "100,000",
                    createdAt: DateTime.now(),
                    image: ProfileIconAssets.avatar,
                    transaction: TransactionInput(
                        status: TransactionStatus.pending,
                        type: TransactionType.billSplitter,
                        createdAt: DateTime(2024, 6, 22, 19, 0)),
                  ),
                  const SizedBox(height: 32),
                  NotificationItem(
                    size: MediaQuery.of(context).size.width/8,
                    username: "username",
                    amount: "100,000",
                    createdAt: DateTime.now(),
                    image: ProfileIconAssets.avatar,
                    transaction: TransactionInput(
                        status: TransactionStatus.pending,
                        type: TransactionType.groupGoals,
                        createdAt: DateTime(2024, 6, 22, 19, 0)),
                  ),
                  const SizedBox(height: 32),
                  NotificationItem(
                    size: MediaQuery.of(context).size.width/8,
                    username: "username",
                    amount: "100,000",
                    createdAt: DateTime.now(),
                    image: ProfileIconAssets.avatar,
                    transaction: TransactionInput(
                        status: TransactionStatus.pending,
                        type: TransactionType.moneyPool,
                        createdAt: DateTime(2024, 6, 22, 19, 0)),
                  ),
                  const SizedBox(height: 32),
                  NotificationItem(
                    size: MediaQuery.of(context).size.width/8,
                    username: "username",
                    amount: "100,000",
                    createdAt: DateTime.now(),
                    image: ProfileIconAssets.avatar,
                    transaction: TransactionInput(
                        status: TransactionStatus.pending,
                        type: TransactionType.secureSales,
                        createdAt: DateTime(2024, 6, 22, 19, 0)),
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("TransactionObligationItem",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  TransactionObligationItem(
                    size: MediaQuery.of(context).size.width/8,
                    amount: 100000,
                    title: 'Chelsea wins Man U',
                    date: DateTime.now(),
                    obligationStatus: ObligationStatus.pending,
                    // transaction: TransactionInput(
                    //     status: TransactionStatus.pending,
                    //     type: TransactionType.secureSales,
                    //     createdAt: DateTime(2024, 6, 22, 19, 0)),
                  ),
                  const SizedBox(height: 8),
                  TransactionObligationItem(
                    size: MediaQuery.of(context).size.width/8,
                    amount: 100000,
                    title: 'Chelsea wins Man U',
                    date: DateTime.now(),
                    obligationStatus: ObligationStatus.fulfilled,
                    // transaction: TransactionInput(
                    //     status: TransactionStatus.pending,
                    //     type: TransactionType.betsWagers,
                    //     createdAt: DateTime(2024, 6, 22, 19, 0)),
                  ),
                  const SizedBox(height: 8),
                  TransactionObligationItem(
                    size: MediaQuery.of(context).size.width/8,
                    amount: 100000,
                    title: 'Chelsea wins Man U',
                    date: DateTime.now(),
                    obligationStatus: ObligationStatus.paid,
                    // transaction: TransactionInput(
                    //     status: TransactionStatus.pending,
                    //     type: TransactionType.betsWagers,
                    //     createdAt: DateTime(2024, 6, 22, 19, 0)),
                  ),
                  const SizedBox(height: 8),
                  TransactionObligationItem(
                    size: MediaQuery.of(context).size.width/8,
                    amount: 100000,
                    title: 'Chelsea wins Man U',
                    date: DateTime.now(),
                    obligationStatus: ObligationStatus.verified,
                    // transaction: TransactionInput(
                    //     status: TransactionStatus.pending,
                    //     type: TransactionType.betsWagers,
                    //     createdAt: DateTime(2024, 6, 22, 19, 0)),
                  ),
                  const SizedBox(height: 32),

                  TransactionObligationItem(
                    size: MediaQuery.of(context).size.width/8,
                    amount: 100000,
                    title: 'Chelsea wins Man U',
                    date: DateTime.now(),
                    transaction: TransactionInput(
                        status: TransactionStatus.pending,
                        type: TransactionType.betsWagers,
                        createdAt: DateTime(2024, 6, 22, 19, 0)),
                  ),
                  const SizedBox(height: 8),
                  TransactionObligationItem(
                    size: MediaQuery.of(context).size.width/8,
                    amount: 100000,
                    title: 'Chelsea wins Man U',
                    date: DateTime.now(),
                    transaction: TransactionInput(
                        status: TransactionStatus.accepted,
                        type: TransactionType.betsWagers,
                        createdAt: DateTime(2024, 6, 22, 19, 0)),
                  ),
                  const SizedBox(height: 8),
                  TransactionObligationItem(
                    size: MediaQuery.of(context).size.width/8,
                    amount: 100000,
                    title: 'Chelsea wins Man U',
                    date: DateTime.now(),
                    transaction: TransactionInput(
                        status: TransactionStatus.declined,
                        type: TransactionType.betsWagers,
                        createdAt: DateTime(2024, 6, 22, 19, 0)),
                  ),
                  const SizedBox(height: 8),
                  TransactionObligationItem(
                    size: MediaQuery.of(context).size.width/8,
                    amount: 100000,
                    title: 'Chelsea wins Man U',
                    date: DateTime.now(),
                    transaction: TransactionInput(
                        status: TransactionStatus.verification,
                        type: TransactionType.betsWagers,
                        createdAt: DateTime(2024, 6, 22, 19, 0)),
                  ),
                  const SizedBox(height: 8),
                  TransactionObligationItem(
                    size: MediaQuery.of(context).size.width/8,
                    amount: 100000,
                    title: 'Chelsea wins Man U',
                    date: DateTime.now(),
                    transaction: TransactionInput(
                        status: TransactionStatus.completed,
                        type: TransactionType.betsWagers,
                        createdAt: DateTime(2024, 6, 22, 19, 0)),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("AddUserItem", style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  AddUserItem(
                    username: "Nelson Logan",
                    image: ProfileIconAssets.avatar,
                    account: "#4261723",
                    amount: "100,000",
                    deleting: false,
                    selecting: false,
                    selected: false,
                    onChange: (v){},
                    // editing: false,
                  ),
                  const SizedBox(height: 32),
                  AddUserItem(
                    username: "Nelson Logan",
                    image: ProfileIconAssets.avatar,
                    account: "#4261723",
                    amount: "100,000",
                    percentage: "25",
                    deleting: false,
                    selecting: false,
                    selected: false,
                    onChange: (v){},
                    // editing: false,
                  ),
                  const SizedBox(height: 32),
                  AddUserItem(
                    username: "Nelson Logan",
                    image: ProfileIconAssets.avatar,
                    account: "#4261723",
                    amount: "100,000",
                    percentage: "25",
                    deleting: true,
                    selecting: false,
                    selected: false,
                    onChange: (v){},
                    // editing: false,
                  ),
                  const SizedBox(height: 32),
                  AddUserItem(
                    username: "Nelson Logan",
                    image: ProfileIconAssets.avatar,
                    account: "#4261723",
                    amount: "100,000",
                    percentage: "25",
                    deleting: false,
                    selecting: true,
                    selected: false,
                    onChange: (v){},
                    // editing: true,
                  ),
                  const SizedBox(height: 32),
                  AddUserItem(
                    username: "Nelson Logan",
                    image: ProfileIconAssets.avatar,
                    account: "#4261723",
                    amount: "100,000",
                    percentage: "25",
                    deleting: false,
                    selecting: false,
                    selected: true,
                    onChange: (v){},
                    // editing: true,
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("ProfileItem", style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  const ProfileItem(
                    type: ProfileType.edit,
                  ),
                  const SizedBox(height: 8),
                  const ProfileItem(
                    type: ProfileType.account,
                  ),
                  const SizedBox(height: 8),
                  const ProfileItem(
                    type: ProfileType.biometrics,
                  ),
                  const SizedBox(height: 8),
                  const ProfileItem(
                    type: ProfileType.mediation,
                  ),
                  const SizedBox(height: 8),
                  const ProfileItem(
                    type: ProfileType.reset,
                  ),
                  const SizedBox(height: 8),
                  const ProfileItem(
                    type: ProfileType.support,
                  ),
                  const SizedBox(height: 8),
                  const ProfileItem(
                    type: ProfileType.logout,
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("ObligationListItem",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  ObligationListItem(
                    title: 'Aso-ebi Outfit',
                    amount: 100000.00,
                    dateTime: DateTime.now(),
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("UserProfileStatusListItem",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  UserProfileStatusListItem(
                    transactionStatus: TransactionStatus.pending,
                    amount: 200000,
                    textColor: AppColor.darkGray,
                    user: UserInput(
                        image: ProfileIconAssets.avatar,
                        username: "Sarah Doe",
                        account: "#4234564",
                        totalTransaction: 25,
                        completionRate: 89),
                  ),
                  const SizedBox(height: 32),
                  UserProfileStatusListItem(
                    transactionStatus: TransactionStatus.accepted,
                    amount: 200000,
                    textColor: AppColor.darkGray,
                    user: UserInput(
                        image: ProfileIconAssets.avatar,
                        username: "Sarah Doe",
                        account: "#4234564",
                        totalTransaction: 25,
                        completionRate: 89),
                  ),
                  const SizedBox(height: 32),
                  UserProfileStatusListItem(
                    transactionStatus: TransactionStatus.completed,
                    amount: 200000,
                    textColor: AppColor.darkGray,
                    user: UserInput(
                        image: ProfileIconAssets.avatar,
                        username: "Sarah Doe",
                        account: "#4234564",
                        totalTransaction: 25,
                        completionRate: 89),
                  ),
                  const SizedBox(height: 32),
                  UserProfileStatusListItem(
                    transactionStatus: TransactionStatus.verification,
                    amount: 200000,
                    textColor: AppColor.darkGray,
                    user: UserInput(
                        image: ProfileIconAssets.avatar,
                        username: "Sarah Doe",
                        account: "#4234564",
                        totalTransaction: 25,
                        completionRate: 89),
                  ),
                  const SizedBox(height: 32),
                  UserProfileStatusListItem(
                    transactionStatus: TransactionStatus.declined,
                    amount: 200000,
                    textColor: AppColor.darkGray,
                    user: UserInput(
                        image: ProfileIconAssets.avatar,
                        username: "Sarah Doe",
                        account: "#4234564",
                        totalTransaction: 25,
                        completionRate: 89),
                  ),
                  const SizedBox(height: 32),
                ],
              )
            : Container(),
      ],
    );
  }
}
