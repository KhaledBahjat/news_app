import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/widgets/spacing.dart';

class ArticelCardWidget extends StatelessWidget {
  const ArticelCardWidget({
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              HeightSpace(8),
              Text(
                'By $author · $date',
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
            imageUrl: imageUrl,
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
    );
  }
}
