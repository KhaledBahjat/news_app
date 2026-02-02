import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/style/app_text_style.dart';
import 'package:news_app/core/widgets/spacing.dart';
import 'package:news_app/features/home/widgets/articel_card_widget.dart';
import 'package:news_app/features/home/widgets/custom_category_item_widget.dart';
import 'package:news_app/features/home/widgets/top_headline_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              iconSize: 30.w,
              color: Color(0xff231F20),
            ),
          ],
        ),
        body: Column(
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
                    ),
                    CustomCategoryItemWidget(
                      title: 'Technology',
                    ),
                    CustomCategoryItemWidget(
                      title: 'Business',
                    ),
                    CustomCategoryItemWidget(
                      title: 'Entertainment',
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
                    title: 'Top Headline',
                    author: 'John Doe',
                    imageUrl:
                        'https://ichef.bbci.co.uk/images/ic/624x351/p0gdcnjt.jpg',
                    date: '2023-01-01',
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
                      children: List.generate(5, (index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 24.h),
                          child: ArticelCardWidget(
                            title: 'Latest News Headline $index',
                            author: 'Author $index',
                            imageUrl:
                                'https://ichef.bbci.co.uk/images/ic/624x351/p0gdcnjt.jpg',
                            date: '2023-01-0${index + 2}',
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
