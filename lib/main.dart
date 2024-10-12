import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_scripture/config/theme/presentation/bloc/theme_bloc.dart';
import 'package:my_scripture/splash_feature/presentation/bloc/splash_bloc.dart';
import 'package:my_scripture/splash_feature/presentation/screens/splash_screen.dart';

void main() {
  runApp(const ScriptureApp());
}

class ScriptureApp extends StatelessWidget {
  const ScriptureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashBloc(),
        ),
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          final themeState = state as ThemeInitial;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Scripture App',
            theme: themeState.themeData,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
