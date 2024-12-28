import 'package:flutter/material.dart';

class CountdownTile extends StatelessWidget {
  final double? width;
  final int days;
  final int hours;
  final int minutes;
  const CountdownTile({super.key, required this.days, required this.hours, required this.minutes, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: width??225,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            decoration: ShapeDecoration(
              color: const Color(0xFFF9EFFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x194D4C4C),
                  blurRadius: 2,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                )
              ],
            ),
            
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '$days',
                      style: const TextStyle(
                        color: Color(0xFF531D75),
                        fontSize: 36,
                        fontFamily: 'Almarai',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Text(
                      'Days',
                      style: TextStyle(
                        color: Color(0xFF531D75),
                        fontSize: 12,
                        fontFamily: 'Almarai',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                const Text(
                  ':',
                  style: TextStyle(
                    color: Color(0xFF531D75),
                    fontSize: 36,
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '$hours',
                      style: const TextStyle(
                        color: Color(0xFF531D75),
                        fontSize: 36,
                        fontFamily: 'Almarai',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Text(
                      'Hours',
                      style: TextStyle(
                        color: Color(0xFF531D75),
                        fontSize: 12,
                        fontFamily: 'Almarai',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                const Text(
                  ':',
                  style: TextStyle(
                    color: Color(0xFF531D75),
                    fontSize: 36,
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '$minutes',
                      style: const TextStyle(
                        color: Color(0xFF531D75),
                        fontSize: 36,
                        fontFamily: 'Almarai',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Text(
                      'Minutes',
                      style: TextStyle(
                        color: Color(0xFF531D75),
                        fontSize: 12,
                        fontFamily: 'Almarai',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}