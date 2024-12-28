import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/components/tiles/account_tile_primary.dart';
import 'package:trust_pay_beta/components/tiles/account_tile_secondary.dart';
import 'package:trust_pay_beta/components/tiles/countdown_tile.dart';
import 'package:trust_pay_beta/components/tiles/member_list_tile.dart';
import 'package:trust_pay_beta/components/tiles/obligation_info_tile.dart';
import 'package:trust_pay_beta/components/tiles/selected_site_tile.dart';
import 'package:trust_pay_beta/components/tiles/status_tile.dart';
import 'package:trust_pay_beta/components/tiles/transaction_acceptance_tile.dart';
import 'package:trust_pay_beta/components/tiles/transaction_members_tile.dart';
import 'package:trust_pay_beta/components/tiles/transaction_rejection_tile.dart';
import 'package:trust_pay_beta/components/tiles/transaction_title_tile.dart';
import 'package:trust_pay_beta/components/tiles/user_profile_tile.dart';
import 'package:trust_pay_beta/components/tiles/notice_tile.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

class Tiles extends StatefulWidget {
  const Tiles({super.key});

  @override
  State<Tiles> createState() => _TilesState();
}

class _TilesState extends State<Tiles> {
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
                  Text("Tiles",
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
                      Text("AccountTilePrimary",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  const AccountTilePrimary(number: "00095435656", width: 335),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("AccountTileSecondary",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  const AccountTileSecondary(accountNumber: "63772854567"),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("CountdownTile",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  const CountdownTile(
                    days: 4,
                    hours: 5,
                    minutes: 25,
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("ObligationInfoTile",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  const ObligationInfoTile(
                    title: "Aso-ebi Outfit",
                    token: "342356",
                    width: 335,
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("StatusTile", style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  const StatusTile(
                    status: TransactionStatus.pending,
                    size: 12,
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("TransactionMembersTile",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TransactionMembersTile(
                          iconSize: 40,
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
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("TransactionTitleTile",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  const TransactionTitleTile(
                    type: TransactionType.betsWagers,
                    fontSize: 14,
                    iconSize: 20,
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("UserProfileTile",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  UserProfileTile(
                      size: AppSize.s64,
                      username: "username",
                      image: ProfileIconAssets.avatar,
                      account: '#6723432',
                      primaryColor: AppColor.primary,
                      secondaryColor: AppColor.amber,
                      expanded: false),
                  const SizedBox(height: 32),
                  UserProfileTile(
                    size: AppSize.s64,
                    username: "username",
                    image: ProfileIconAssets.avatar,
                    account: '#6723432',
                    primaryColor: AppColor.fontGray,
                    secondaryColor: AppColor.amber,
                    expanded: false,
                    transaction: TransactionInput(
                        status: TransactionStatus.completed,
                        createdAt: DateTime(2024, 6, 22, 19, 0),
                        type: TransactionType.betsWagers),
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("NoticeTile", style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  NoticeTile(
                    width: MediaQuery.of(context).size.width,
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("MemberListTile",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  MemberListTile(
                      width: MediaQuery.of(context).size.width,
                      members: [
                        UserInput(
                            image: ProfileIconAssets.avatar,
                            username: "Sarah Doe",
                            account: "#4234564",
                            totalTransaction: 25,
                            completionRate: 89),
                        UserInput(
                            image: ProfileIconAssets.avatar,
                            username: "Victor Nelson",
                            account: "#4234564",
                            totalTransaction: 25,
                            completionRate: 89),
                        UserInput(
                            image: ProfileIconAssets.avatar,
                            username: "Von Doom",
                            account: "#4234564",
                            totalTransaction: 25,
                            completionRate: 89)
                      ]),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("TransactionAcceptanceTile",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  TransactionAcceptanceTile(
                      tileSize: AppSize.s48 * 2,
                      iconSize: AppSize.s40,
                      type: TransactionType.betsWagers,
                      owner: UserInput(
                          image: ProfileIconAssets.avatar,
                          username: "Victor Nelson",
                          account: "#4234564",
                          totalTransaction: 25,
                          completionRate: 89),
                      member: UserInput(
                          image: ProfileIconAssets.avatar,
                          username: "Von Doom",
                          account: "#4234564",
                          totalTransaction: 25,
                          completionRate: 89)),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("TransactionRejectionTile",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  TransactionRejectionTile(
                      tileSize: AppSize.s50 * 2,
                      iconSize: AppSize.s38,
                      type: TransactionType.betsWagers,
                      owner: UserInput(
                          image: ProfileIconAssets.avatar,
                          username: "Victor Nelson",
                          account: "#4234564",
                          totalTransaction: 25,
                          completionRate: 89),
                      member: UserInput(
                          image: ProfileIconAssets.avatar,
                          username: "Von Doom",
                          account: "#4234564",
                          totalTransaction: 25,
                          completionRate: 89)
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("SelectedWebsiteTile",
                          style: TextStyle(fontSize: 24)),
                    ],
                  ),
                  SelectedWebsiteTile(
                    url: "https://www.eurosport.com", 
                    title: "Eurosport",
                    selected: true,
                  ),

                  const SizedBox(height: 32),
                ],
              )
            : Container(),
      ],
    );
  }
}
