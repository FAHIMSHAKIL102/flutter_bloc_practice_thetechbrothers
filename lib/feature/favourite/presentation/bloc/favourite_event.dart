part of 'favourite_bloc.dart';

sealed class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class FetchItemListEvent extends FavouriteEvent {}

class FetchFavouriteItemsEvent extends FavouriteEvent {
  final FavouriteItemModel item;
  const FetchFavouriteItemsEvent({required this.item});
}

class SelectedItemEvent extends FavouriteEvent {
  final FavouriteItemModel item;
  const SelectedItemEvent({required this.item});
}

class UnSelectedItemEvent extends FavouriteEvent {
  final FavouriteItemModel item;
  const UnSelectedItemEvent({required this.item});
}


class DeleteItemEvent extends FavouriteEvent{}