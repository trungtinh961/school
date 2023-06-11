import 'package:flutter/material.dart';
import 'package:smart_school/view/create_school/model/school_model.dart';

class SchoolItemView extends StatelessWidget {
  const SchoolItemView({
    Key? key,
    this.schoolItem,
    this.onPressed,
  }) : super(key: key);

  final SchoolModel? schoolItem;
  final Function(SchoolModel?)? onPressed;

  @override
  Widget build(BuildContext context) {
    if (schoolItem == null) {
      return const SizedBox.shrink();
    }
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 210, 225, 249),
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: const Color.fromARGB(255, 138, 175, 235),
              width: 1.0,
            ),
          ),
          child: ListTile(
            title: Text(schoolItem?.name ?? ''),
            subtitle: Text(schoolItem?.province?.name ?? ''),
            onTap: () => onPressed?.call(schoolItem),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
