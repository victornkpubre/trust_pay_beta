import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/app_types.dart';
import 'package:trust_pay_beta/components/base/user_image.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';

class MemberListTile extends StatefulWidget {
  final List<UserInput> members;
  final double width;
  const MemberListTile({super.key, required this.members, required this.width});

  @override
  State<MemberListTile> createState() => _MemberListTileState();
}

class _MemberListTileState extends State<MemberListTile> {
  bool expanded = false;
  int? currentSelection;

  @override
  Widget build(BuildContext context) {
    return widget.members.isEmpty
        ? Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.s16, vertical: AppSize.s10),
                decoration: BoxDecoration(
                    color: AppColor.secondary,
                    borderRadius: BorderRadius.circular(AppSize.s16)),
                height: widget.width / 10 + AppSize.s20,
                child: Center(
                  child: Text('No Users Selected', style: appTextGray14Bold),
                ),
              ),
            ],
          )
        : Column(
            children: [
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSize.s16, vertical: AppSize.s10),
                      decoration: BoxDecoration(
                          color: AppColor.secondary,
                          borderRadius: BorderRadius.circular(AppSize.s16)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: widget.members.map((member) {
                            int index = widget.members.indexOf(member);
                            return Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      currentSelection = index;
                                    });
                                  },
                                  child: SizedBox(
                                    width: widget.width / 10,
                                    child: UserImage(
                                      image: member.image,
                                      size: widget.width / 10,
                                    ),
                                  ),
                                ),
                                currentSelection != null &&
                                        currentSelection == index
                                    ? Container(
                                        width: widget.width / 10,
                                        height: widget.width / 10,
                                        decoration: BoxDecoration(
                                            color:
                                                AppColor.primary.withAlpha(50),
                                            borderRadius: BorderRadius.circular(
                                                widget.width / 10)),
                                        child: Icon(Icons.cancel_outlined,
                                            color: AppColor.fontBlack),
                                      )
                                    : Container(),
                              ],
                            );
                          }).toList(),
                        ),
                      )),
                ],
              ),
              const SizedBox(height: AppSize.s4),
              currentSelection != null
                  ? GestureDetector(
                      onTap: () {
                        var member = widget.members[currentSelection!];
                        setState(() {
                          currentSelection = null;
                          widget.members.remove(member);
                        });
                      },
                      child: Row(
                        children: [
                          const SizedBox(width: AppSize.s4),
                          Text(widget.members[currentSelection!].username,
                              style: appTextBlack16Bold),
                          const SizedBox(width: AppSize.s4),
                          Icon(Icons.cancel_outlined, color: AppColor.red),
                        ],
                      ),
                    )
                  : Container()
            ],
          );
  }
}
