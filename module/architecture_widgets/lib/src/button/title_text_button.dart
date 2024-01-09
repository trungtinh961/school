import 'package:architecture_widgets/src/button/normal_button.dart';
import 'package:flutter/material.dart';

class TitleTextButton extends StatelessWidget {
  const TitleTextButton({
    Key? key,
    required this.text,
    this.style,
    this.onPressed,
  }) : super(
          key: key,
        );
  final String text;
  final VoidCallback? onPressed;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return NormalButton(
      onPressed: onPressed,
      child: Center(
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}
