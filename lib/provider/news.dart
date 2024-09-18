// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_api_flutter_package/model/article.dart';

// Project imports:
import '../utils/news_api.dart';

enum NewsCountry {
  gb,
  us,
}

extension CountryToStringExtension on NewsCountry {
  String get fullname {
    switch (this) {
      case NewsCountry.gb:
        return 'UK';
      case NewsCountry.us:
        return 'The State';
      default:
        return '';
    }
  }
}

class NewsState {
  List<Article>? bbcNews;
  List<Article>? ukNews;
  List<Article>? usNews;

  DateTime? lastFetched;

  NewsState({this.ukNews, this.usNews, this.bbcNews, this.lastFetched});

  bool get needRefetch =>
      lastFetched != null &&
      DateTime.now().isAfter(lastFetched!.add(const Duration(minutes: 10)));

  NewsState copyWith(
      {List<Article>? ukNews,
      List<Article>? usNews,
      List<Article>? bbcNews,
      DateTime? lastFetched}) {
    return NewsState(
        ukNews: ukNews ?? this.ukNews,
        usNews: usNews ?? this.usNews,
        bbcNews: bbcNews ?? this.bbcNews,
        lastFetched: lastFetched ?? this.lastFetched);
  }

  List<Article>? operator [](NewsCountry cn) {
    switch (cn) {
      case NewsCountry.us:
        return usNews;
      case NewsCountry.gb:
        return ukNews;
    }
  }
}

class NewsStateNotifier extends Notifier<NewsState> {
  @override
  NewsState build() => NewsState();

  void fetchAllNews() async {
    final usArticles = await getNews(country: NewsCountry.us.name);
    final bbcArticles = await getNews();
    state = state.copyWith(
        bbcNews: bbcArticles, usNews: usArticles, lastFetched: DateTime.now());
  }
}

final newsProvider =
    NotifierProvider<NewsStateNotifier, NewsState>(NewsStateNotifier.new);
