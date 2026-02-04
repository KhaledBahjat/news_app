import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/style/app_text_style.dart';

class CustomCategoryItemWidget extends StatelessWidget {
  const CustomCategoryItemWidget({super.key, required this.title, required this.onTap});
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: InkWell(
        borderRadius: BorderRadius.circular(56.r),
        splashColor: Color(0xffE9EEFA),
        onTap: onTap,
        child: Container(
          height: 32.h,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 6.h,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 3.w,
              color: Color(0xffE9EEFA),
            ),
            borderRadius: BorderRadius.circular(56.r),
            color: Colors.transparent,
          ),
          child: Text(
            title,
            style: AppTextStyles.black14SemiBold,
          ),
        ),
      ),
    );
  }
}
