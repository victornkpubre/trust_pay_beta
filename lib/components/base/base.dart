import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trust_pay_beta/components/base/app_string.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';

/// Shared across the app — the currency symbol shown for an amount, based on
/// which wallet/transaction it belongs to. NGN and GBP only, for now.
String currencySymbolFor(String currency) => currency == 'GBP' ? '£' : '₦';

String getIcon(TransactionType type) {
  switch (type) {
    case TransactionType.billSplitter:
      return IconAssets.billSplitter;
    case TransactionType.betsWagers:
      return IconAssets.betsWager;
    case TransactionType.groupGoals:
      return IconAssets.groupSavings;
    case TransactionType.moneyPool:
      return IconAssets.moneyPool;
    case TransactionType.secureSales:
      return IconAssets.buyAndSell;
    default:
      return IconAssets.buyAndSell;
  }
}

String getTitle(TransactionType type) {
  switch (type) {
    case TransactionType.billSplitter:
      return AppString.splitter;
    case TransactionType.betsWagers:
      return AppString.bets;
    case TransactionType.groupGoals:
      return AppString.group;
    case TransactionType.moneyPool:
      return AppString.pool;
    case TransactionType.secureSales:
      return AppString.sales;
    default:
      return AppString.sales;
  }
}

String getTransactionName(TransactionType type) {
  switch (type) {
    case TransactionType.billSplitter:
      return "Bills";
    case TransactionType.betsWagers:
      return "Bets";
    case TransactionType.groupGoals:
      return "Goals";
    case TransactionType.moneyPool:
      return "Pools";
    case TransactionType.secureSales:
      return "Trades";
    default:
      return "Trades";
  }
}

String getStatsIcon(TransactionStatus type) {
  switch (type) {
    case TransactionStatus.completed:
      return SvgIconAssets.stats_completed;
    case TransactionStatus.accepted:
      return SvgIconAssets.stats_accepted;
    case TransactionStatus.declined:
      return SvgIconAssets.stats_declined;
    case TransactionStatus.pending:
      return SvgIconAssets.stats_pendingTwo;
    case TransactionStatus.verification:
      return SvgIconAssets.stats_verification;
    default:
      return SvgIconAssets.stats_pendingTwo;
  }
}

String getStatsTitle(TransactionStatus type) {
  switch (type) {
    case TransactionStatus.completed:
      return 'Completed';
    case TransactionStatus.accepted:
      return "Accepted";
    case TransactionStatus.verification:
      return "Verifying";
    case TransactionStatus.declined:
      return "Declined";
    case TransactionStatus.pending:
      return "Pending";
    default:
      return "Pending";
  }
}

String getObligationStatusTitle(ObligationStatus type) {
  switch (type) {
    case ObligationStatus.pending:
      return 'Pending';
    case ObligationStatus.fulfilled:
      return "Fulfilled";
    case ObligationStatus.paid:
      return "Paid";
    case ObligationStatus.verified:
      return "Verified";
    default:
      return "Pending";
  }
}

Color getObligationStatusColor(ObligationStatus type) {
  switch (type) {
    case ObligationStatus.pending:
      return AppColor.yellow;
    case ObligationStatus.fulfilled:
      return AppColor.amber;
    case ObligationStatus.paid:
      return AppColor.green;
    case ObligationStatus.verified:
      return AppColor.green;
    default:
      return AppColor.amber;
  }
}

String getObligationStatusIcon(ObligationStatus type) {
  switch (type) {
    case ObligationStatus.pending:
      return SvgIconAssets.stats_pending;
    case ObligationStatus.fulfilled:
      return SvgIconAssets.stats_pendingTwo;
    case ObligationStatus.paid:
      return SvgIconAssets.stats_completed;
    case ObligationStatus.verified:
      return SvgIconAssets.stats_verification;
    default:
      return SvgIconAssets.stats_pending;
  }
}

Color getObligationBackgroundColor(ObligationStatus type) {
  switch (type) {
    case ObligationStatus.pending:
      return AppColor.lightGray;
    case ObligationStatus.fulfilled:
      return AppColor.pink;
    case ObligationStatus.paid:
      return AppColor.lightGreen;
    case ObligationStatus.verified:
      return AppColor.lightGreen;
    default:
      return AppColor.pink;
  }
}

Color getStatsColor(TransactionStatus type) {
  switch (type) {
    case TransactionStatus.completed:
      return AppColor.green;
    case TransactionStatus.accepted:
      return AppColor.fontBlue;
    case TransactionStatus.verification:
      return AppColor.green;
    case TransactionStatus.declined:
      return AppColor.lightRed;
    case TransactionStatus.pending:
      return AppColor.amber;
    default:
      return AppColor.amber;
  }
}

Color getBackgroundColor(TransactionStatus type) {
  switch (type) {
    case TransactionStatus.completed:
      return AppColor.lightGreen;
    case TransactionStatus.accepted:
      return AppColor.lightGreen;
    case TransactionStatus.verification:
      return AppColor.lightGreen;
    case TransactionStatus.declined:
      return AppColor.redAccent;
    case TransactionStatus.pending:
      return AppColor.pink;
    default:
      return AppColor.pink;
  }
}

double computePercentageComplete(User? user) {
  final completed = user?.userStatistics?.completed??0;
  final all = user?.userStatistics?.allTransactions??1;
  final result = all==0?0.0:completed/all;
  return result;
}

// currency defaults to NGN so every existing call site keeps its exact
// current output unless it explicitly opts in to a different currency.
String parseAmount(int subAmount, [String currency = 'NGN']) {
  List<String> amount = [];
  int count = 0;
  List<String> charArray = subAmount.toString().split('');
  for (var element in charArray.reversed) {

    if (count % 3 == 0 && count>0) {
      if(charArray.indexOf(element) != charArray.length-1) {
        amount.add(',');
      }
      count = 1;
    }
    else {
      count++;
    }

    amount.add(element);
  }
  return "${currencySymbolFor(currency)}${amount.reversed.join()}";
}

String parseAmountDouble(double subAmount, [String currency = 'NGN']) {
  List<String> amount = [];
  int count = 0;
  List<String> charArray = subAmount.toStringAsFixed(2).toString().split('');

  for (var element in charArray.reversed) {
    if(element.compareTo('.') == 0){
      count = 0;
    }
    else {
      if (count % 3 == 0 && count>0) {
        if(charArray.indexOf(element) != charArray.length-1) {
          amount.add(',');
        }
        count = 1;
      }
      else {
        count++;
      }
    }
    amount.add(element);
  }
  return "${currencySymbolFor(currency)}${amount.reversed.join()}";
}

String parseDate(DateTime datetime) {
  return "${datetime.day}-${datetime.month}-${datetime.year}";
}

String parseTime(DateTime datetime) {
  return "${DateFormat('HH:mm').format(datetime)}${datetime.hour > 12 ? 'PM' : 'AM'}";
}

String parseDateSecondary(DateTime datetime) {
  return "${datetime.day} ${months[datetime.month-1]}, ${datetime.year}";
}

String parseDateMonthYear(DateTime datetime) {
  return "${months[datetime.month-1]}, ${datetime.year}";
}

parseDateTimeLapse(DateTime datetime) {
  Duration duration = DateTime.now().difference(datetime);
  String result = '0min';

  if (duration.inDays > 0) {
    return "${duration.inDays}d";
  }
  if (duration.inHours > 0) {
    return "${duration.inHours}hr";
  }
  if (duration.inMinutes > 0) {
    return "${duration.inMinutes}m";
  }

  return result;
}

List<String> months = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec",
];