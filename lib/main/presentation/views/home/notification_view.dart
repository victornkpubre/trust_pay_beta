import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/back_button.dart';
import 'package:trust_pay_beta/components/list_iems/notification_item.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/presentation/base/dummy_data.dart';

class NotificationView extends StatelessWidget {
  static const String routeName = '/notifications';
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    Set<String> datesDisplayed = {};

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Container(
          padding: const EdgeInsets.all(AppSize.s16),
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            const SizedBox(height: AppSize.s16),
            Stack(
              children: [
                const AppBackButton(size: AppSize.s16),
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
              ],
            ),
            const SizedBox(height: AppSize.s16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: userNotifications.map((item) {
                    String title = notificationDateParsing(item.createdAt);
                    bool unavaliable = datesDisplayed.contains(title);
                    if (!unavaliable) {
                      datesDisplayed.add(title);
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        unavaliable
                            ? Divider(
                                color: AppColor.lightGray,
                                thickness: 1,
                                height: 1,
                              )
                            : Text(title, style: appTextGray16),
                        const SizedBox(height: AppSize.s8),
                        NotificationItem(
                          username: item.username,
                          image: item.image,
                          amount: item.amount,
                          createdAt: item.createdAt,
                          transaction: item.transaction,
                          size: width / 7,
                        ),
                        const SizedBox(height: AppSize.s8)
                      ],
                    );
                  }).toList(),
                ),
              ),
            )
          ])),
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
