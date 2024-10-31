import 'package:efash/features/cart/blocs/bloc.dart';
import 'package:efash/features/cart/data/db/cart_db.dart';
import 'package:efash/features/watchlist/data/watchlist.dart';
import 'package:efash/features/products/blocs/carousel/bloc.dart';
import 'package:efash/features/products/blocs/home/bloc.dart';
import 'package:efash/features/watchlist/bloc/bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => CarouselBloc(),
  );

  sl.registerLazySingleton(
    () => WatchlistDbHelper(),
  );

  sl.registerLazySingleton(
    () => CartOperations(),
  );

  sl.registerFactory(() => HomeBloc());

  sl.registerFactory(() => WatchListBloc(sl()));

  sl.registerFactory(() => CartBloc(sl()));
}
