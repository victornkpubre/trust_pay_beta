import 'package:flutter/material.dart';

class FAB extends StatelessWidget {
  const FAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/catalogue');
      },
      child: const Icon(Icons.settings, color: Colors.amber),
    );
  }
}
