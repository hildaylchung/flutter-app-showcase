// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:flutter_showcase_riverpod/provider/news.dart';
import '../../config.dart';
import '../../provider/user.dart';
import 'home/news_feed.dart';

class HomeTab extends ConsumerWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? user = ref.watch(globalUserProvider).user;
    final now = DateTime.now();
    final greeting = now.hour < 12
        ? 'Morning'
        : now.hour >= 18
            ? 'Evening'
            : 'Afternoon';

    /// fetching news outside the newsFeed section to prevent fetch several times
    final NewsState newsState = ref.watch(newsProvider);
    if (newsState.lastFetched == null) {
      ref.watch(newsProvider.notifier).fetchAllNews();
    }

    return ListView(padding: EdgeInsets.zero, children: [
      Stack(children: [
        Positioned(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 180,
                color: Colors.blue)),
        Container(
          padding: EdgeInsets.only(
              left: 16, right: 16, top: MediaQuery.of(context).padding.top),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('$greeting ${user?.name ?? 'Guest'}!',
                style: AppTextStyle.twoLineTitle),
            Text(DateFormat('MMMM d').format(now),
                style: AppTextStyle.twoLineTitle),

            const SizedBox(height: 12),

            // uk news
            const NewsFeed(country: NewsCountry.gb),

            const SizedBox(height: 16),

            // hk news
            const NewsFeed(country: NewsCountry.hk)
          ]),
        ),
      ]),
    ]);
  }
}
