import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tripy_ev_stable/gen/assets.gen.dart';
import 'package:tripy_ev_stable/injection.dart';
import 'package:tripy_ev_stable/routes/routes.dart';
import 'package:tripy_ev_stable/screens/mobile/introduce/components/introduce_page_component.dart';
import 'package:tripy_ev_stable/screens/mobile/introduce/viewmodel/introduce_viewmodel.dart';

class IntroduceView extends StatelessWidget {
  const IntroduceView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => IntroduceViewModel(),
      builder: (context, viewModel, child) {
        return PageView(
          controller: viewModel.pageController,
          children: [
            IntroducePageComponent(
              bgPath: Assets.introduce.started1.path,
              nextButton: viewModel.nextPage,
              title: "Catherine Bergego\nSchaal",
              description:
                  "Learn how to write effective letters to your customers and clients. Use this guide to build your cus",
              controller: viewModel.pageController,
            ),
            IntroducePageComponent(
              bgPath: Assets.introduce.started2.path,
              nextButton: viewModel.nextPage,
              backButton: viewModel.previousPage,
              title: "The Collaboration\nJunkie",
              description:
                  "Learn how to write effective letters to your customers and clients. Use this guide to build your cus",
              controller: viewModel.pageController,
            ),
            IntroducePageComponent(
              bgPath: Assets.introduce.started3.path,
              nextButton: () {
                router.go(
                  AppRoutes.LOGIN.route,
                );
              },
              backButton: viewModel.previousPage,
              title: "Software Development\nManager",
              description:
                  "Learn how to write effective letters to your customers and clients. Use this guide to build your cus",
              controller: viewModel.pageController,
            ),
          ],
        );
      },
    );
  }
}
