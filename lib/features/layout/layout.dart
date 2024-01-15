import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/loading_frame.dart';
import 'package:hasad_app/common/default/loading_page.dart';
import 'package:hasad_app/features/favorites/presentation/components/add_to_fav_loading.dart';
import 'package:hasad_app/features/favorites/presentation/controller/cubit/favorites_cubit.dart';

import 'components/bottom_navigation_bar.dart';
import 'components/layout_floating_action_botton.dart';
import 'cubit/layout_cubit.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return LoadingFrame(
          loadingStates: const [AddToFavLoading()],
          child: Scaffold(
              extendBody: true,
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              floatingActionButton: LayoutFloatingActionButton(cubit: cubit),
              body: cubit.screens[cubit.currentTap],
              bottomNavigationBar: BottomNavigationBarWidget(
                cubit: cubit,
              )),
        );
      },
    );
  }
}
