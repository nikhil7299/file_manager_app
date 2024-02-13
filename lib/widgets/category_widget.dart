import 'package:file_manager_app/common/custom_icon.dart';
import 'package:file_manager_app/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryName;
  final String filesCount;
  final IconData iconData;
  final Color color;
  const CategoryWidget({
    super.key,
    required this.categoryName,
    required this.filesCount,
    required this.iconData,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: 62.h,
      borderRadius: 20,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          CustomIcon(
            iconData: iconData,
            color: color,
          ),
          SizedBox(width: 10.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categoryName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(filesCount),
            ],
          )
        ],
      ),
    );
  }
}
