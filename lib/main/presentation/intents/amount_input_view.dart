import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/back_button.dart';
import 'package:trust_pay_beta/components/buttons/primary_btn.dart';
import 'package:trust_pay_beta/components/inputs/app_search_input.dart';
import 'package:trust_pay_beta/components/inputs/app_text_input.dart';
import 'package:trust_pay_beta/components/list_iems/add_user_item.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/domain/entities/user/entities.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';

class AmountInputView extends StatefulWidget {
  final bool nameOnly;
  const AmountInputView({super.key, this.nameOnly = false});

  @override
  State<AmountInputView> createState() => _AmountInputViewState();
}

class _AmountInputViewState extends State<AmountInputView> {
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, userState) {
          List<User> users = userState.userSearchResults ?? [];

          return Column(
              mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top),
            const SizedBox(height: AppSize.s32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  children: [
                    const AppBackButton(size: AppSize.s16),
                    const SizedBox(width: AppSize.s16),
                    Text('Enter Amount', style: appTextBlack20Bold),
                  ],
                ),
              ),
            ),
            // const SizedBox(height: AppSize.s32),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.s16, vertical: AppSize.s32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTextInput(
                        type: TextInputType.number,
                        hint: '10000',
                        controller: amountController
                    ),
                    const SizedBox(height: AppSize.s64),

                    PrimaryButton(
                        title: "Continue",
                        onTap: () {
                          Navigator.pop(context, amountController.value.text);
                        }
                    )
                  ]
                ),
              ),
            )
          ]);
        },
      ),
    );
  }
}
