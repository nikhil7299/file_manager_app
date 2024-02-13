import 'package:file_manager_app/animations/bounce.dart';
import 'package:file_manager_app/animations/scale_fade_bounce.dart';
import 'package:file_manager_app/common/custom_icon.dart';
import 'package:file_manager_app/custom_paint/custom_folder.dart';
import 'package:file_manager_app/models/folder_model.dart';
import 'package:file_manager_app/widgets/custom_container.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class RecentContent extends StatelessWidget {
  const RecentContent({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryTextTheme = Theme.of(context).primaryTextTheme;
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      shrinkWrap: true,
      children: [
        BounceAnimation(
          delay: 1.75,
          child: Text(
            "Folders",
            style: primaryTextTheme.titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 360,
          width: double.maxFinite,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 1.1,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              final recentFolder = recentFolders[index];
              return ScaleFadeBounceAnimation(
                durationSecs: 1 + .2 * index,
                child: GestureDetector(
                  onTap: () {},
                  child: CustomPaint(
                    painter: CustomFolder(),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomIcon(
                              iconData: FluentIcons.folder_48_filled,
                              color: recentFolder.color),
                          const Spacer(),
                          Text(
                            recentFolder.folderName,
                            style: primaryTextTheme.titleLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text(recentFolder.folderInfo,
                              style: primaryTextTheme.titleMedium!),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20.h),
        BounceAnimation(
          delay: 1.5,
          child: Text(
            "Files",
            style: primaryTextTheme.titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 18.h),
        BounceAnimation(
          delay: 1.25,
          child: CustomContainer(
            borderRadius: 20,
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const CustomIcon(
                  iconData: FluentIcons.music_note_2_24_filled,
                  color: Colors.orange,
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Humdard - Ek Villain.mp3",
                      style: primaryTextTheme.titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Text("4.5 MB"),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h),
        BounceAnimation(
          delay: 1,
          child: CustomContainer(
            borderRadius: 20,
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CustomIcon(
                  iconData: IconlyBold.image,
                  color: Colors.deepPurple.shade300,
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "mock-dribbles.png",
                      style: primaryTextTheme.titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Text("15 MB"),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
