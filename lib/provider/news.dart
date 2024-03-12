// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_api_flutter_package/model/article.dart';

// Project imports:
import '../utils/news_api.dart';

enum NewsCountry {
  gb,
  hk,
}

extension CountryToStringExtension on NewsCountry {
  String get fullname {
    switch (this) {
      case NewsCountry.gb:
        return 'UK';
      case NewsCountry.hk:
        return 'Hong Kong';
      default:
        return '';
    }
  }
}

class NewsState {
  List<Article>? ukNews;
  List<Article>? hkNews;

  DateTime? lastFetched;

  NewsState({this.ukNews, this.hkNews, this.lastFetched});

  bool get needRefetch =>
      lastFetched != null &&
      DateTime.now().isAfter(lastFetched!.add(const Duration(minutes: 10)));

  NewsState copyWith(
      {List<Article>? ukNews, List<Article>? hkNews, DateTime? lastFetched}) {
    return NewsState(
        ukNews: ukNews ?? this.ukNews,
        hkNews: hkNews ?? this.hkNews,
        lastFetched: lastFetched ?? this.lastFetched);
  }

  List<Article>? operator [](NewsCountry cn) {
    switch (cn) {
      case NewsCountry.hk:
        return hkNews;
      case NewsCountry.gb:
        return ukNews;
    }
  }
}

class NewsStateNotifier extends Notifier<NewsState> {
  @override
  NewsState build() => NewsState();

  void fetchAllNews() async {
    final hkArticles = await getNews(NewsCountry.hk.name);
    final ukArticles = await getNews(NewsCountry.gb.name);

    state = state.copyWith(
        ukNews: ukArticles, hkNews: hkArticles, lastFetched: DateTime.now());
  }
}

final newsProvider =
    NotifierProvider<NewsStateNotifier, NewsState>(NewsStateNotifier.new);
