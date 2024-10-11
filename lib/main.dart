import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_scripture/splash_feature/presentation/bloc/splash_bloc.dart';
import 'package:my_scripture/splash_feature/presentation/splash_screen.dart';

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

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Scripture App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
