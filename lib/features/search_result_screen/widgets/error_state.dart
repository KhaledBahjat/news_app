import 'package:flutter/material.dart';
import 'package:news_app/core/style/app_text_style.dart';
import 'package:news_app/core/widgets/spacing.dart';

class ErrorState extends StatelessWidget {
  final String message;
  const ErrorState({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.redAccent),
          HeightSpace(12),
          Text(
            message,
            style: AppTextStyles.black14SemiBold,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
