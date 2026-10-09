import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/buttons/secondary_btn.dart';
import 'package:trust_pay_beta/components/popups/popup_bar.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';

/// Asked when the user taps "Create Transaction": set it up by chatting with
/// the AI support assistant, or fill in the usual form. The sheet closes
/// before either callback runs.
void showCreateTransactionChoice(
  BuildContext context, {
  required String typeName,
  required VoidCallback onUseAi,
  required VoidCallback onUseForm,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (sheetContext) {
      void choose(VoidCallback action) {
        Navigator.of(sheetContext).pop();
        action();
      }

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: AppSize.s8),
              const PopUpBar(),
              const SizedBox(height: AppSize.s16),
              Text('Create a $typeName transaction', style: appTextBlack20Bold, textAlign: TextAlign.center),
              const SizedBox(height: AppSize.s8),
              Text(
                'Would you like the AI support assistant to help you set it up? '
                'Just describe the deal and it will draft the transaction for you to review.',
                style: appTextGray16,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSize.s24),
              PrimaryButton(
                title: 'Use AI support',
                icon: Icons.auto_awesome,
                onTap: () => choose(onUseAi),
              ),
              const SizedBox(height: AppSize.s16),
              SecondaryButton(
                title: 'Fill in the form myself',
                onTap: () => choose(onUseForm),
              ),
              const SizedBox(height: AppSize.s24),
            ],
          ),
        ),
      );
    },
  );
}
