import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/back_button.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/components/tiles/user_profile_tile.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

class EditUserListView extends StatefulWidget {
  final List<User> list;
  const EditUserListView({super.key, required this.list});

  @override
  State<EditUserListView> createState() => _EditUserListViewState();
}

class _EditUserListViewState extends State<EditUserListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: AppSize.s32),
                Row(
                  children: [
                    const AppBackButton(size: AppSize.s18),
                    const SizedBox(width: AppSize.s32),
                    Text("Edit Pool", style: appTextBlack20Bold)
                  ],
                ),
                const SizedBox(height: 16),
            
                Expanded(
                  child: ReorderableListView.builder(
                    itemCount: widget.list.length,
                    itemBuilder: (context, index) {
                      User user = widget.list[index];

                      return Column(
                        key: ValueKey(user),
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: AppSize.s8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: AppSize.s40,
                                    width: 3,
                                    color: AppColor.green,
                                  ),
                                  const SizedBox(width: 4),
                                  Text("${index+1}", style: appTextBlack14Bold),
                                  const SizedBox(width: 8),
                                  UserProfileTile(
                                    size: AppSize.s48,
                                    username: user.toUserInput().username,
                                    account: user.toUserInput().account,
                                    image: user.toUserInput().image,
                                    secondaryColor: AppColor.grayAccent,
                                    expanded: false
                                  ),
                                ],
                              ),
                              ReorderableDragStartListener(
                                index: index,
                                child: Container(
                                  color: Colors.transparent,
                                  padding: const EdgeInsets.only(
                                    left: AppSize.s32,
                                    top: AppSize.s8,
                                    bottom: AppSize.s8
                                  ),
                                  child: Icon(
                                    FontAwesomeIcons.ellipsisVertical,
                                    color: AppColor.grayAccent,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSize.s8),
                        ],
                      );
                    },
                    onReorder:(oldIndex, newIndex) {
                      setState(() {
                        if (newIndex > oldIndex) {
                          newIndex -= 1;
                        }
                        final object = widget.list.removeAt(oldIndex);
                        widget.list.insert(newIndex, object);
                      });
                    },
                  ),
                )],
            ),

            Positioned(
              bottom: AppSize.s16,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
                child: PrimaryButton(
                  width: double.infinity,
                  title: "Save",
                  onTap: () async {
                    Navigator.pop(context, widget.list);
                  }
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}