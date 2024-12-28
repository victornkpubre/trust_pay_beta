import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path/path.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';

class SourceOfTruthTile extends StatelessWidget {
  final String details;
  final String url;
  const SourceOfTruthTile({super.key, required this.details, required this.url});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Assertion",
              textAlign: TextAlign.center,
              style: appTextGray16Bold,
            ),
            const SizedBox(height: AppSize.s4),
            Text(
              details,
              textAlign: TextAlign.center,
              style: appTextBlack18Bold,
            ),
            const SizedBox(height: AppSize.s16),
            Text(
              "Source of Truth",
              textAlign: TextAlign.center,
              style: appTextGray16Bold,
            ),
            const SizedBox(height: AppSize.s4),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.s16, vertical: AppSize.s8),
              decoration: BoxDecoration(
                  color: AppColor.secondary,
                  borderRadius:
                      const BorderRadius.all(Radius.circular(AppSize.s10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(FontAwesomeIcons.link),
                  const SizedBox(width: AppSize.s16),
                  Text(
                    _capitalizeLead(_getUrlName(url)),
                    style: appTextPrimary16Bold,
                  ),
                  const SizedBox(width: AppSize.s16),
                  Text(
                    'View',
                    style: appTextPrimary14Underlined,
                  ),
                  const SizedBox(width: AppSize.s4),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

String _capitalizeLead(String value) {
  return '${value[0].toUpperCase()}${value.substring(1)}';
}

String _getUrlName(String url) {
  if (url.contains('http')) {
    final Uri uri = Uri.parse(url);
    return uri.host.replaceAll('www.', '');
  } else {
    return basename(url);
  }
}
