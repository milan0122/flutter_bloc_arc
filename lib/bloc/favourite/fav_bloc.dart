import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_arc_management/Model/fav_model.dart';
import 'package:flutter_bloc_arc_management/Repo/fav_repo.dart';
import 'package:flutter_bloc_arc_management/bloc/favourite/fav_event.dart';
import 'package:flutter_bloc_arc_management/bloc/favourite/fav_state.dart';

class FavBloc extends Bloc<FavouriteEvents, FavouriteItemState> {
  FavRepo favRepo ;
 List<FavouriteItemModel> favList =[];
 List<FavouriteItemModel> temFavList =[];

  FavBloc(this.favRepo) : super(FavouriteItemState()) {
    on<FetchFavourItemList>((_fetchList));
    on<FetchFavouriteItem>((_addFavItem));
    on<SelectItem>((_selectFavItem));
    on<UnSelectItem>((_unselectFavItem));
    on<RemoveItem>((_removeFavItem));

  }
  void _fetchList(FetchFavourItemList event , Emitter<FavouriteItemState> emit)async{
    favList  = await favRepo.fetchItem();
    emit(state.copyWith(favouriteItemList: List.from(favList),listStatus:ListStatus.Complete ));

  }

  void _addFavItem (FetchFavouriteItem event , Emitter<FavouriteItemState> emit)async{
    final index = favList.indexWhere((element)=>element.id == event.item.id);

    if(event.item.isFavourite){
      if(temFavList.contains(favList[index])){
        temFavList.remove(favList[index]);
        temFavList.add(event.item);
      }
    }
    else{
      if(temFavList.contains(favList[index])){
        temFavList.remove(favList[index]);
        temFavList.add(event.item);
      }


    }
    favList[index] = event.item;
    emit(state.copyWith(
        favouriteItemList: List.from(favList),
      temFavouriteItemList: List.from(temFavList)
    ));


  }
  void _selectFavItem (SelectItem event , Emitter<FavouriteItemState> emit)async{
    temFavList.add(event.item);
    emit(state.copyWith(temFavouriteItemList: List.from(temFavList)));


  }
  void _unselectFavItem (UnSelectItem event , Emitter<FavouriteItemState> emit)async{
    temFavList.remove(event.item);
    emit(state.copyWith(temFavouriteItemList: List.from(temFavList)));


  }
  void _removeFavItem(RemoveItem event , Emitter<FavouriteItemState> emit)async{
    for(int i = 0;i<temFavList.length;i++){
      favList.remove(temFavList[i]);
    }
    temFavList.clear();
    emit(state.copyWith(
        favouriteItemList: List.from(favList),
        temFavouriteItemList: List.from(temFavList)));


  }

}
