import 'package:equatable/equatable.dart';

class FavouriteItemModel extends Equatable{
  final String id;
  final String value;
  final bool isDelete;
  final bool isFavourite;
  FavouriteItemModel({
    required this.id,
    required this.value,
    this.isDelete = false,
    this.isFavourite = false
});

  FavouriteItemModel copyWith({String? id, String? value, bool? isDelete,bool? isFavourite}){
    return FavouriteItemModel(
        id: id ?? this.id,
        value: value?? this.value,
        isDelete: isDelete?? this.isDelete,
        isFavourite: isFavourite?? this.isFavourite
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [id,value,isDelete,isFavourite];
}