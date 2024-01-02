import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hasad_app/utils/app_assets.dart';
import 'bottom_nav_bar_item.dart';
import '../cubit/layout_cubit.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key, required this.cubit});
  final LayoutCubit cubit;

  @override
  Widget build(BuildContext context) {
    context.locale;
    return ClipRRect(
      borderRadius:
          const BorderRadius.only(topLeft: Radius.circular(30.5), topRight: Radius.circular(30.5)),
      child: BottomAppBar(
        elevation: 10,
        height: 70,
        notchMargin: 10,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius:
                BorderRadius.only(topLeft: Radius.circular(30.5), topRight: Radius.circular(30.5)),
          ),
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavBarItem(icon: SVGManager.bid, index: 0, cubit: cubit),
              BottomNavBarItem(index: 1, icon: SVGManager.home, cubit: cubit),
              const SizedBox(
                width: 50,
              ),
              BottomNavBarItem(icon: SVGManager.chats, index: 2, cubit: cubit),
              BottomNavBarItem(icon: SVGManager.profile, fontSize: 13, index: 3, cubit: cubit),
            ],
          ),
        ),
      ),
    );
  }
}
