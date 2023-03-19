import 'package:flutter/material.dart';
import 'package:smart_school/view/menu/model/subject_model.dart';

class SubjectContentItemView extends StatelessWidget {
  const SubjectContentItemView({
    Key? key,
    this.subContentModel,
    this.onPressed,
  }) : super(key: key);

  final SubContentModel? subContentModel;
  final VoidCallback? onPressed;

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
            border: Border.all(
              color: const Color.fromARGB(255, 152, 184, 237),
              width: 1.0,
            ),
          ),
          child: ListTile(
            title: Text(subContentModel?.name ?? ''),
            onTap: onPressed,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
