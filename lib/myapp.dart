import 'package:efash/core/injector.dart/dependency_injection.dart';
import 'package:efash/core/router/routes.dart';
import 'package:efash/features/cart/blocs/bloc.dart';
import 'package:efash/features/products/blocs/carousel/bloc.dart';
import 'package:efash/features/products/blocs/home/bloc.dart';
import 'package:efash/features/products/pages/navbar.dart';
import 'package:efash/features/watchlist/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CarouselBloc>(
          create: (context) => sl<CarouselBloc>(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => sl<HomeBloc>(),
        ),
        BlocProvider<WatchListBloc>(
          create: (context) => sl<WatchListBloc>(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => sl<CartBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: EAppRoutes.home,
        onGenerateRoute: EAppRoutes.generateRoute,
        theme: ThemeData(
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.black,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
