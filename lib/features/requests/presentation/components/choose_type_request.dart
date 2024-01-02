import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/shared_list_tile.dart';
import 'package:hasad_app/features/requests/presentation/components/base/add_request_base.dart';
import 'package:hasad_app/features/requests/presentation/components/base/add_request_base_container.dart';

class ChooseTypeOfRequest extends StatelessWidget {
  const ChooseTypeOfRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return AddRequestBaseScaffold(
        number: "1",
        title: "الاختيار بين",
        body: AddRequestBaseContainer(
            buttonFunction: () {},
            body: Column(
              children: [
                SharedListTile(
                  title: "بيع مباشر",
                  onTap: () {},
                ),
                SizedBox(
                  height: 10.h,
                ),
                SharedListTile(
                  title: "مزاد",
                  onTap: () {},
                )
              ],
            )));
  }
}
