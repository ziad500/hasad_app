import 'all_caught_up.dart';
import '../../utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PagenatedGridView<B extends StateStreamable<States>, States, DataType>
    extends StatefulWidget {
  final Function() init;
  final bool isLoading, allCaught;
  final List<DataType> items;
  final Widget Function(int index) childBuilder;
  final ScrollController controller;
  final EdgeInsetsGeometry? padding;
  final bool useExpanded;

  const PagenatedGridView({
    required this.init,
    required this.controller,
    required this.items,
    required this.childBuilder,
    required this.allCaught,
    required this.isLoading,
    this.padding,
    this.useExpanded = true,
    Key? key,
  }) : super(key: key);

  @override
  State<PagenatedGridView<B, States, DataType>> createState() =>
      _PagenatedGridViewState<B, States, DataType>();
}

class _PagenatedGridViewState<B extends StateStreamable<States>, States, DataType>
    extends State<PagenatedGridView<B, States, DataType>> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    widget.init();
  }

  @override
  Widget build(BuildContext context) {
    return widget.useExpanded
        ? Expanded(
            child: _Child<B, States, DataType>(
              controller: widget.controller,
              items: widget.items,
              childBuilder: widget.childBuilder,
              allCaught: widget.allCaught,
              isLoading: widget.isLoading,
            ),
          )
        : _Child<B, States, DataType>(
            padding: widget.padding,
            controller: widget.controller,
            items: widget.items,
            childBuilder: widget.childBuilder,
            allCaught: widget.allCaught,
            isLoading: widget.isLoading,
          );
  }
}

class _Child<B extends StateStreamable<States>, States, DataType> extends StatelessWidget {
  final bool isLoading, allCaught;
  final List<DataType> items;
  final Widget Function(int index) childBuilder;
  final ScrollController controller;
  final EdgeInsetsGeometry? padding;
  final bool useExpanded;

  const _Child({
    required this.controller,
    required this.items,
    required this.childBuilder,
    required this.allCaught,
    required this.isLoading,
    this.padding,
    this.useExpanded = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, States>(
      builder: (context, state) {
        return SingleChildScrollView(
          controller: controller,
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: padding ?? EdgeInsets.symmetric(horizontal: 20, vertical: 2.h),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.7,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return childBuilder(index);
                },
              ),
              if (isLoading) const _LoadingWidget(),
              if (allCaught) const AllCaughtUpWidget(),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        );
      },
    );
  }

  bool _isLastItem(int index) => index == items.length - 1;
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: const CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
