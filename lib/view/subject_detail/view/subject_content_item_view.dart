import 'package:flutter/material.dart';

import '../model/subject_content_type.dart';

class SubjectContentItemView extends StatelessWidget {
  const SubjectContentItemView({
    Key? key,
    this.type,
    this.onPressed,
  }) : super(key: key);

  final SubjectContentTypeEnum? type;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    if (type == null) {
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
            title: Text(type!.description),
            onTap: onPressed,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
