import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routs.dart';
import 'package:news_app/core/widgets/spacing.dart';
import 'package:news_app/features/home/models/top_head_line_model.dart';

class ArticelCardWidget extends StatelessWidget {
  const ArticelCardWidget({
    super.key,
    required this.article,
  });
  final Article article;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(
          context,
        ).pushNamed(AppRoutes.articleDetailsScreen, extra: article);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title ?? 'No Title',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                HeightSpace(8),
                Text(
                  'By ${article.author ?? 'Unknown Author'} · ${article.publishedAt ?? 'Unknown Date'}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? '',
              width: 112.w,
              height: 80.h,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                width: 112.w,
                height: 80.h,
                alignment: Alignment.center,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              errorWidget: (context, url, error) => Image.network(
                'https://ichef.bbci.co.uk/images/ic/624x351/p0gdcnjt.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
