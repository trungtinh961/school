import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../model/subject_model.dart';

class MenuItemView extends StatelessWidget {
  const MenuItemView({
    Key? key,
    this.item,
    this.onSelected,
  }) : super(key: key);

  final SubjectModel? item;
  final Function(SubjectModel?)? onSelected;

  @override
  Widget build(BuildContext context) {
    if (item == null) return const SizedBox.shrink();
    return GestureDetector(
      onTap: () => onSelected?.call(item),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.teal[100],
        ),
        child: Stack(
          children: [
            Image.asset(item?.type?.getImage ?? ''),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Center(
                child: Text(
                  item?.name ?? '',
                  style: context.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.colorScheme.primaryContainer,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
