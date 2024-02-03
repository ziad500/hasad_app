import 'package:flutter/material.dart';

class DismissWidget extends StatelessWidget {
  const DismissWidget(
      {super.key,
      required this.child,
      this.confirmDismiss,
      this.startToEndFunction,
      this.endToStartFunction,
      this.thereIsEdit = false,
      this.dismiss = true});
  final Widget child;
  final Future<bool?> Function(DismissDirection)? confirmDismiss;
  final Future<bool?> Function(DismissDirection)? startToEndFunction;
  final Future<bool?> Function(DismissDirection)? endToStartFunction;
  final bool thereIsEdit;
  final bool dismiss;
  @override
  Widget build(BuildContext context) {
    return !dismiss
        ? child
        : Dismissible(
            key: Key(child.hashCode.toString()),
            direction: DismissDirection.horizontal,
            confirmDismiss: (direction) async {
              if (confirmDismiss != null) {
                confirmDismiss!(direction);
              } else {
                if (direction == DismissDirection.startToEnd) {
                  if (startToEndFunction != null) {
                    startToEndFunction!(DismissDirection.startToEnd);
                  }

                  return false;
                } else {
                  if (endToStartFunction != null) {
                    endToStartFunction!(DismissDirection.endToStart);
                  }
                }
              }

              return null;
            },
            background: Container(
                color: Colors.red,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                )),
            secondaryBackground: thereIsEdit
                ? Container(
                    color: Colors.grey,
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ))
                : null,
            child: SizedBox(width: double.maxFinite, child: child));
  }
}
