import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_application/bloc/login/login_bloc.dart';
import 'package:shopping_application/bloc/signup/register_bloc.dart';
import 'package:shopping_application/data/remote/api_helper.dart';
import 'package:shopping_application/ui/screens/splash_screen.dart';

void main() {
  // runApp(BlocProvider(create: (context) => RegisterBloc(apiHelper: ApiHelper()), child: MyApp(),));
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => RegisterBloc(apiHelper: ApiHelper())),
    BlocProvider(create: (context) => LoginBloc(apiHelper: ApiHelper())),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}