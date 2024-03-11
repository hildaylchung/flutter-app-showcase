// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_api_flutter_package/model/article.dart';
import 'package:news_api_flutter_package/news_api_flutter_package.dart';

/// Make use of the News API for getting news
/// https://newsapi.org/docs/endpoints
const defaultPageSize = 3;

class NewsAPICaller {
  static final NewsAPI _instance = NewsAPICaller.init();

  static NewsAPI get instance => _instance;

  static init() {
    final String? apiKey = dotenv.env['NEWS_API_KEY'];
    if (apiKey == null) {
      debugPrint('Fail to get api key');
      return null;
    }
    return NewsAPI(apiKey);
  }
}

Future<List<Article>?> getNews(String country) async {
  return await NewsAPICaller.instance
      .getTopHeadlines(country: country, pageSize: defaultPageSize);
}
