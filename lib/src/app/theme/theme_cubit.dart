import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'custom_theme/custom_theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());

  void changeColor(Color color) {
    emit(ThemeState(theme: state.theme.copy(newColor: color)));
  }

  void changeBrightNess(bool mode) {
    emit(ThemeState(theme: state.theme.copy(newMode: mode)));
  }
}
