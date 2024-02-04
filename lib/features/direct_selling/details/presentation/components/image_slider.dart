import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hasad_app/common/default/loading_widget.dart';
import 'package:hasad_app/common/default/network_image.dart';
import 'package:hasad_app/common/video/video_view.dart';
import 'package:hasad_app/features/slider/presentation/components/page_indicator_widget.dart';
import 'package:hasad_app/utils/app_colors.dart';
import 'package:hasad_app/utils/helpers.dart';

class ItemDetailsSlider extends StatefulWidget {
  const ItemDetailsSlider(
      {super.key,
      this.list,
      this.onPageChanged,
      required this.currentIndex,
      this.borderRadius,
      this.height});
  final List<String?>? list;
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;
  final int currentIndex;
  final double? borderRadius;
  final double? height;

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
                items: widget.list == null
                    ? []
                    : widget.list!.map((offer) {
                        if (offer == null) {
                          return const SizedBox();
                        }
                        if (!isImage(offer)) {
                          return InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VideoPlayerFromPath(videoPath: offer))),
                            child: Container(
                              height: widget.height ?? 240.h,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  color: AppColors.grey,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(widget.borderRadius ?? 25),
                                      bottomRight: Radius.circular(widget.borderRadius ?? 25))),
                              child: const Center(
                                child: Icon(Icons.video_camera_back_sharp),
                              ),
                            ),
                          );
                        } else {
                          return NetworkImageWidget(
                            image: offer,
                            errorWidget: Container(
                              height: widget.height ?? 240.h,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(widget.borderRadius ?? 25),
                                      bottomRight: Radius.circular(widget.borderRadius ?? 25))),
                              child: const Center(
                                child: Icon(Icons.error),
                              ),
                            ),
                            placeholder: (p0, p1) => Container(
                              height: widget.height ?? 240.h,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(widget.borderRadius ?? 25),
                                      bottomRight: Radius.circular(widget.borderRadius ?? 25))),
                              child: const Center(
                                child: LoadingWidget(),
                              ),
                            ),
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                height: widget.height ?? 240.h,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(widget.borderRadius ?? 25),
                                        bottomRight: Radius.circular(widget.borderRadius ?? 25))),
                              );
                            },
                          );
                        }
                      }).toList(),
                options: CarouselOptions(
                    viewportFraction: 1,
                    height: widget.height ?? 240.h,
                    onPageChanged: widget.onPageChanged,
                    autoPlay: true,
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10).w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < (widget.list == null ? 0 : widget.list!.length); i++)
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: PageIndicatorWidget(
                        index: i,
                        currentIndex: widget.currentIndex,
                      ),
                    ),
                ],
              ),
            )

            /* BlocBuilder<DirectSellingDetailsCubit, DirectSellingDetailsState>(
              buildWhen: (previous, current) => current is ChangeIndexSliderstate,
              builder: (context, state) {
                int length = ;
                return  },
            ), */
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
