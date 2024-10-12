import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial(
      themeData: dayTheme(),
      icon: Icons.brightness_3,
      mode: 'Day'
  )) {
    on<ToggleThemeEvent>((event, emit) {
      final currentState = state as ThemeInitial;
      // check if it's day or night
      if (currentState.mode == 'Day') {
        emit(ThemeInitial(
            themeData: nightTheme(),
            icon: Icons.wb_sunny,
            mode: 'Night'
        ));
      } else {
        emit (ThemeInitial(
            themeData: dayTheme(),
            icon: Icons.brightness_3,
            mode: 'Day'
        ));
      }
    });
  }
  //Day Theme
static ThemeData dayTheme(){
    return ThemeData(
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black))
    );
}
  // Night Theme
  static ThemeData nightTheme(){
    return ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white))
    );
  }
}
