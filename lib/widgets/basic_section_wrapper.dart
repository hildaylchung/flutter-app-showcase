// Flutter imports:
import 'package:flutter/material.dart';

class BasicSectionWrapper extends StatelessWidget {
  final Widget? child;
  const BasicSectionWrapper({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12, offset: Offset(1, 1), blurRadius: 4)
            ],
            borderRadius: BorderRadius.circular(8)),
        child: child);
  }
}
