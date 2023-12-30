import 'package:hasad_app/utils/app_colors.dart';

import 'default_text.dart';
import '../../core/constants.dart';
import 'package:flutter/material.dart';

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold(
      {super.key,
      this.appbarTitle,
      required this.body,
      this.appbaractions,
      this.appbarLeading,
      this.back = false,
      this.appbarColor,
      this.backFunction,
      this.appbarElevation,
      this.appbarCenterTitle = true,
      this.appbarDrawer,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.scaffoldKey,
      this.appbarBottom,
      this.scaffoldColor,
      this.leadingWidth,
      this.withAppbar = true});
  final String? appbarTitle;
  final Widget? body;
  final List<Widget>? appbaractions;
  final Widget? appbarLeading;
  final bool back;
  final Color? appbarColor;
  final Color? scaffoldColor;
  final bool withAppbar;
  final double? appbarElevation;
  final bool appbarCenterTitle;
  final void Function()? backFunction;
  final Widget? appbarDrawer;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final PreferredSizeWidget? appbarBottom;
  final double? leadingWidth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor ?? AppColors.scaffoldColor,
      key: scaffoldKey,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      drawer: appbarDrawer,
      appBar: !withAppbar
          ? null
          : AppBar(
              bottom: appbarBottom,
              leadingWidth: leadingWidth,
              systemOverlayStyle: Constants.constSytemStatusBar,
              title: appbarTitle != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: DefaultText(
                        text: appbarTitle!,
                        textStyle: Theme.of(context).textTheme.headlineLarge,
                      ),
                    )
                  : null,
              backgroundColor: appbarColor ?? AppColors.scaffoldColor,
              elevation: appbarElevation ?? 0,
              shadowColor: Colors.grey.withOpacity(0.4),
              centerTitle: appbarCenterTitle,
              leading: back
                  ? IconButton(
                      onPressed: backFunction ??
                          () {
                            Navigator.pop(context);
                          },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 25,
                      ),
                      color: Colors.black,
                    )
                  : appbarLeading,
              actions: appbaractions,
            ),
      body: withAppbar ? body : SafeArea(child: body!),
    );
  }
}
