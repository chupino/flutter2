import 'package:diario_el_pueblo/components/HomeComponents/Header.dart';
import 'package:diario_el_pueblo/components/HomeComponents/HeaderMini.dart';
import 'package:flutter/material.dart';

class HeaderDelegateHome extends SliverPersistentHeaderDelegate {
  final TabController tabController;
  final Size size;
  const HeaderDelegateHome({required this.tabController, required this.size});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final isCollapsed = shrinkOffset > 100;
    return Container(
      height: maxExtent,
      child: Stack(
        children: <Widget>[
          AnimatedOpacity(
            opacity: isCollapsed ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: HeaderHome(tabController: tabController, size: size),
          ),
          AnimatedOpacity(
            opacity: isCollapsed ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: HeaderMiniHome(size: size),
          )
        ],
      ),
    );
  }

  @override

  double get maxExtent => size.height * 0.25;

  @override

  double get minExtent => size.height * 0.14;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {

    return false;
  }
}
