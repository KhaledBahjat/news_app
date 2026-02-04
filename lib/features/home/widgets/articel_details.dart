import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/style/app_text_style.dart';
import 'package:news_app/core/widgets/spacing.dart';
import 'package:news_app/features/home/models/top_head_line_model.dart';

class ArticelDetails extends StatelessWidget {
  const ArticelDetails({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            SizedBox(
              width: 430.w,
              height: 316.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.network(
                  article.urlToImage ?? '',
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.broken_image,
                        size: 50,
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              top: 250.h,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                padding: EdgeInsets.only(top: 24.h, left: 16.w, right: 16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title ?? '',
                      style: AppTextStyles.titlesStyles.copyWith(
                        fontSize: 18.sp,
                        color: Colors.black,
                      ),
                    ),
                    HeightSpace(16),
                    Text(
                      "${article.author ?? 'Unknown Author'} . ${article.publishedAt!.year}-${article.publishedAt!.month}-${article.publishedAt!.day}",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                    ),
                    HeightSpace(24),
                    SingleChildScrollView(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 32.w,
                        child: Text(
                          article.description ?? 'No Content Available',
                          style: AppTextStyles.grey14Regular.copyWith(
                            fontSize: 16.sp,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
