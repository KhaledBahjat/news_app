import 'package:news_app/core/constant/app_constant.dart';
import 'package:news_app/core/networking/api_endpont.dart';
import 'package:news_app/core/networking/dio_helper.dart';
import 'package:news_app/features/home/models/top_head_line_model.dart';

class HomeScreenService {
  Future<ArticlesMoodel> getTopHeadlinesArticles() async {
    try {
      var response = await DioHelper.getRequest(
        endpoint: ApiEndpont.topHeadlinesEndpoint,
        query: {
          "apiKey": AppConstant.newsApiKey,
          "country": "us",
          "lang": AppConstant.lang,
        },
      );
      if (response.statusCode == 200) {
        ArticlesMoodel topHeadLineModel = ArticlesMoodel.fromJson(
          response.data,
        );
        return topHeadLineModel;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    throw Exception("Failed to load articles");
  }
}
