import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/app_string.dart';
import 'package:trust_pay_beta/components/buttons/transaction_card_withdraw_btn.dart';
import 'package:trust_pay_beta/components/buttons/transaction_card_add_btn.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/components/style/text.dart';

class AccountCard extends StatefulWidget {
  final String balance;
  final double width;
  final double height;
  final bool solid;
  final String currencySymbol;
  final String accountNumber;
  final String currency;
  final Function onAccountBtnClicked;
  final Function onDeposit;
  final Function onWithdraw;
   const AccountCard({super.key, required this.balance, required this.width, required this.height, required this.solid, this.currencySymbol = '₦', this.accountNumber = '', this.currency = '', required this.onAccountBtnClicked, required this.onDeposit, required this.onWithdraw});

  @override
  State<AccountCard> createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {
  bool showBalance = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.solid?
        Container(
          width: widget.width,
          height: widget.height,
          decoration: ShapeDecoration (
            color: AppColor.primary,
            shape: RoundedRectangleBorder (
              borderRadius: BorderRadius.circular(AppSize.s16),
            ),
            shadows: [
               boxShadowThree
            ],
          ),
        ):
        SizedBox(
          width: widget.width,
          height: widget.height,
        ),

        Image.asset(
          ImageAssets.patternTwo,
          width: widget.width,
          height: widget.height,
          fit: BoxFit.fill
        ),
    
        Container(
          width: widget.width,
          height: widget.height,
          padding:  const EdgeInsets.symmetric(horizontal: AppSize.s16, vertical: AppSize.s16),
          decoration: ShapeDecoration(
            color: widget.solid? Colors.transparent: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s16),
            ),
            shadows: [
               boxShadowTwo
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.accountNumber.isNotEmpty)
                Text(
                  '${widget.accountNumber} · ${widget.currency}',
                  style: widget.solid? appTextWhite14Bold: appTextBlack14Bold,
                ),

              widget.solid?
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.availableBalance,
                      style: widget.solid? appTextWhite14Bold: appTextBlack14Bold
                    ),
                    const SizedBox(width: AppSize.s8),
                            
                    InkWell(
                      child: showBalance? 
                        Icon(Icons.visibility_off, size: FontSize.s24, color: AppColor.white): 
                        Icon(Icons.visibility, size: FontSize.s24, color: AppColor.white),
                      onTap: () {
                        setState(() {
                          showBalance = !showBalance;
                        });
                      },
                    )
                  ],
                ): 
              
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: widget.solid? 
                      MainAxisAlignment.spaceBetween:
                      MainAxisAlignment.start,
                      children: [
                        Text(
                          AppString.availableBalance,
                          style: widget.solid? appTextWhite14Bold: appTextBlack14Bold
                        ),
                        const SizedBox(width: AppSize.s8),
                               
                        InkWell(
                          child: showBalance? 
                            Icon (
                              Icons.visibility_off, 
                              size: FontSize.s24, 
                              color: AppColor.black, 
                            ): 
                            Icon (
                              Icons.visibility, 
                              size: FontSize.s24, 
                              color: AppColor.black, 
                            ),
                          onTap: () {
                            setState(() {
                              showBalance = !showBalance;
                            });
                          },
                        )
                      ],
                   ),
                    
                  
                  InkWell(
                    onTap: () {
                      widget.onAccountBtnClicked();
                    },
                    child: Container(
                      padding:  const EdgeInsets.symmetric(
                        horizontal: AppSize.s14,
                        vertical: AppSize.s10
                      ),
                      decoration: ShapeDecoration(
                        color:  AppColor.lightGray,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.s64),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            AppString.accounts,
                            style: appTextBlack14Bold
                          ),
                          const SizedBox(width: 8),
                          const Icon(FontAwesomeIcons.angleRight, size: FontSize.s12),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
        
              Row(
                children: [
                  showBalance?  Text(
                    '${widget.currencySymbol}${widget.balance}',
                    textAlign : TextAlign.center,
                    style: widget.solid? appTextWhite32Bold: appTextBlack32Bold
                  ): 
                   Row(
                    children: [
                      Icon(FontAwesomeIcons.asterisk, size: FontSize.s24, color: widget.solid? AppColor.white: AppColor.black),
                      Icon(FontAwesomeIcons.asterisk, size: FontSize.s24, color: widget.solid? AppColor.white: AppColor.black),
                      Icon(FontAwesomeIcons.asterisk, size: FontSize.s24, color: widget.solid? AppColor.white: AppColor.black),
                      Icon(FontAwesomeIcons.asterisk, size: FontSize.s24, color: widget.solid? AppColor.white: AppColor.black),
                      Icon(FontAwesomeIcons.asterisk, size: FontSize.s24, color: widget.solid? AppColor.white: AppColor.black),
                    ],
                  )
                ],
              ),
        
               Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TransactionCardAddButton(
                    onClick: () {
                      widget.onDeposit();
                    },
                  ),
                  TransactionCardWithdrawButton(
                    onClick: () {
                      widget.onWithdraw();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}