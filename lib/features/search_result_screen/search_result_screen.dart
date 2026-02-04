import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/style/app_text_style.dart';
import 'package:news_app/features/home/models/top_head_line_model.dart';
import 'package:news_app/features/home/widgets/articel_card_widget.dart';
import 'package:news_app/features/search_result_screen/services/search_result_services.dart';
import 'package:news_app/features/search_result_screen/widgets/error_state.dart';

class SearchResultScreen extends StatelessWidget {
  final String query;
  const SearchResultScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'search_result'.tr(),
          style: AppTextStyles.black14SemiBold.copyWith(
            fontSize: 18.sp,
          ),
        ),
      ),
      body: FutureBuilder<ArticlesMoodel>(
        future: SearchResultService().searchItemByName(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            final error = snapshot.error.toString();
            String message = 'something_went_wrong'.tr();
            if (error.contains('EMPTY_QUERY')) {
              message = 'please_enter_search_word'.tr();
            } else if (error.contains('NETWORK_ERROR')) {
              message = 'check_your_internet'.tr();
            }
            return ErrorState(message: message);
          }
          if (!snapshot.hasData || snapshot.data!.articles == null) {
            return ErrorState(
              message: 'no_articles_found'.tr(),
            );
          }
          final articles = snapshot.data!.articles!;
          if (articles.isEmpty) {
            return ErrorState(
              message: 'no_articles_found'.tr(),
            );
          }
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 24.h),
                child: ArticelCardWidget(
                  title: article.title ?? 'Latest News Headline',
                  author: article.author ?? 'Author',
                  imageUrl:
                      article.urlToImage ??
                      'https://ichef.bbci.co.uk/images/ic/624x351/p0gdcnjt.jpg',
                  date: article.publishedAt != null
                      ? "${article.publishedAt!.day}-${article.publishedAt!.month}-${article.publishedAt!.year}"
                      : 'Unknown Date',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
