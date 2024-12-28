import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/main/domain/entities/base/failures.dart';

void toast({required String message, Color? color}) {
  Fluttertoast.showToast(
    gravity: ToastGravity.TOP,
    webBgColor: "white",
    textColor: color??AppColor.red,
    fontSize: FontSize.s14,
    backgroundColor: AppColor.lightGray,
    toastLength: Toast.LENGTH_LONG,
    msg: message
  );
}

void toastFailure(Failure failure) {
  Fluttertoast.showToast(
    gravity: ToastGravity.TOP,
    webBgColor: "white",
    fontSize: FontSize.s14,
    backgroundColor: AppColor.lightGray,
    toastLength: Toast.LENGTH_LONG,
    msg: failure.message
  );
}

