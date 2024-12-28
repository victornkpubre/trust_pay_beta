
import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/text.dart';

class SelectedWebsiteTile extends StatelessWidget {
  final String? image;
  final String url;
  final String title;
  final bool selected;
  const SelectedWebsiteTile({
    super.key, this.image, required this.url, required this.title, required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColor.secondary,
                  shape: BoxShape.circle
                ),
                child: const SizedBox(
                  height: 28,
                  width: 28,
                ),
              ),
              const SizedBox(width: 10),
                                
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: appTextBlack16Bold
                  ),
                  Text(url, style: appTextGray14),
                ],
              ),
            ],
          ),
        ),
    
        Container(
          decoration: BoxDecoration(
            color: !selected?Colors.transparent: AppColor.primary,
            shape: BoxShape.circle,
            border: Border.all(color: AppColor.primary)
          ),
          padding: EdgeInsets.all(4),
          child: Opacity(
            opacity: !selected? 0: 1,
            child: Icon(
              Icons.check,
              color: AppColor.white,
              size: 16
            ),
          ),
        )
      ],
    );
  }
}

