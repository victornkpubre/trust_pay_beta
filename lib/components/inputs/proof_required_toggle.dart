import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/inputs/app_toggle_input.dart';
import 'package:trust_pay_beta/components/style/text.dart';

/// Lets the creator choose whether photo/video proof (with GPS) is required
/// for this transaction. [description] says what it is required for.
class ProofRequiredToggle extends StatelessWidget {
  final bool value;
  final String description;
  final Function(bool) onChanged;
  const ProofRequiredToggle({super.key, required this.value, required this.description, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Require photo/video proof', style: appTextPrimary16Bold),
            const SizedBox(height: AppSize.s4),
            Text(description, style: appTextGray14),
          ]),
        ),
        const SizedBox(width: AppSize.s8),
        AppToggle(initialValue: value, onToggle: onChanged),
      ],
    );
  }
}
