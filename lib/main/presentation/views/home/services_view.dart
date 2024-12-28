import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/buttons/back_button.dart';
import 'package:trust_pay_beta/components/buttons/quick_menu_btn.dart';
import 'package:trust_pay_beta/components/data_cards/transaction_stats_card.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/image_manager.dart';
import 'package:trust_pay_beta/components/style/text.dart';
import 'package:trust_pay_beta/main/domain/entities/entities.dart';
import 'package:trust_pay_beta/main/presentation/base/app_carousel.dart';

class ServicesView extends StatelessWidget {
  static const String routeName = '/services';
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top),
            const SizedBox(height: AppSize.s16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
              child: Stack(
                children: [
                  const AppBackButton(size: AppSize.s16),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Services',
                            style: appTextBlack18Bold,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSize.s8),
            Expanded( child: SingleChildScrollView(
            child: Column(
      children: [
        AppCarousel(
          height: height / 3,
          viewportFraction: 0.8,
          color: AppColor.secondary,
          children: TransactionType.values.map((type) {
            return TransactionStatsCard(
                width: MediaQuery.of(context).size.width,
                percentageComplete: 0.8,
                type: type,
                transactions: 12,
                successful: 10,
                pending: 1
                );
          }).toList(),
        ),
        const SizedBox(height: AppSize.s16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Services'),
                const SizedBox(height: AppSize.s4),
                Wrap(
                  runSpacing: AppSize.s8,
                  spacing: AppSize.s10,
                  children: TransactionType.values
                      .map((type) => QuickMenuButton(
                            size: width / 4.5,
                            color: AppColor.secondary,
                            onTap: () {},
                            type: type,
                          ))
                      .toList(),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSize.s16),
        Image.asset(
          ImageAssets.banner,
          width: width,
        )
      ],
              )))
            ]),
    );
  }
}
