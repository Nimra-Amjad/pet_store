import 'package:flutter/material.dart';
import 'package:pet_store_app/src/components/widgets/topHeadingContainer.dart';
import 'package:pet_store_app/src/screens/bottomNavBar/screens/tabbar/adopt.dart';
import 'package:pet_store_app/src/screens/bottomNavBar/screens/tabbar/discussion.dart';
import 'package:pet_store_app/src/screens/bottomNavBar/screens/tabbar/videos.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PetCommunity extends StatefulWidget {
  const PetCommunity({Key? key}) : super(key: key);

  @override
  _PetCommunityState createState() => _PetCommunityState();
}

class _PetCommunityState extends State<PetCommunity>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 3, vsync: this); // Set the number of tabs (length) here
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        children: [
          const TopHeadingContainer(text: "COMMUNITY FORUM"),
          _buildTabBar(),
          Expanded(child: _buildTabView()),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      tabs: const [
        Tab(text: 'Videos'),
        Tab(text: 'Discussion'),
        Tab(text: 'Adapt'),
      ],
      controller: _tabController,
    );
  }

  Widget _buildTabView() {
    return TabBarView(
      controller: _tabController,
      children: const [
        VideosScreen(index: 0),
        // DiscussionScreen(index: 1),
        AdoptScreen(index: 2),
      ],
    );
  }
}
