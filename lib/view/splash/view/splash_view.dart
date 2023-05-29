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
      backgroundColor: Colors.purple.shade300,
      body: SafeArea(
        child: Stack(
          children: [
            buildTextWelcome(context, viewModel),
            buildAnimatedButtons(viewModel, context),
          ],
        ),
      ),
    );
  }

  Center buildTextWelcome(
    BuildContext context,
    SplashViewModel viewModel,
  ) {
    return Center(
      child: Observer(
        builder: (_) {
          return AnimatedOpacity(
            duration: context.durationNormal,
            opacity: viewModel.isFirstInit ? 0 : 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 50,
                  child: TitleTextButton(
                    onPressed: viewModel.onClickTeacher,
                    text: "Giáo viên",
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: TitleTextButton(
                    onPressed: viewModel.onClickStudent,
                    text: "Học sinh",
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildAnimatedButtons(
    SplashViewModel viewModel,
    BuildContext context,
  ) {
    return Observer(
      builder: (_) {
        return AnimatedAlign(
          alignment:
              viewModel.isFirstInit ? Alignment.center : Alignment.topCenter,
          duration: context.durationLow,
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
    );
  }
}
