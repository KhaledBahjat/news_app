import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routs.dart';

class SearchTextFeildWidget extends StatefulWidget {
  const SearchTextFeildWidget({super.key});

  @override
  State<SearchTextFeildWidget> createState() => _SearchTextFeildWidgetState();
}

class _SearchTextFeildWidgetState extends State<SearchTextFeildWidget> {
  bool showTextForm = false;
  @override

  Widget build(BuildContext context) {
    return Row(
      children: [
        showTextForm
            ? SizedBox(
                width: 200.w,
                child: TextField(
                  onSubmitted: (value) {
                    log('value: $value');
                    GoRouter.of(context).pushNamed(AppRoutes.searchResultScreen,
                        extra: value);
                  },
                  decoration: InputDecoration(
                    hintText: 'search'.tr(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        color: Color(0xff231F20),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        color: Color(0xff231F20),
                      ),
                    ),
                    hintStyle: TextStyle(
                      color: Color(0xff231F20),
                      fontSize: 16.sp,
                    ),
                  ),
                  style: TextStyle(
                    color: Color(0xff231F20),
                    fontSize: 16.sp,
                  ),
                  cursorColor: Color(0xff231F20),
                ),
              )
            : SizedBox.shrink(),
        IconButton(
          onPressed: () {
            setState(() {
              showTextForm = !showTextForm;
            });
          },
          icon: Icon(Icons.search),
          iconSize: 30.w,
          color: Color(0xff231F20),
        ),
      ],
    );
  }
}
