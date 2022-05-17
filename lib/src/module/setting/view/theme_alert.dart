import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/theme/theme_cubit.dart';
import '../../../src.dart';

class AlertTheme extends StatelessWidget {
  const AlertTheme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        children: AppColors.instance.themeColors
            .map(
              (e) => Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(2),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: context.colorScheme.onSurface,
                    width: 1,
                  ),
                  color: Colors.transparent,
                ),
                child: InkWell(
                  onTap: () async{
                    context.read<ThemeCubit>().changeColor(e);
                  },
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: e,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
