import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/view/base_widget.dart';
import '../../create_school/service/create_school_service.dart';
import '../viewmodel/signin_view_model.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SignInViewModel>(
      viewModel: SignInViewModel(CreateSchoolService()),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SignInViewModel viewModel) =>
          Container(
        color: context.colorScheme.background,
        child: Scaffold(
          body: _buildSignInView(viewModel),
        ),
      ),
    );
  }

  Widget _buildSignInView(SignInViewModel viewModel) {
    return Stack(
      children: [
        SignInScreen(
          showAuthActionSwitch: false,
          actions: [
            ForgotPasswordAction(
              ((context, email) {
                viewModel.goToForgotPassword(email);
              }),
            ),
            AuthStateChangeAction(
              ((context, state) {
                if (state is UserCreated || state is SignedIn) {
                  var user = (state is SignedIn)
                      ? state.user
                      : (state as UserCreated).credential.user;
                  if (user == null) {
                    return;
                  }
                  if (state is UserCreated) {
                    if (user.displayName == null && user.email != null) {
                      var defaultDisplayName = user.email!.split('@')[0];
                      user.updateDisplayName(defaultDisplayName);
                    }
                  }
                  viewModel.onSignInSuccess(user.email);
                }
              }),
            ),
          ],
        ),
        const Positioned(
          top: 75,
          child: BackButton(),
        ),
      ],
    );
  }
}
