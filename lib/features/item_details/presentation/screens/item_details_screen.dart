import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasad_app/common/default/default_divider.dart';
import 'package:hasad_app/features/item_details/presentation/components/base/body.dart';
import 'package:hasad_app/features/item_details/presentation/components/description_item.dart';
import 'package:hasad_app/features/item_details/presentation/components/image_slider.dart';
import 'package:hasad_app/features/item_details/presentation/components/location_widget.dart';
import 'package:hasad_app/features/item_details/presentation/components/row_of_buttons.dart';
import 'package:hasad_app/features/item_details/presentation/components/title_and_price.dart';
import 'package:hasad_app/features/item_details/presentation/components/types.dart';
import 'package:hasad_app/features/item_details/presentation/components/user_row.dart';
import 'package:hasad_app/features/item_details/presentation/controller/cubit/item_details_cubit.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ItemDetailsCubit(),
        child: const ItemDetailsBody(
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.favorite_border),
              ),
            )
          ],
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ItemDetailsSlider(),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ItemLocationWidget(),
                        SizedBox(
                          height: 15,
                        ),
                        ItemDetailsTitleAndPrice(),
                        _DefaulDivider(),
                        TypeDetailsRowWidget(),
                        _DefaulDivider(),
                        DescriptionWidget(),
                        _DefaulDivider(),
                        UserRowWidget(),
                        SizedBox(
                          height: 20,
                        ),
                        ItemRowOfButtons(),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class _DefaulDivider extends StatelessWidget {
  const _DefaulDivider();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 10,
        ),
        DefaultDivider(),
      ],
    );
  }
}
