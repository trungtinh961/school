import 'package:flutter/material.dart';
import 'package:smart_school/view/menu/model/subject_model.dart';

class SubjectContentItemView extends StatelessWidget {
  const SubjectContentItemView({
    Key? key,
    this.subContentModel,
    this.onPressed,
  }) : super(key: key);

  final SubContentModel? subContentModel;
  final Function(SubContentModel?)? onPressed;

  @override
  Widget build(BuildContext context) {
    if (subContentModel == null) {
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
            title: Text(subContentModel?.name ?? ''),
            onTap: () => onPressed?.call(subContentModel),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
