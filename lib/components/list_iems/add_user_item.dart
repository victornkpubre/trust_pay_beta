import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/app_string.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/tiles/user_profile_tile.dart';

class AddUserItem extends StatefulWidget {
  final String username;
  final String image;
  final String account;
  final String? percentage;
  final double? size;
  final String amount;
  final Function? onDelete;
  final Function(double?) onChange;
  final bool deleting;
  final bool editing;
  final bool selecting;
  final bool selected;

  const AddUserItem(
      {super.key,
      required this.username,
      required this.image,
      required this.account,
      this.percentage,
      required this.amount,
      required this.deleting,
      required this.selecting,
      required this.selected,
      this.size, 
      this.onDelete,
      required this.onChange, 
      this.editing = false});

  @override
  State<AddUserItem> createState() => _AddUserItemState();
}

class _AddUserItemState extends State<AddUserItem> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if (widget.percentage != null) {
      controller.text = widget.percentage!;
    } else {
      controller.text = widget.amount;
    }


    return Stack(
      children: [
        UserProfileTile(
          size: widget.size ?? AppSize.s40,
          username: widget.username,
          image: widget.image,
          account: widget.account,
          expanded: false,
        ),

        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: widget.selecting
              ? Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.darkGray),
                        borderRadius: BorderRadius.circular(AppSize.s32)
                      ),
                      child: const SizedBox(
                        height: AppSize.s20,
                        width: AppSize.s20,
                      ),
                    ),
                  ],
                )
              : widget.selected
                  ? Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(AppSize.s32)),
                          child: Icon(
                            Icons.check,
                            color: AppColor.white,
                          ),
                        ),
                      ],
                    )
                  : widget.deleting
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSize.s16, vertical: AppSize.s8),
                          decoration: BoxDecoration(
                              color: AppColor.lightRed,
                              borderRadius: BorderRadius.circular(16)),
                          child: GestureDetector(
                            onTap: (){
                              if(widget.onDelete != null) {
                                 widget.onDelete!();
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  FontAwesomeIcons.trashCan,
                                  color: AppColor.white,
                                  size: 14,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  "Delete",
                                  style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: 12,
                                    fontFamily: 'Source Sans Pro',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSize.s16, vertical: AppSize.s8),
                          decoration: BoxDecoration(
                              color: AppColor.lightGray,
                              borderRadius: BorderRadius.circular(16)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              widget.editing?Center(
                                child: IntrinsicWidth(
                                  child: TextField(
                                    controller: controller,
                                    onChanged: (value) {
                                      double number = double.parse(value.substring(0, value.length).replaceAll('.', '').replaceAll(',', '').replaceAll(AppString.naira, ''));
                                      // print(number);
                                      widget.onChange(number);
                                    },
                                    decoration: const InputDecoration(
                                      isDense: true,
                                    ),
                                    style: TextStyle(
                                      height: 1,
                                        color: AppColor.fontGray,
                                        fontSize: FontSize.s16,
                                        fontFamily: 'Source Sans Pro',
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ):
                              Center(
                                child: Text(
                                  widget.percentage ?? widget.amount,
                                  style: TextStyle(
                                      color: AppColor.fontGray,
                                      fontSize: 14,
                                      fontFamily: 'Source Sans Pro',
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              widget.percentage != null
                                  ? Text(
                                      "%",
                                      style: TextStyle(
                                        color: AppColor.fontGray,
                                        fontSize: 14,
                                        fontFamily: 'Source Sans Pro',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
        ),
      ],
    );
  }
}
