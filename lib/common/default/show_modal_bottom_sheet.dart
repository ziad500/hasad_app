import '../../core/constants.dart';
import 'package:flutter/material.dart';

Future showModalSheet(BuildContext context, Widget body,
        {double? height, double padding = 20, bool withCancelButton = false, Color? color}) =>
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Set to true for full-screen behavior
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(28), topRight: Radius.circular(28))),
      builder: (BuildContext context) {
        return AnimatedPadding(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Stack(
            alignment: Constants.isArabic ? Alignment.topLeft : Alignment.topRight,
            children: [
              Container(
                height: height,
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(28), topRight: Radius.circular(28))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Container(
                            width: 32,
                            height: 4,
                            decoration: BoxDecoration(
                                color: Colors.grey, borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        body
                      ],
                    ),
                  ),
                ),
              ),
              if (withCancelButton)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  child: IconButton(
                      onPressed: () => Navigator.pop(context), icon: const Icon(Icons.cancel)),
                )
            ],
          ),
        );
      },
    );
