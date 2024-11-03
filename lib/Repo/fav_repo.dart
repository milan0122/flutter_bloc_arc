import 'package:flutter_bloc_arc_management/Model/fav_model.dart';

class FavRepo {
  Future<List<FavouriteItemModel>> fetchItem() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.of(_generateList(10));
  }

  List<FavouriteItemModel> _generateList(int length) {
    return List.generate(length, (index) =>
        FavouriteItemModel(id: index.toString(), value: 'Item $index',));
  }
}