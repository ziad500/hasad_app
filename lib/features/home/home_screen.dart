import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/default_list_view.dart';
import 'package:hasad_app/common/main_item.dart';
import 'package:hasad_app/common/row_of_text.dart';
import 'package:hasad_app/common/search_bar.dart';
import 'package:hasad_app/common/title_widget.dart';
import 'package:hasad_app/features/bidding/presentation/components/category_list.dart';
import 'package:hasad_app/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBarWidget(),
            RowOfTextViewAllWidget(title: "أقسام البيع المباشر", onPressed: () {}),
            SizedBox(
              height: 5.h,
            ),
            const CategoriesList(),
            SizedBox(
              height: 20.h,
            ),
            const TitleWidget(title: "تم الاضافه مؤخرا"),
            SizedBox(
              height: 15.h,
            ),
            Expanded(
                child: DefaultListView(
                    itemBuilder: (context, index) => const MainItemWidget(isbidding: false),
                    count: 10))
          ],
        ),
      )),
    );
  }
}
