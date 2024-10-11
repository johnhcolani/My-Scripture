import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_scripture/home_screen/home_screen.dart';

import 'bloc/splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    BlocProvider.of<SplashBloc>(context).add(StartSplash());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
       if(state is SplashCompleted){
         Navigator.of(context).pushReplacement(
           MaterialPageRoute(builder: (context)=>const HomeScreen()),
         );
       }
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/splash_background.png'))
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 128.0),
            child: Center(child: Text('My Scripture',
              style: GoogleFonts.lemon(fontSize: 24, color: Colors.white),),),
          ),
        ),
      ),
    );
  }
}
