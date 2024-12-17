import 'package:flutter/material.dart';
import 'package:sample_app_flutter/view/widgets/snack_bar.dart';

import '../main.dart';
import '../model/news_article_model.dart';
import '../repository/api_repository.dart';
import '../shared/constants/constants.dart';
import '../shared/helper/utility.dart';

class HomeProvider with ChangeNotifier {
  ApiRepository apiService = ApiRepository();

  final Utility _utility = Utility();

  Future<bool> isInternetConnected() async {
    return await _utility.isInternetConnected();
  }

  // fetch news
  Future<NewsArticleModel> fetchNews() async {
    if (await isInternetConnected()) {
      var queryParams = {
        Constants.apiKeyText: Utility.getNewsApi(),
      };
      final response = await apiService.get(
        endPoint: Constants.newsEndpoint,
        queryParameters: queryParams,
      );

      if (response["status"] == 'OK') {
        return NewsArticleModel.fromJson(response);
      } else {
        throw Exception('Failed to load news');
      }
    } else {
      showSnackBar(
        appNavigatorKey.currentContext!,
        Constants.noInternetConnectionText,
      );

      throw Exception('No internet connection');
    }
  }

}
