import 'package:flutter/material.dart';

import '../model/news_article_model.dart';
import '../repository/api_repository.dart';
import '../shared/constants/constants.dart';
import '../shared/helper/utility.dart';

class HomeProvider with ChangeNotifier {
  ApiRepository apiService = ApiRepository();

  Future<NewsArticleModel> fetchNews() async {

    var queryParams = {
      Constants.apiKeyText: Utility.getNewsApi(),
    };
    final response = await apiService.get(
        endPoint: Constants.newsEndpoint, queryParameters: queryParams);


    if (response["status"] == 'OK') {

      return NewsArticleModel.fromJson(response);
    } else {
      throw Exception('Failed to load news');
    }
  }
}
