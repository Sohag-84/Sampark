import 'package:flutter/material.dart';
import 'package:sampark/config/constant.dart';

PreferredSize homeTabBar({
  required BuildContext context,
  required TabController tabController,
}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60.0),
    child: TabBar(
      controller: tabController,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: Theme.of(context).textTheme.bodyLarge,
      unselectedLabelStyle: Theme.of(context).textTheme.labelLarge,
      tabs: const [
        Tab(child: Text("Chats")),
        Tab(child: Text("Groups")),
        Tab(child: Text("Calls")),
      ],
    ),
  );
}
