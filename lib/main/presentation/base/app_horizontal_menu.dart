import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';

class AppHorizontalMenu extends StatelessWidget {
  final double itemSize;
  final List<Widget> items;
  const AppHorizontalMenu({super.key, required this.items, required this.itemSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itemSize,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Row(
              children: [items[index], const SizedBox(width: AppSize.s16)],
            );
          }),
    );
  }
}
