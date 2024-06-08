import 'package:flutter/material.dart';
import 'package:tripy_ev_stable/gen/assets.gen.dart';

import 'package:tripy_ev_stable/screens/mobile/splash/viewmodel/splash_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => SplashViewModel(),
      onViewModelReady: (viewModel) => viewModel.init(),
      disposeViewModel: true,
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(),
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  Assets.images.splashLogo.path,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
