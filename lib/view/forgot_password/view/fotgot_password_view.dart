import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/view/base_widget.dart';
import '../viewmodel/forgot_password_view_model.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key, required this.email});

  final String? email;

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ForgotPasswordViewModel>(
      viewModel: ForgotPasswordViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder:
          (BuildContext context, ForgotPasswordViewModel viewModel) =>
              Container(
        color: context.colorScheme.background,
        child: Scaffold(
          body: _buildSignInView(viewModel),
        ),
      ),
    );
  }

  Widget _buildSignInView(ForgotPasswordViewModel viewModel) {
    return ForgotPasswordScreen(
      email: widget.email as String,
      headerMaxExtent: 200,
    );
  }
}
