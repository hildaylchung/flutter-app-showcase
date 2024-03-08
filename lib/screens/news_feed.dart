// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

// Project imports:
import '../config.dart';
import '../provider/user.dart';

class NewsFeed extends ConsumerWidget {
  const NewsFeed({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? user = ref.watch(globalUserProvider).user;
    final now = DateTime.now();
    final greeting = now.hour < 12
        ? 'Morning'
        : now.hour >= 18
            ? 'Evening'
            : 'Afternoon';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$greeting ${user?.name ?? 'Guest'}!',
                style: AppTextStyle.twoLineTitle),
            Text(DateFormat('MMMM d').format(now),
                style: AppTextStyle.twoLineTitle)
          ],
        )
      ]),
    );
  }
}
