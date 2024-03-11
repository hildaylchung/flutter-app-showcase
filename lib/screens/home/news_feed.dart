// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:news_api_flutter_package/model/article.dart';

// Project imports:
import 'package:flutter_showcase_riverpod/config.dart';
import '../../utils/news_api.dart';
import '../../utils/url_launch.dart';
import '../../widgets/error.dart';

class NewsFeed extends StatelessWidget {
  final String title;
  final String country;
  const NewsFeed({super.key, required this.title, required this.country});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyle.pageTitle),
        const SizedBox(height: 16),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            constraints: const BoxConstraints(maxHeight: 400, maxWidth: 400),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(1, 1),
                      blurRadius: 4)
                ],
                borderRadius: BorderRadius.circular(8)),
            child: NewsList(country: country)),
      ],
    );
  }
}

class NewsList extends StatelessWidget {
  final String country;
  const NewsList({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getNews(country),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            debugPrint('NewsFeed err: ${snapshot.error}');
            return const Text(errMsgTryAgainLater);
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          List<Article> articles = snapshot.data ?? [];
          return Wrap(
              runSpacing: 10,
              children: articles.map((a) => NewsTile(article: a)).toList());
        });
  }
}

class NewsTile extends StatelessWidget {
  final Article article;

  const NewsTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(article.title ?? '', style: AppTextStyle.contentTitleTight),
      if (article.content != null)
        Text(article.content!, style: AppTextStyle.bodyTight),
      if (article.author != null)
        Row(children: [
          const Spacer(),
          Text('-- ${article.author!}', style: AppTextStyle.strong)
        ])
    ]);
  }
}
