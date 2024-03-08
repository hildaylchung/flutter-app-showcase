// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import '../config.dart';
import '../provider/user.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? user = ref.watch(globalUserProvider).user;
    return Scaffold(
        body: ListView(
      children: [
        Text('Hi ${user?.name ?? 'Guest'}!', style: AppTextStyle.pageTitle)
      ],
    ));
  }
}
