import 'package:hasad_app/generated/app_strings.g.dart';

import '../../utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown(
      {super.key,
      required this.list,
      this.items,
      this.height,
      this.iconSize = 24,
      required this.hint,
      this.isEmpty = false,
      required this.onOptionSelected,
      this.iconColor,
      this.onTap,
      this.width,
      this.title,
      this.validator,
      this.label,
      this.prefix,
      this.borderColor});

  final List<OptionItem> list;
  final List<DropdownMenuItem<OptionItem>>? items;
  final String hint;
  static String? selectedValue;
  final void Function(OptionItem?) onOptionSelected;
  final double iconSize;
  final Color? iconColor;
  final bool isEmpty;
  final void Function()? onTap;
  final double? height;
  final double? width;
  final String? title;
  final String? Function(OptionItem?)? validator;
  final String? label;
  final Widget? prefix;
  final Color? borderColor;

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 10,
          )
        ],
        SizedBox(
          width: width,
          child: Stack(
            children: [
              DropdownButtonFormField2<OptionItem>(
                isExpanded: true,
                decoration: InputDecoration(
                    prefixIcon: prefix,
                    prefixIconConstraints: BoxConstraints(
                        maxHeight: 25, maxWidth: 35.w, minHeight: 25, minWidth: 35.w),
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3).w,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3).w,
                        borderSide: BorderSide(color: borderColor ?? AppColors.borderColor))
                    // Add more decoration..
                    ),
                hint: Text(
                  hint,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColors.hintColor, fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                items: items ??
                    list
                        .map((item) => DropdownMenuItem(
                              value: OptionItem(
                                  id: item.id,
                                  title: item.title,
                                  subtitle: item.subtitle,
                                  description: item.description,
                                  image: item.image),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  item.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: Colors.grey, fontSize: 16),
                                ),
                              ),
                            ))
                        .toList(),
                validator: validator ??
                    (value) {
                      if (value == null) {
                        return LocaleKeys.thisFieldIsRequired.tr();
                      }
                      return null;
                    },
                onChanged: (value) {
                  onOptionSelected(value);
                },
                onSaved: (value) {
                  selectedValue = value.toString();
                },
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: TextFormField(
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.grey, fontSize: 16),
                      controller: textEditingController,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        hintText: LocaleKeys.search.tr(),
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.grey, fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3).w,
                        ),
                      ),
                    ),
                  ),
                  searchMatchFn: (DropdownMenuItem<OptionItem?> item, searchValue) {
                    return item.value!.title
                        .toString()
                        .toLowerCase()
                        .contains(searchValue.toLowerCase());
                  },
                ),
                buttonStyleData:
                    ButtonStyleData(padding: const EdgeInsets.only(right: 0), height: height ?? 45),
                iconStyleData: IconStyleData(
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: iconColor ?? Colors.black,
                    ),
                  ),
                  iconSize: iconSize,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3).w,
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
              isEmpty == true
                  ? InkWell(
                      onTap: onTap,
                      child: SizedBox(
                        width: width,
                        height: height ?? 55,
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ],
    );
  }
}

class OptionItem extends Equatable {
  final String id;
  final String title;
  final String? subtitle;
  final String description;
  final String image;

  const OptionItem(
      {required this.id,
      required this.title,
      this.description = "",
      this.subtitle,
      this.image = ""});

  @override
  List<Object?> get props => [id, title, description, image, subtitle];
}
