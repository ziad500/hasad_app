import 'package:flutter/material.dart';

class ExpandableItem extends StatefulWidget {
  final Widget Function(bool) baseWidget;
  final Widget expandedWidget;

  const ExpandableItem({super.key, required this.baseWidget, required this.expandedWidget});

  @override
  createState() => _ExpandableItemState();
}

class _ExpandableItemState extends State<ExpandableItem> {
  bool isExpanded = false;

  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(onTap: toggleExpanded, child: widget.baseWidget(isExpanded)),
        if (isExpanded) ...[
          const SizedBox(
            height: 10,
          ),
          widget.expandedWidget
        ]
      ],
    );
  }
}
