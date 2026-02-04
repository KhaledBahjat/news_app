import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routs.dart';
import 'package:news_app/core/style/app_text_style.dart';
import 'package:news_app/core/widgets/spacing.dart';
import 'package:news_app/features/home/models/top_head_line_model.dart';
import 'package:news_app/features/home/services/home_screen_service.dart';
import 'package:news_app/features/home/widgets/articel_card_widget.dart';
import 'package:news_app/features/home/widgets/custom_category_item_widget.dart';
import 'package:news_app/features/home/widgets/search_text_feild_widget.dart';
import 'package:news_app/features/home/widgets/top_headline_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "explore",
            style: AppTextStyles.titlesStyles.copyWith(
              color: Color(0xff231F20),
            ),
          ).tr(),
          toolbarHeight: 68.h,
          backgroundColor: Color(0xffE9EEFA),
          actions: [
            SearchTextFeildWidget(),
          ],
        ),
        body: FutureBuilder(
          future: HomeScreenService().getTopHeadlinesArticles(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Color(0xff231F20),
                ),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            }
            if (snapshot.hasData) {
              ArticlesMoodel topHeadLineModel = snapshot.data as ArticlesMoodel;
              if (topHeadLineModel.articles!.isNotEmpty) {
                return Column(
                  children: [
                    HeightSpace(16),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 32.w),
                      child: SizedBox(
                        height: 40.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          children: [
                            CustomCategoryItemWidget(
                              title: 'Travel',
                              onTap: () => {
                                GoRouter.of(context).pushNamed(
                                  AppRoutes.searchResultScreen,
                                  extra: 'travel'.tr(),
                                ),
                              },
                            ),
                            CustomCategoryItemWidget(
                              title: 'Technology',
                              onTap: () => {
                                GoRouter.of(context).pushNamed(
                                  AppRoutes.searchResultScreen,
                                  extra: 'technology'.tr(),
                                ),
                              },
                            ),
                            CustomCategoryItemWidget(
                              title: 'Business',
                              onTap: () => {
                                GoRouter.of(context).pushNamed(
                                  AppRoutes.searchResultScreen,
                                  extra: 'business'.tr(),
                                ),
                              },
                            ),
                            CustomCategoryItemWidget(
                              title: 'Entertainment',
                              onTap: () => {
                                GoRouter.of(context).pushNamed(
                                  AppRoutes.searchResultScreen,
                                  extra: 'entertainment'.tr(),
                                ),
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    HeightSpace(24),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.w),
                      child: Column(
                        children: [
                          TopHeadlineWidget(
                            title:
                                topHeadLineModel.articles![0].title ??
                                'Top Headline',
                            author:
                                topHeadLineModel.articles![0].author ??
                                'John Doe',
                            imageUrl:
                                topHeadLineModel.articles![0].urlToImage ?? '',
                            date:
                                "${topHeadLineModel.articles![0].publishedAt!.day}-${topHeadLineModel.articles![0].publishedAt!.month}-${topHeadLineModel.articles![0].publishedAt!.year}",
                          ),
                        ],
                      ),
                    ),
                    HeightSpace(40),
                    Expanded(
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32.w),
                            child: Column(
                              children: List.generate(
                                topHeadLineModel.articles!.length,
                                (index) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 24.h),
                                    child: ArticelCardWidget(
                                      title:
                                          topHeadLineModel
                                              .articles![index]
                                              .title ??
                                          'Latest News Headline',
                                      author:
                                          topHeadLineModel
                                              .articles![index]
                                              .author ??
                                          'Author',
                                      imageUrl:
                                          topHeadLineModel
                                              .articles![index]
                                              .urlToImage ??
                                          'https://ichef.bbci.co.uk/images/ic/624x351/p0gdcnjt.jpg',
                                      date:
                                          topHeadLineModel
                                                  .articles![index]
                                                  .publishedAt !=
                                              null
                                          ? "${topHeadLineModel.articles![index].publishedAt!.day}-${topHeadLineModel.articles![index].publishedAt!.month}-${topHeadLineModel.articles![index].publishedAt!.year}"
                                          : 'Unknown Date',
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Text("No articles found").tr(),
                );
              }
            }
            return Center(
              child: Text("Something went wrong").tr(),
            );
          },
        ),
      ),
    );
  }
}
