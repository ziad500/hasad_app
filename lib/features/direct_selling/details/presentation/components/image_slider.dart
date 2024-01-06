import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/loading_widget.dart';
import 'package:hasad_app/common/default/network_image.dart';
import 'package:hasad_app/features/direct_selling/details/presentation/controller/cubit/direct_selling_details_cubit.dart';
import 'package:hasad_app/features/slider/presentation/components/page_indicator_widget.dart';

class ItemDetailsSlider extends StatefulWidget {
  const ItemDetailsSlider({super.key});

  @override
  State<ItemDetailsSlider> createState() => _ItemDetailsSliderState();
}

class _ItemDetailsSliderState extends State<ItemDetailsSlider> {
  final CarouselController? carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CarouselSlider(
                carouselController: carouselController,
                items: DirectSellingDetailsCubit.get(context).directSellingDataModel?.images == null
                    ? []
                    : DirectSellingDetailsCubit.get(context)
                        .directSellingDataModel!
                        .images!
                        .map(
                          (offer) => NetworkImageWidget(
                            image: offer,
                            errorWidget: Container(
                              height: 240.h,
                              width: double.maxFinite,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(25),
                                      bottomRight: Radius.circular(25))),
                              child: const Center(
                                child: Icon(Icons.error),
                              ),
                            ),
                            placeholder: (p0, p1) => Container(
                              height: 240.h,
                              width: double.maxFinite,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(25),
                                      bottomRight: Radius.circular(25))),
                              child: const Center(
                                child: LoadingWidget(),
                              ),
                            ),
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                height: 240.h,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(25),
                                        bottomRight: Radius.circular(25))),
                              );
                            },
                          ),
                        )
                        .toList(),
                options: CarouselOptions(
                    viewportFraction: 1,
                    height: 240.h,
                    onPageChanged: (index, reason) {
                      DirectSellingDetailsCubit.get(context).onSliderChanged(index);
                    },
                    autoPlay: true,
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true)),
            BlocBuilder<DirectSellingDetailsCubit, DirectSellingDetailsState>(
              buildWhen: (previous, current) => current is ChangeIndexSliderstate,
              builder: (context, state) {
                int length =
                    DirectSellingDetailsCubit.get(context).directSellingDataModel?.images == null
                        ? 0
                        : DirectSellingDetailsCubit.get(context)
                            .directSellingDataModel!
                            .images!
                            .length;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10).w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < length; i++)
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: PageIndicatorWidget(
                            index: i,
                            currentIndex: DirectSellingDetailsCubit.get(context).currentIndex,
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

List<String> listttt = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYscfUBUbqwGd_DHVhG-ZjCOD7MUpxp4uhNe7toUg4ug&s',
  "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1100/2023/10/free-images.jpg"
];
