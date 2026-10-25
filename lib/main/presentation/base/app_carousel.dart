import 'dart:math';

import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trust_pay_beta/components/base/app_sizes.dart';
import 'package:trust_pay_beta/components/style/colors.dart';

class AppCarousel extends StatefulWidget {
  /// The smallest height; the carousel grows when a page needs more room
  /// (e.g. a long title that wraps).
  final double height;
  final Color color;
  final double? width;
  final bool autoplay;
  final double viewportFraction;
  final List<Widget> children;
  final Decoration? decoration;
  final Function(int) onPageChange;

  const AppCarousel(
      {super.key, required this.height, this.width, required this.children, required this.color, required this.viewportFraction, this.autoplay=true, this.decoration, required this.onPageChange});

  @override
  State<AppCarousel> createState() => _AppCarouselState();
}

class _AppCarouselState extends State<AppCarousel> {
  int currentPage = 0;
  // Natural height of each page laid out so far. A page view needs a fixed
  // height, so the carousel uses the tallest of these (at least
  // widget.height) and no page's content gets cut off.
  final Map<int, double> _pageHeights = {};

  double get _height => _pageHeights.values.fold(widget.height, max);

  @override
  void didUpdateWidget(covariant AppCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Different pages (e.g. after a refresh): measure them again.
    if (oldWidget.children.length != widget.children.length) _pageHeights.clear();
  }

  @override
  Widget build(BuildContext context) {
    final height = _height;
    return Container(
      color: widget.color,
      child: Column(
        children: [
          const SizedBox(height: AppSize.s16),
          Container(
            decoration: widget.decoration,
            child: SizedBox(
              height: height,
              width: widget.width ?? double.infinity,
              child: CarouselSlider(
                items: [
                  for (var i = 0; i < widget.children.length; i++)
                    // Lets the page be taller than the carousel (and at least
                    // as tall), and reports how tall it is.
                    OverflowBox(
                      minHeight: height,
                      maxHeight: double.infinity,
                      alignment: Alignment.topCenter,
                      child: _HeightReporter(
                        onHeight: (pageHeight) {
                          if (mounted && _pageHeights[i] != pageHeight) {
                            setState(() => _pageHeights[i] = pageHeight);
                          }
                        },
                        child: widget.children[i],
                      ),
                    ),
                ],
                options: CarouselOptions(
                  height: height,
                  enlargeCenterPage: false,
                  autoPlay: widget.autoplay,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: false,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: widget.viewportFraction,
                  onPageChanged: (index, reason) {
                    final length = widget.children.length;
                    if(index < (length - 1)) {
                      widget.onPageChange(index);
                    }
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

/// Reports its child's height after each layout that changes it.
class _HeightReporter extends SingleChildRenderObjectWidget {
  final ValueChanged<double> onHeight;
  const _HeightReporter({required this.onHeight, required super.child});

  @override
  RenderObject createRenderObject(BuildContext context) => _RenderHeightReporter(onHeight);

  @override
  void updateRenderObject(BuildContext context, _RenderHeightReporter renderObject) {
    renderObject.onHeight = onHeight;
  }
}

class _RenderHeightReporter extends RenderProxyBox {
  ValueChanged<double> onHeight;
  double? _reported;
  _RenderHeightReporter(this.onHeight);

  @override
  void performLayout() {
    super.performLayout();
    final height = size.height;
    if (height != _reported) {
      _reported = height;
      // Not during layout: the carousel rebuilds with the new height.
      WidgetsBinding.instance.addPostFrameCallback((_) => onHeight(height));
    }
  }
}
