import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_arc_management/Model/fav_model.dart';
abstract class FavouriteEvents extends Equatable{
  const FavouriteEvents();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class FetchFavourItemList extends FavouriteEvents{}

class FetchFavouriteItem extends FavouriteEvents{
  final FavouriteItemModel item;
  const FetchFavouriteItem({required this.item});

}
class SelectItem extends FavouriteEvents{
  final FavouriteItemModel item;
  const SelectItem({required this.item});

}
class UnSelectItem extends FavouriteEvents{
  final FavouriteItemModel item;
  const UnSelectItem({required this.item});

}
class RemoveItem extends FavouriteEvents{


}