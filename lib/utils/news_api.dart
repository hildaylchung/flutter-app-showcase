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

Future<List<Article>?> getNews({String? country}) async {
  try {
    // await NewsAPICaller.instance
    //     .getTopHeadlines(country: country, pageSize: defaultPageSize);
    // Note: getTopHeadlines api for country is not working outside us for now
    // you can test with: https://newsapi.org/v2/top-headlines?country=gb&apiKey=
    return await NewsAPICaller.instance.getTopHeadlines(
        country: country,
        sources: country == null ? 'bbc-news' : null,
        pageSize: defaultPageSize);
  } catch (err) {
    print(err);
    return null;
  }
}
