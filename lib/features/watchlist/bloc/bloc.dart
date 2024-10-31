import 'package:efash/features/watchlist/data/watchlist.dart';
import 'package:efash/features/watchlist/bloc/event.dart';
import 'package:efash/features/watchlist/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchListBloc extends Bloc<WatchListEvents, WatchListStates> {
  final WatchlistDbHelper watchlist;
  WatchListBloc(this.watchlist) : super(WatchlistInitial()) {
    on<AddToWatchList>(_onAddToWatchList);
    on<FetchWatchList>(_onFetchWatchList);
    on<RemoveFromWatchList>(_onRemoveFromWatchList);
    on<CheckProductInWatchList>(_onCheckProductInWatchList);
    on<ToggleWatchListItem>(_onToggleWatchListItem);
  }

  Future<void> _onAddToWatchList(
      AddToWatchList event, Emitter<WatchListStates> emit) async {
    emit(WatchlistLoading());
    try {
      await watchlist.addToWatchList(event.productLocal);
      add(FetchWatchList());
      print("Successfully added item to watchlist");
    } catch (e) {
      print("Error adding to watchlist: $e");
      emit(WatchListError("Error while adding to watchlist"));
    }
  }

  Future<void> _onFetchWatchList(
      FetchWatchList event, Emitter<WatchListStates> emit) async {
    emit(WatchlistLoading());
    try {
      final watchlistItems = await watchlist.getWatchlistItem();
      emit(WatchListLoaded(watchlistItems));
    } catch (e) {
      print("Error fetching watchlist: $e");
      emit(WatchListError('Error while fetching items from watchlist'));
    }
  }

  Future<void> _onRemoveFromWatchList(
      RemoveFromWatchList event, Emitter<WatchListStates> emit) async {
    emit(WatchlistLoading());
    try {
      await watchlist.removeFromWatchlist(event.id);
      add(FetchWatchList());
      print('Successfully removed item ${event.id} from Watchlist');
    } catch (e) {
      print('Error removing from watchlist: $e');
      emit(WatchListError('Error while Deleting items from watchlist'));
    }
  }

  Future<void> _onCheckProductInWatchList(
      CheckProductInWatchList event, Emitter<WatchListStates> emit) async {
    emit(WatchlistLoading());
    try {
      final isInWatchList = await watchlist.isProductInWatchlist(event.id);
      print('From BLOC : $isInWatchList');
      emit(WatchistProductStatus(isInWatchList,event.id));
    } catch (e) {
      emit(WatchListError('Error while checking'));
    }
  }

  Future<void> _onToggleWatchListItem(
      ToggleWatchListItem event, Emitter<WatchListStates> emit) async {
    emit(WatchlistLoading());
    try {
      final isInWatchList =
          await watchlist.isProductInWatchlist(event.product.id);

      if (isInWatchList) {
        await watchlist.removeFromWatchlist(event.product.id);
        emit(WatchlistOperationSuccess("Item removed from watchlist"));
      } else {
        await watchlist.addToWatchList(event.product);
        emit(WatchlistOperationSuccess("Item added to watchlist"));
      }

      // Refresh the watchlist and update the item's status
      add(FetchWatchList());
      add(CheckProductInWatchList(event.product.id));
    } catch (e) {
      print('Error toggling watchlist item: $e');
      emit(WatchListError('Error while updating watchlist'));
    }
  }
}
