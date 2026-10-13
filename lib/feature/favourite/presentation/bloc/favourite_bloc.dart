import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/favourite/data/model/favourite_item_model.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/favourite/domain/repository/favourite_repository.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteRepository favouriteRepository;
  List<FavouriteItemModel> favouriteItemList = [];
  List<FavouriteItemModel> selectedItemList = [];
  FavouriteBloc(this.favouriteRepository) : super(FavouriteState()) {
    on<FetchItemListEvent>(fetchFavouriteListEvent);
    on<FetchFavouriteItemsEvent>(fetchFavouriteItemsEvent);
    on<SelectedItemEvent>(selectedItemEvent);
    on<UnSelectedItemEvent>(unSelectedItemEvent);
    on<DeleteItemEvent>(deleteItemEvent);
  }

  FutureOr<void> fetchFavouriteListEvent(
    FetchItemListEvent event,
    Emitter<FavouriteState> emit,
  ) async {
    favouriteItemList = await favouriteRepository.fetchItem();
    emit(
      state.copyWith(
        favouriteItemList: List.from(favouriteItemList),
        listStatus: ListStatus.success,
      ),
    );
  }

  FutureOr<void> fetchFavouriteItemsEvent(
    FetchFavouriteItemsEvent event,
    Emitter<FavouriteState> emit,
  ) {
    final index = favouriteItemList.indexWhere(
      (test) => test.id == event.item.id,
    );

    if (event.item.isFavourite) {
      if (selectedItemList.contains(favouriteItemList[index])) {
        selectedItemList.remove(favouriteItemList[index]);
        selectedItemList.add(event.item);
      }
    } else {
      if (selectedItemList.contains(favouriteItemList[index])) {
        selectedItemList.remove(favouriteItemList[index]);
        selectedItemList.add(event.item);
      }
    }

    favouriteItemList[index] = event.item;
    emit(
      state.copyWith(
        favouriteItemList: List.from(favouriteItemList),
        selectedItemList: List.from(selectedItemList),
      ),
    );
  }

  FutureOr<void> selectedItemEvent(
    SelectedItemEvent event,
    Emitter<FavouriteState> emit,
  ) {
    selectedItemList.add(event.item);
    emit(state.copyWith(selectedItemList: List.from(selectedItemList)));
  }

  FutureOr<void> unSelectedItemEvent(
    UnSelectedItemEvent event,
    Emitter<FavouriteState> emit,
  ) {
    selectedItemList.remove(event.item);
    emit(state.copyWith(selectedItemList: List.from(selectedItemList)));
  }

  FutureOr<void> deleteItemEvent(
    DeleteItemEvent event,
    Emitter<FavouriteState> emit,
  ) async {
    for (int i = 0; i < selectedItemList.length; i++) {
      favouriteItemList.remove(selectedItemList[i]);
    }
    selectedItemList.clear();
    emit(
      state.copyWith(
        favouriteItemList: List.from(favouriteItemList),
        selectedItemList: List.from(selectedItemList),
      ),
    );
  }
}
