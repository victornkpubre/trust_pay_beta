import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/style/colors.dart';
import 'package:trust_pay_beta/components/style/decoration.dart';

class AppCarousel extends StatefulWidget {
  final double height;
  final Color color;
  final double? width;
  final bool autoplay;
  final double viewportFraction;
  final List<Widget> children;
  final Decoration? decoration;

  const AppCarousel(
      {super.key, required this.height, this.width, required this.children, required this.color, required this.viewportFraction, this.autoplay=true, this.decoration});

  @override
  State<AppCarousel> createState() => _AppCarouselState();
}

class _AppCarouselState extends State<AppCarousel> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      color: widget.color,
      child: Column(
        children: [
          const SizedBox(height: AppSize.s16),
          Container(
            decoration: widget.decoration,
            child: SizedBox(
              height: widget.height,
              width: widget.width ?? double.infinity,
              child: CarouselSlider(
                items: widget.children,
                options: CarouselOptions(
                  enlargeCenterPage: false,
                  autoPlay: widget.autoplay,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: widget.viewportFraction,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSize.s14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.children.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Container(
                  width: AppSize.s10,
                  height: AppSize.s10,
                  decoration: BoxDecoration(
                      color: index == currentPage
                          ? AppColor.primary
                          : AppColor.white,
                      border: Border.all(color: AppColor.primary),
                      borderRadius: BorderRadius.circular(AppSize.s16)),
                ),
              );
            }),
          ),
          const SizedBox(height: AppSize.s8),
        ],
      ),
    );
  }
}
