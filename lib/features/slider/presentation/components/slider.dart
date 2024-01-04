import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/loading_widget.dart';
import 'package:hasad_app/common/default/network_image.dart';
import 'package:hasad_app/utils/app_colors.dart';
import '../controller/cubit/slider_cubit.dart';
import 'page_indicator_widget.dart';

class OffersSlider extends StatefulWidget {
  const OffersSlider({super.key});

  @override
  State<OffersSlider> createState() => _OffersSliderState();
}

class _OffersSliderState extends State<OffersSlider> {
  final CarouselController? carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SliderCubit(),
      child: Column(
        children: [
          BlocConsumer<SliderCubit, SliderState>(
            listener: (context, state) {},
            builder: (context, state) {
              return CarouselSlider(
                  carouselController: carouselController,
                  items: listttt
                      .map(
                        (offer) => NetworkImageWidget(
                          image: offer,
                          errorWidget: Container(
                            height: 180.h,
                            width: double.infinity,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(24.0)),
                            child: const Center(
                              child: Icon(Icons.error),
                            ),
                          ),
                          placeholder: (p0, p1) => Container(
                            height: 180.h,
                            width: double.infinity,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(24.0)),
                            child: const Center(
                              child: LoadingWidget(),
                            ),
                          ),
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              height: 180.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  image: DecorationImage(fit: BoxFit.fill, image: imageProvider),
                                  borderRadius: BorderRadius.circular(24.0)),
                            );
                          },
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                      viewportFraction: 1,
                      height: 180.h,
                      onPageChanged: (index, reason) {
                        SliderCubit.get(context).onSliderChanged(index);
                      },
                      autoPlay: true,
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true));
            },
          ),
          const SizedBox(
            height: 5,
          ),
          BlocBuilder<SliderCubit, SliderState>(
            buildWhen: (previous, current) => current is ChangeIndexSliderstate,
            builder: (context, state) {
              int length = listttt.length;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < length; i++)
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: PageIndicatorWidget(
                          color: AppColors.orangeColor,
                          index: i,
                          currentIndex: SliderCubit.get(context).currentIndex,
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

List<String> listttt = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYscfUBUbqwGd_DHVhG-ZjCOD7MUpxp4uhNe7toUg4ug&s',
  "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg"
];
