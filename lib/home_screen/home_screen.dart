import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/theme/presentation/bloc/theme_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final themeState = state as ThemeInitial;
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/app_back.png'),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                Container(
                  height: 100,
                  color: Colors.white.withOpacity(0.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            context.read<ThemeBloc>().add(ToggleThemeEvent());
                          },
                          icon: Icon(themeState.icon))
                    ],
                  ),
                ),
                Text(
                  themeState.mode == 'Day' ? 'Day Mode' : 'Night Mode',
                  style: TextStyle(
                      color: themeState.mode == 'Day'
                          ? Colors.black
                          : Colors.white),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
