import 'package:flutter/material.dart';
import 'package:hasad_app/utils/routes_manager.dart';
import '../cubit/layout_cubit.dart';
import '../../../utils/app_colors.dart';

class LayoutFloatingActionButton extends StatelessWidget {
  const LayoutFloatingActionButton({super.key, required this.cubit});
  final LayoutCubit cubit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.addRequestScreen),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffF2F2F2),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.transparent),
            ),
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 63,
              width: 63,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.transparent),
              ),
            ),
          ),
          const Icon(
            Icons.add_circle_outline_rounded,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
    );
  }
}
