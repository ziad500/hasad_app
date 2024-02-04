import 'package:flutter/material.dart';
import 'package:hasad_app/utils/app_colors.dart';

class SharedBottomSheet extends StatelessWidget {
  const SharedBottomSheet({super.key, required this.child, this.withHeader = true});
  final Widget child;
  final bool withHeader;

  @override
  Widget build(BuildContext context) {
    return withHeader
        ? Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(20)
                      .copyWith(top: 50)
                      .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom + 20),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25), topRight: Radius.circular(25))),
                  child: SingleChildScrollView(child: child)),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                  child: Icon(
                    Icons.close,
                    color: AppColors.iconColor,
                  ),
                ),
              )
            ],
          )
        : Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(20)
                .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom + 20),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
            child: SingleChildScrollView(child: child));
  }
}

Future defaultshowModalBottomSheet(
        {required BuildContext context, required Widget child, bool withHeader = true}) =>
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      barrierColor: Colors.black.withOpacity(.8),
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      builder: (context) {
        return SharedBottomSheet(withHeader: withHeader, child: child);
      },
    );
