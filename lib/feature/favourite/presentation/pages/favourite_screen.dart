import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/favourite/data/model/favourite_item_model.dart';
import 'package:flutter_bloc_practice_thetechbrothers/feature/favourite/presentation/bloc/favourite_bloc.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteBloc>().add(FetchItemListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('F A V O U R I T E'),
        actions: [
          BlocBuilder<FavouriteBloc, FavouriteState>(
            builder: (context, state) {
              return Visibility(
                visible: state.selectedItemList.isNotEmpty ? true : false,
                child: IconButton(
                  onPressed: () {
                    context.read<FavouriteBloc>().add(DeleteItemEvent());
                  },
                  icon: Icon(Icons.delete, color: Colors.redAccent),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<FavouriteBloc, FavouriteState>(
          builder: (context, state) {
            switch (state.listStatus) {
              case ListStatus.loading:
                return Center(child: CircularProgressIndicator());
              case ListStatus.failure:
                return Text('Something went wrong');
              case ListStatus.success:
                return ListView.builder(
                  itemCount: state.favouriteItemList.length,
                  itemBuilder: (context, index) {
                    final item = state.favouriteItemList[index];
                    return Card(
                      child: ListTile(
                        leading: Checkbox(
                          fillColor: state.selectedItemList.contains(item)
                              ? WidgetStatePropertyAll<Color>(Colors.green)
                              : WidgetStatePropertyAll<Color>(
                                  Colors.transparent,
                                ),
                          value: state.selectedItemList.contains(item)
                              ? true
                              : false,
                          onChanged: (value) {
                            if (value!) {
                              context.read<FavouriteBloc>().add(
                                SelectedItemEvent(item: item),
                              );
                            } else {
                              context.read<FavouriteBloc>().add(
                                UnSelectedItemEvent(item: item),
                              );
                            }
                          },
                        ),
                        title: Text(item.value.toString()),
                        trailing: IconButton(
                          onPressed: () {
                            FavouriteItemModel favouriteItem =
                                FavouriteItemModel(
                                  id: item.id,
                                  value: item.value,
                                  isFavourite: item.isFavourite ? false : true,
                                );
                            context.read<FavouriteBloc>().add(
                              FetchFavouriteItemsEvent(item: favouriteItem),
                            );
                          },
                          icon: item.isFavourite
                              ? Icon(Icons.favorite, color: Colors.red)
                              : Icon(Icons.favorite_border_outlined),
                        ),
                      ),
                    );
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
