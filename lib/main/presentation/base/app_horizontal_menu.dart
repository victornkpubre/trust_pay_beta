import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';

class AppHorizontalMenu extends StatelessWidget {
  final double itemSize;
  final List<Widget> items;
  const AppHorizontalMenu({super.key, required this.items, required this.itemSize});

  @override
  Widget build(BuildContext context) {
    // Not a fixed-height ListView: the row is as tall as its tallest item
    // (an item grows when its title wraps), and every item matches it.
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: itemSize),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final item in items) ...[item, const SizedBox(width: AppSize.s16)],
            ],
          ),
        ),
      ),
    );
  }
}
