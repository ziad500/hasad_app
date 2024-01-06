import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/custom_appbar_filter.dart';
import 'package:hasad_app/common/default/default_list_view.dart';
import 'package:hasad_app/common/default/main_layout.dart';
import 'package:hasad_app/common/main_item.dart';

class DirectSellingListScreen extends StatelessWidget {
  const DirectSellingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        withAppbar: false,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomAppbarWithFilter(name: "خضار", onTap: () {}),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                  child: DefaultListView(
                      itemBuilder: (context, index) => const MainItemWidget(isbidding: false),
                      count: 10))
            ],
          ),
        ));
  }
}
