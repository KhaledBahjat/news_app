import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/style/app_text_style.dart';
import 'package:news_app/core/widgets/spacing.dart';

class TopHeadlineWidget extends StatelessWidget {
  const TopHeadlineWidget({
    super.key,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.date,
  });
  final String title;
  final String author;
  final String imageUrl;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: imageUrl == ''
                ? Image.asset(
                    'assets/image/breakin_news.avif',
                    height: 206.h,
                    fit: BoxFit.fill,
                  )
                : CachedNetworkImage(
                    imageUrl: imageUrl,
                    height: 206.h,
                    fit: BoxFit.fill,
                  ),
          ),
        ),
        HeightSpace(16),
        Text(
          title,
          style: AppTextStyles.titlesStyles.copyWith(fontSize: 18.sp),
        ),
        HeightSpace(12),
        Text('By $author • $date', style: AppTextStyles.grey14Regular),
      ],
    );
  }
}
