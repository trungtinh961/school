import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:architecture_widgets/src/button/title_text_button.dart';
import '../../../core/base/view/base_widget.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: buildScaffoldBody,
    );
  }

  Widget buildScaffoldBody(BuildContext context, SplashViewModel viewModel) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Stack(
          children: [
            buildCenterTextWelcome(context, viewModel),
            buildAnimatedAlignIcon(viewModel, context),
          ],
        ),
      ),
    );
  }

  Center buildCenterTextWelcome(
    BuildContext context,
    SplashViewModel viewModel,
  ) {
    return Center(
      child: Observer(
        builder: (_) {
          return AnimatedOpacity(
            duration: context.durationNormal,
            opacity: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  LocaleKeys.splash_welcome.tr(),
                  style: context.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.colorScheme.primaryContainer,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildAnimatedAlignIcon(
    SplashViewModel viewModel,
    BuildContext context,
  ) {
    return Observer(
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 32),
          child: AnimatedAlign(
            alignment: Alignment.bottomCenter,
            duration: context.durationLow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TitleTextButton(
                  onPressed: viewModel.onClickTeacher,
                  text: "Giáo viên",
                ),
                const SizedBox(
                  height: 12,
                ),
                TitleTextButton(
                  onPressed: viewModel.onClickStudent,
                  text: "Học sinh",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
