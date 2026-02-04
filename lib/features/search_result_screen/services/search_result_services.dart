import 'package:news_app/core/constant/app_constant.dart';
import 'package:news_app/core/networking/api_endpont.dart';
import 'package:news_app/core/networking/dio_helper.dart';
import 'package:news_app/features/home/models/top_head_line_model.dart';

class SearchResultService {
  Future<ArticlesMoodel> searchItemByName(String query) async {
    if (query.trim().isEmpty) {
      throw Exception('EMPTY_QUERY');
    }

    try {
      final response = await DioHelper.getRequest(
        endpoint: ApiEndpont.searchEndpoint,
        query: {
          "apiKey": AppConstant.newsApiKey,
          "q": query,
          "language": AppConstant.lang,
        },
      );

      if (response.statusCode == 200) {
        return ArticlesMoodel.fromJson(response.data);
      } else {
        throw Exception('SERVER_ERROR');
      }
    } catch (e) {
      throw Exception('NETWORK_ERROR');
    }
  }
}
