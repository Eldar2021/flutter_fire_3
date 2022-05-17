import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../app/theme/theme_cubit.dart';
import '../../../src.dart';
import 'theme_alert.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: AppDuration.durationNormal(),
    );
    controller.animateTo(
      context.read<ThemeCubit>().state.theme.mode ? 0.5 : 1,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SettingView'),
        actions: [
          GestureDetector(
            onTap: () async => changeBr(context),
            child: Lottie.asset(
              Lotties.instance.lottieTheme,
              repeat: false,
              controller: controller,
              width: context.width(0.4),
              height: double.infinity,
            ),
          )
        ],
      ),
      body: const Center(
        child: Text('SettingView'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _change(context),
        child: const Icon(Icons.color_lens_outlined),
      ),
    );
  }

  Future<void> changeBr(BuildContext context) async {
    await controller
        .animateTo(context.read<ThemeCubit>().state.theme.mode ? 1 : 0.5)
        .whenComplete(
      () {
        context
            .read<ThemeCubit>()
            .changeBrightNess(!context.read<ThemeCubit>().state.theme.mode);
      },
    );
  }

  void _change(BuildContext _) {
    showDialog(
      context: _,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: context.colorScheme.background,
          title: const Text("Alert!!"),
          content: BlocProvider.value(
            value: _.read<ThemeCubit>(),
            child: const AlertTheme(),
          ),
        );
      },
    );
  }
}
