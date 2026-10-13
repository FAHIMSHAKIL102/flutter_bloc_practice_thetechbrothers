import 'package:flutter_bloc_practice_thetechbrothers/feature/favourite/data/model/favourite_item_model.dart';

class FavouriteRepository {
  Future<List<FavouriteItemModel>> fetchItem() async {
    await Future.delayed(Duration(seconds: 3));
    return _generateList(10);
  }

  List<FavouriteItemModel> _generateList(int length) {
    return List.generate(
      length,
      ((index) =>
          FavouriteItemModel(id: index.toString(), value: 'Item $index')),
    );
  }
}
