import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_arc_management/Model/fav_model.dart';
import 'package:flutter_bloc_arc_management/bloc/favourite/fav_bloc.dart';
import 'package:flutter_bloc_arc_management/bloc/favourite/fav_event.dart';
import 'package:flutter_bloc_arc_management/bloc/favourite/fav_state.dart';

class FavView extends StatefulWidget {
  const FavView({super.key});

  @override
  State<FavView> createState() => _FavViewState();
}

class _FavViewState extends State<FavView> {
  @override
  @override
  void initState() {
    super.initState();
    context.read<FavBloc>().add(FetchFavourItemList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App'),
        actions: [
          BlocBuilder<FavBloc, FavouriteItemState>(
            builder: (context, state) {
              return Visibility(
                visible: state.temFavouriteItemList.isNotEmpty? true:false,
                child: IconButton(onPressed: (){
                  context.read<FavBloc>().add(RemoveItem());
                }, icon: Icon(Icons.delete))
              );
            },
          )
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:
            BlocBuilder<FavBloc, FavouriteItemState>(builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.Loading:
              return const Center(child: CircularProgressIndicator());
            case ListStatus.Complete:
              return ListView.builder(
                  itemCount: state.favouriteItemList.length,
                  itemBuilder: (context, index) {
                    final item = state.favouriteItemList[index];
                    return Card(
                      child: ListTile(
                        leading: Checkbox(
                            //if items exits true otherwise false
                            value: state.temFavouriteItemList.contains(item)
                                ? true
                                : false,
                            onChanged: (value) {
                              if (value!) {
                                context
                                    .read<FavBloc>()
                                    .add(SelectItem(item: item));
                              } else {
                                context
                                    .read<FavBloc>()
                                    .add(UnSelectItem(item: item));
                              }
                            }),
                        title: Text(item.value.toString()),
                        trailing: IconButton(
                            onPressed: () {
                              FavouriteItemModel favouriteItemModel = FavouriteItemModel(
                                  id: item.id, 
                                  value: item.value,
                                isFavourite: item.isFavourite ? false : true
                              );
                              context.read<FavBloc>().add(FetchFavouriteItem(item:favouriteItemModel));
                            },
                            
                            icon: Icon(
                              item.isFavourite ? Icons.favorite:Icons.favorite_outline
                            )
                        ),
                      ),
                    );
                  });
            case ListStatus.Failure:
              return const Center(child: Text('Something went wrong'));
          }
        }),
      ),
    );
  }
}
