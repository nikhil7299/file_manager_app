import 'package:file_manager_app/animations/bounce.dart';
import 'package:file_manager_app/animations/scale_fade_bounce.dart';
import 'package:file_manager_app/common/app_colors.dart';
import 'package:file_manager_app/custom_paint/blur_circle.dart';
import 'package:file_manager_app/custom_paint/dots_circle_painter.dart';
import 'package:file_manager_app/pages/details/details_page.dart';
import 'package:file_manager_app/widgets/category_widget.dart';
import 'package:file_manager_app/widgets/custom_container.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryTextTheme = theme.primaryTextTheme;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: CustomPaint(
        painter: BlurCirclePainter(),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            children: [
              BounceAnimation(
                delay: 5,
                child: _buildHeader(primaryTextTheme),
              ),
              SizedBox(height: 20.h),
              BounceAnimation(
                delay: 4.5,
                child: SizedBox(
                  height: 45.h,
                  child: _buildSearchField(),
                ),
              ),
              SizedBox(height: 20.h),
              BounceAnimation(
                delay: 4,
                child: Text(
                  "Overview",
                  style: primaryTextTheme.titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10.h),
              BounceAnimation(
                delay: 3.5,
                child: _buildStorageOverview(context, primaryTextTheme),
              ),
              SizedBox(height: 20.h),
              BounceAnimation(
                delay: 3,
                child: Text(
                  "Categories",
                  style: primaryTextTheme.titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10.h),
              _buildCategories(),
              SizedBox(height: 30.h),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 60.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 71, 68, 89),
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(
                      color: Colors.white54,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(IconlyBold.setting),
                      Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: const BoxDecoration(
                          color: AppColors.progressColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          IconlyBold.home,
                          color: Colors.black,
                        ),
                      ),
                      const Icon(IconlyBold.profile),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildHeader(TextTheme primaryTextTheme) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/avatar.jpg'),
        ),
        SizedBox(
          width: 20.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome,',
              style: primaryTextTheme.titleMedium,
            ),
            SizedBox(height: 1.h),
            Text(
              "Nikhil Kumar",
              style: primaryTextTheme.titleLarge,
            )
          ],
        ),
        const Spacer(),
        CustomContainer(
          width: 50,
          height: 50,
          borderRadius: 12,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              IconlyLight.notification,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  TextField _buildSearchField() {
    return TextField(
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        prefixIcon: const Icon(IconlyLight.search, size: 20),
        filled: true,
        fillColor: AppColors.containerColor,
        focusColor: AppColors.containerColor,
        hintText: "Search files..",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white12, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white12, width: 2),
        ),
      ),
    );
  }

  Column _buildCategories() {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              child: ScaleFadeBounceAnimation(
                durationSecs: 2,
                child: CategoryWidget(
                  categoryName: "Photos",
                  filesCount: "108 files",
                  color: Colors.deepPurple,
                  iconData: IconlyBold.image,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: ScaleFadeBounceAnimation(
                durationSecs: 2.1,
                child: CategoryWidget(
                  categoryName: "Audio",
                  filesCount: "8 files",
                  color: Colors.deepOrange.shade300,
                  iconData: FluentIcons.music_note_2_24_filled,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            const Expanded(
              child: ScaleFadeBounceAnimation(
                durationSecs: 2.2,
                child: CategoryWidget(
                  categoryName: "Videos",
                  filesCount: "72 files",
                  color: Colors.blue,
                  iconData: IconlyBold.video,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            const Expanded(
              child: ScaleFadeBounceAnimation(
                durationSecs: 2.3,
                child: CategoryWidget(
                  categoryName: "Files",
                  filesCount: "98 files",
                  color: Colors.pink,
                  iconData: FluentIcons.document_48_filled,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  InkWell _buildStorageOverview(
      BuildContext context, TextTheme primaryTextTheme) {
    return InkWell(
      onTap: () => Navigator.push(context, DetailsPage.route()),
      child: CustomContainer(
        height: 180.h,
        width: double.maxFinite,
        borderRadius: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RotatedBox(
              quarterTurns: 2,
              child: CircularPercentIndicator(
                arcType: ArcType.FULL_REVERSED,
                radius: 100,
                percent: 0.85,
                lineWidth: 20,
                animation: true,
                animationDuration: 3000,
                animateFromLastPercent: true,
                // restartAnimation: true,
                progressColor: AppColors.progressColor,
                rotateLinearGradient: true,
                arcBackgroundColor: AppColors.progressColor.withOpacity(.1),
                circularStrokeCap: CircularStrokeCap.round,
                center: SizedBox(
                  width: 145,
                  height: 145,
                  child: CustomPaint(
                    painter: CircleWithDotsPainter(),
                    child: RotatedBox(
                      quarterTurns: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Storage", style: primaryTextTheme.bodyMedium),
                          Text(
                            "85%",
                            style: primaryTextTheme.headlineLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 10,
                      backgroundColor: AppColors.progressColor,
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Used"),
                        Text(
                          '51 GB',
                          style: primaryTextTheme.headlineSmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: AppColors.progressColor.withOpacity(.1),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Free",
                        ),
                        Text(
                          '9 GB',
                          style: primaryTextTheme.headlineSmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
