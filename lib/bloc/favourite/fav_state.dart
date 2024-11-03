import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_arc_management/Model/fav_model.dart';
enum ListStatus{Loading,Complete, Failure}
class FavouriteItemState extends Equatable{

  final List<FavouriteItemModel> favouriteItemList;
  final List<FavouriteItemModel> temFavouriteItemList;
  final ListStatus listStatus ;
 const FavouriteItemState({
    this.favouriteItemList = const[],
    this.listStatus = ListStatus.Loading,
    this.temFavouriteItemList = const []
});
  FavouriteItemState copyWith({List<FavouriteItemModel> ?favouriteItemList,ListStatus ?listStatus,List<FavouriteItemModel> ?temFavouriteItemList }){
    return FavouriteItemState(
      favouriteItemList: favouriteItemList ?? this.favouriteItemList,
      temFavouriteItemList: temFavouriteItemList ?? this.temFavouriteItemList,
      listStatus: listStatus ?? this.listStatus
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [favouriteItemList,temFavouriteItemList,listStatus];

}
