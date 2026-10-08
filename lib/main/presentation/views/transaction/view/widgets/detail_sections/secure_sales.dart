import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../../../components/base/app_sizes.dart';
import '../../../../../../../components/buttons/primary_btn.dart';
import '../../../../../../../components/indicators/obligation_progress_indicator.dart';
import '../../../../../../../components/list_iems/transaction_obligation_item.dart';
import '../../../../../../../components/style/colors.dart';
import '../../../../../../../components/style/text.dart';
import '../../../../../../../components/tiles/notice_tile.dart';
import '../../../../../../domain/entities/entities.dart';
import '../../../../../base/progress_indicator.dart';
import '../../../../../blocs/transaction_details/transaction_details_bloc.dart';
import '../../../../modals/token_modal.dart';
import '../../../../modals/verify_token_modal.dart';
import '../transaction_details_section.dart';

Widget SecureSalesDetails(
    {required double width,
      required BuildContext context,
      required User currentUser,
      required Transaction transaction,
      required TransactionDetailsState state,
      required List<Obligation> obligations,
      required List<bool> tokenVisibilities,
      required List<String> tokens,
      required Function(int) onTokenVisibilityToggle}) {
  return Column(
    children: [
      const SizedBox(height: AppSize.s16),
      ObligationProgressIndicator(
          fontSize: FontSize.s16,
          width: width,
          paymentsFulfilled: obligations
              .where((o) => o.status == ObligationStatus.paid)
              .length,
          obligationsTotal: obligations
              .where((o) => o.type.isFulfilment)
              .length,
          obligationsFulfilled: obligations
              .where((o) => o.status == ObligationStatus.fulfilled || o.status == ObligationStatus.paid)
              .length),
      const SizedBox(height: AppSize.s8),
      Expanded(
        child: SingleChildScrollView(
          child: Column(
              children: obligations.where((o) => o.type.isFulfilment).map((o) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        if(userIsBuyer(currentUser, transaction)) {
                          showVerifyTokenModal(
                            context,
                            o,
                            state,
                            (obligation) {
                              context.read<TransactionDetailsBloc>().add(TransactionDetailsEvent.verifyTransactionObligation(currentUser, obligation, transaction, context, state));
                            },
                            currency: transaction.currency
                          );
                        }
                      },
                      child: TransactionObligationItem(
                        title: o.title,
                        amount: o.amount,
                        currency: transaction.currency,
                        date: o.dueDate,
                        obligationStatus: o.status,
                        size: width / 10
                      ),
                    ),
                    const SizedBox(height: AppSize.s8),
                  ],
                );
              }).toList()),
        ),
      ),
      const SizedBox(height: AppSize.s8),
      const Divider(
        thickness: 2,
        color: Colors.grey,
        height: 0,
      ),
      const SizedBox(height: AppSize.s16),
      !userIsBuyer(currentUser, transaction)?Expanded(
        child: noTokensGenerated(tokens)? Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Obligation',
                  style: appTextGray16,
                ),
                Text(
                  'Token',
                  style: appTextGray16,
                ),
              ],
            ),
            const SizedBox(height: AppSize.s10),
            Expanded(
              child: SingleChildScrollView(
                  child: BlocBuilder<TransactionDetailsBloc, TransactionDetailsState>(
                    builder: (context, state) {
                      return state.state == TransactionDetailsBlocStatus.loading?
                      Container():
                      Column(children: obligations.map((o) {
                        int index = obligations.indexOf(o);
                        return !(index + 1 > tokens.length)? Column(
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  o.title,
                                  style: appTextBlack18Bold,
                                ),
                                InkWell(
                                  onTap: () {
                                    onTokenVisibilityToggle(index);
                                  },
                                  child: Row(
                                    children: [
                                      Container(

                                        child: !tokenVisibilities[index]
                                            ? Icon(
                                          Icons.visibility_off,
                                          size: FontSize.s24,
                                          color: AppColor.black,
                                        )
                                            : Icon(
                                          Icons.visibility,
                                          size: FontSize.s24,
                                          color: AppColor.black,
                                        ),
                                      ),
                                      const SizedBox(width: AppSize.s4),
                                      tokenVisibilities[index]
                                          ? Text(
                                        tokens[index],
                                        style: appTextBlack16Bold,
                                      )
                                          : Row(
                                        children: List.generate(
                                            5,
                                                (index) => Icon(
                                                FontAwesomeIcons
                                                    .asterisk,
                                                size: FontSize.s10,
                                                color: AppColor
                                                    .black)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: AppSize.s8),
                          ],
                        ): Container();
                      }).toList());
                    },
                  )),
            ),
          ],
        ): state.transaction == null?
        Container(child: Center(child: const AppCircleProgressIndicator())):
        Column(
          children: [
            Text(
              userIsBuyer(currentUser, transaction)?'Verify Obligation': 'No Tokens Generated',
              style: appTextGray18,
            ),
            const SizedBox(height: AppSize.s8),
            NoticeTile(
              width: width,
              richText: Text.rich(
                TextSpan(
                  style: const TextStyle(fontSize: 16),
                  children: [
                    TextSpan(
                      text: userIsBuyer(currentUser, transaction)?
                      'Tap on an Obligation to verify. Enter the token given to you to confirm that the product/service have be received' :
                      'Add a photo or video proof of each delivery (required) or attendance (recommended) — your GPS location is recorded — then generate its token. Give the token to the buyer once done',
                      style: TextStyle(
                        color: AppColor.amber,
                        fontFamily: 'Almarai',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ): Expanded(
        child: Center(
          child: NoticeTile(
            width: width,
            richText: Text.rich(
                TextSpan(
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  children: [
                    TextSpan(
                      text: "Tap on ",
                      style: TextStyle(
                        color: AppColor.amber,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'an ',
                      style: TextStyle(
                        color: AppColor.amber,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: "Obligation to Verify",
                      style: TextStyle(
                        color: AppColor.amber,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' a Product/Service has been Received',
                      style: TextStyle(
                        color: AppColor.amber,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ]
                )
            ),
          ),
        ),
      ),
      Column(
        children: [
          !userIsBuyer(currentUser, transaction)?
          PrimaryButton(
              title: 'Generate Tokens',
              onTap: () {
                context.read<TransactionDetailsBloc>().add(TransactionDetailsEvent.init(transaction));
                showTokenModal(
                    context,
                    transaction,
                    state,
                    (obligation, updated) => context.read<TransactionDetailsBloc>().add(TransactionDetailsEvent.fulfillTransactionObligation(currentUser, obligation, updated, context, state))
                );
              }
          ): Container(),
        ],
      )
    ],
  );
}


bool userIsBuyer(User user, Transaction transaction) {
  return transaction.userId == user.id;
}
