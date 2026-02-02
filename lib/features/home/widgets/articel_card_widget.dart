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
          child: Image.network(
            imageUrl,
            width: 112.w,
            height: 80.h,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
