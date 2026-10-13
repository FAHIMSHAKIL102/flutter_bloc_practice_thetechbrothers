part of 'favourite_bloc.dart';

enum ListStatus { loading, success, failure }

class FavouriteState extends Equatable {
  final List<FavouriteItemModel> favouriteItemList;
  final List<FavouriteItemModel> selectedItemList;
  final ListStatus listStatus;
  const FavouriteState({
    this.favouriteItemList = const [],
    this.selectedItemList = const [],
    this.listStatus = ListStatus.loading,
  });

  FavouriteState copyWith({
    List<FavouriteItemModel>? favouriteItemList,
    List<FavouriteItemModel>? selectedItemList,
    ListStatus? listStatus,
  }) {
    return FavouriteState(
      favouriteItemList: favouriteItemList ?? this.favouriteItemList,
      selectedItemList: selectedItemList ?? this.selectedItemList,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  List<Object> get props => [favouriteItemList, selectedItemList, listStatus];
}

final class FavouriteInitial extends FavouriteState {}
