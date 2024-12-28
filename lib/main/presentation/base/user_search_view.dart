import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/back_button.dart';
import 'package:trust_pay_beta/components/inputs/app_search_input.dart';
import 'package:trust_pay_beta/components/list_iems/add_user_item.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/domain/entities/user/entities.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';

class UserSearchView extends StatefulWidget {
  final bool nameOnly;
  const UserSearchView({super.key, this.nameOnly = false});

  @override
  State<UserSearchView> createState() => _UserSearchViewState();
}

class _UserSearchViewState extends State<UserSearchView> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, userState) {
          List<User> users = userState.userSearchResults ?? [];

          return Column(mainAxisSize: MainAxisSize.max, children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top),
            const SizedBox(height: AppSize.s16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  children: [
                    const AppBackButton(size: AppSize.s16),
                    const SizedBox(width: AppSize.s8),
                    Expanded(
                        child: AppSearchInput(
                      hint: 'Search...',
                      controller: searchController,
                      onChange: (text) {
                        if (text.length > 1) {
                          context
                              .read<UserBloc>()
                              .add(UserEvent.searchUsers(text, AppConstants.pageSize, 1));
                        }
                      },
                    )),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSize.s8),
            Expanded(
                child: SingleChildScrollView(
                    child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: users.map((user) {
                  return Column(
                    children: [
                      widget.nameOnly
                          ? const SizedBox(height: AppSize.s10)
                          : Container(),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context, user);
                        },
                        child: widget.nameOnly
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(user.firstName,
                                      style: appTextBlack18Bold),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColor.darkGray),
                                        borderRadius:
                                            BorderRadius.circular(AppSize.s32)),
                                    child: const SizedBox(
                                      height: AppSize.s20,
                                      width: AppSize.s20,
                                    ),
                                  ),
                                ],
                              )
                            : AddUserItem(
                                size: width / 7,
                                username:
                                    user.businessName ?? 'No business name',
                                image: user.profileImage,
                                account: user.account?.name,
                                amount: '',
                                deleting: false,
                                selecting: true,
                                selected: false,
                                onDelete: () {},
                                onChange: (value) {},
                              ),
                      ),
                      const SizedBox(height: AppSize.s10)
                    ],
                  );
                }).toList(),
              ),
            )))
          ]);
        },
      ),
    );
  }
}
