import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/feedback/retry_error_listener.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/base/base.dart';
import 'package:trust_pay_beta/components/buttons/back_button.dart';
import 'package:trust_pay_beta/components/list_iems/notification_item.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/components/base/dummy_data.dart';
import 'package:trust_pay_beta/main/app/routes.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/presentation/base/progress_indicator.dart';
import 'package:trust_pay_beta/main/presentation/blocs/transaction/transaction_bloc.dart';
import 'package:trust_pay_beta/main/presentation/blocs/user/user_bloc.dart';
import 'package:trust_pay_beta/main/presentation/views/transaction/view/transaction_details_view.dart';

class NotificationView extends StatelessWidget {
  static const String routeName = '/notifications';
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    Set<String> datesDisplayed = {};

    return Scaffold(
      backgroundColor: AppColor.white,
      body: UserErrorListener(child: Container(
          padding: const EdgeInsets.all(AppSize.s16),
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top),
            Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Notifications',
                          style: appTextBlack18Bold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                const AppBackButton(size: AppSize.s16),
              ],
            ),
            const SizedBox(height: AppSize.s16),
            Expanded(
              child: SingleChildScrollView(
                child: BlocBuilder<UserBloc, UserState>(
                builder: (context, userState) {

                  if(userState.user?.id != null) {
                    context.read<UserBloc>().add(UserEvent.getAllNotifications(userState));
                  }

                  return userState.allNotifications==null?
                    Container(
                      color: AppColor.white,
                      child: const Center(child: AppCircleProgressIndicator())
                    ):
                    Column(
                    children: userState.allNotifications?.length==0?
                    [
                      Image.asset(
                        ImageAssets.no_transactions,
                        width: MediaQuery.of(context).size.width / 2,
                      ),
                      Text('No Notifications', style: appTextGray16Bold),

                    ]:
                    userState.allNotifications?.map((item) {
                      String title = notificationDateParsing(item.date);
                      bool unavailable = datesDisplayed.contains(title);
                      if (!unavailable) {
                        datesDisplayed.add(title);
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          unavailable
                              ? Divider(
                                  color: AppColor.lightGray,
                                  thickness: 1,
                                  height: 1,
                                )
                              : Text(title, style: appTextGray16),
                          const SizedBox(height: AppSize.s8),
                          InkWell(
                            onTap: () => _openNotification(context, item),
                            child: NotificationItem(
                              username: item.user.firstName,
                              image: item.user.profileImage,
                              message: item.message,
                              kind: item.kind,
                              amount: item.transaction?.total.toString(),
                              transaction: item.transaction?.toTransactionInput(),
                              size: width / 7,
                            ),
                          ),
                          const SizedBox(height: AppSize.s8)
                        ],
                      );
                    }).toList()??[],
                );
  },
),
              ),
            )
          ]))),
    );
  }
}

void _openNotification(BuildContext context, dynamic item) {
  if (item.kind == NotificationKind.message) {
    Navigator.pushNamed(
      context,
      Routes.groupChatView,
      arguments: {'id': item.conversationId, 'title': item.transaction?.title},
    );
    return;
  }

  if (item.transaction != null) {
    Navigator.pushNamed(
      context,
      Routes.transactionsDetails,
      arguments: TransactionDetailsViewArguments(
        transaction: item.transaction,
        viewType: TransactionDetailsViewState.details,
      ),
    );
  }
}

String notificationDateParsing(DateTime date) {
  DateTime today = DateTime.now();
  DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));
  int dayOfTheWeek = date.weekday;

  if (date.day == today.day &&
      date.month == today.month &&
      date.year == today.year) {
    return "Today";
  }
  if (date.day == yesterday.day &&
      date.month == yesterday.month &&
      date.year == yesterday.year) {
    return "Yesterday";
  }

  switch (dayOfTheWeek) {
    case 1:
      return 'Mon, ${date.day} ${getMonth(date.month)}';
    case 2:
      return 'Tue, ${date.day} ${getMonth(date.month)}';
    case 3:
      return 'Wed, ${date.day} ${getMonth(date.month)}';
    case 4:
      return 'Thu, ${date.day} ${getMonth(date.month)}';
    case 5:
      return 'Fri, ${date.day} ${getMonth(date.month)}';
    case 6:
      return 'Sat, ${date.day} ${getMonth(date.month)}';
    default:
      return 'Sun, ${date.day} ${getMonth(date.month)}';
  }
}

getMonth(int month) {
  switch (month) {
    case 1:
      return 'Jan';
    case 2:
      return 'Feb';
    case 3:
      return 'Mar';
    case 4:
      return 'Apr';
    case 5:
      return 'May';
    case 6:
      return 'Jun';
    case 7:
      return 'Jul';
    case 8:
      return 'Aug';
    case 9:
      return 'Sept';
    case 10:
      return 'Oct';
    case 11:
      return 'Nov';
    default:
      return 'Dec';
  }
}
