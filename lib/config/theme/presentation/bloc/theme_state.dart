part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {
  final ThemeData themeData;
  final IconData icon;
  final String mode;

  ThemeInitial({required this.themeData, required this.icon, required this.mode});
}
