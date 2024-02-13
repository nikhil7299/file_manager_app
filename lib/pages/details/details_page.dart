import 'package:file_manager_app/animations/bounce.dart';
import 'package:file_manager_app/common/app_colors.dart';
import 'package:file_manager_app/custom_paint/blur_circle.dart';
import 'package:file_manager_app/custom_paint/skew_tab_indicator.dart';
import 'package:file_manager_app/pages/details/tabs/recents_tab_content.dart';
import 'package:file_manager_app/pages/details/tabs/storage_tab_content.dart';
import 'package:file_manager_app/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class DetailsPage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const DetailsPage());
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this)
      ..addListener(() {
        setState(() {});
      });
    tabController.animation!.drive(AlignmentTween(
        begin: Alignment.centerLeft, end: Alignment.centerRight));
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryTextTheme = theme.primaryTextTheme;
    return ColoredBox(
      color: AppColors.backgroundColor,
      child: CustomPaint(
        painter: BlurCirclePainter2(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: _buildAppBar(context, primaryTextTheme),
          body: SafeArea(
            // minimum: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildTabBarView(),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, TextTheme primaryTextTheme) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leadingWidth: 80,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20, top: 2, bottom: 2, right: 10),
        child: BounceAnimation(
          delay: 3,
          child: CustomContainer(
            width: 50,
            height: 50,
            borderRadius: 12,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                IconlyLight.arrow_left_2,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      title: BounceAnimation(
        delay: 3,
        child: Text(
          "Details",
          style: primaryTextTheme.titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      actions: [
        BounceAnimation(
          delay: 3,
          child: CustomContainer(
            width: 50,
            height: 50,
            borderRadius: 12,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                IconlyLight.search,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
      ],
      bottom: _buildTabBar(context),
    );
  }

  TabBarView _buildTabBarView() {
    return TabBarView(
      controller: tabController,
      children: const [
        RecentContent(),
        StoragePage(),
      ],
    );
  }

  PreferredSizeWidget _buildTabBar(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return PreferredSize(
      preferredSize: Size(size.width, 80),
      child: BounceAnimation(
        delay: 2.5,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.white24,
            ),
          ),
          child: TabBar(
            controller: tabController,
            splashBorderRadius: BorderRadius.circular(12),
            splashFactory: NoSplash.splashFactory,
            labelColor: Colors.black,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            unselectedLabelColor: Colors.white,
            indicator: SkewTabIndicator(
              color: AppColors.progressColor,
              tabController: tabController,
              borderRadius: 12,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            tabs: const [
              Tab(
                child: Text(
                  "Recent",
                ),
              ),
              Tab(
                child: Text(
                  "Storage",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
