import 'package:cat_app/stores/cat_api_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get_it/get_it.dart';

class Favorites extends StatelessWidget {
  final catApiStore = GetIt.instance.get<CatApiStore>();

  Favorites() {
    catApiStore.loadFavoriteImages();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            'Favoritos',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Expanded(
              child: Container(
                child: Observer(
                  builder: (_) => catApiStore.favoriteImages != null
                      ? Container(
                          margin: EdgeInsets.only(top: 40),
                          height: MediaQuery.of(context).size.height + 300,
                          child: new StaggeredGridView.countBuilder(
                            crossAxisCount: 4,
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.only(top: 40),
                            itemCount: catApiStore.favoriteImages.length,
                            itemBuilder: (BuildContext context, int index) =>
                                GestureDetector(
                                  onLongPress: () {
                                    print('long pressed');
                                    showDialog(context: context, builder: (context) {
                                      return AlertDialog(
                                        title: Text('Remover'),
                                        actions: [
                                          FlatButton(onPressed: () async {
                                            await catApiStore.removeFavorite(index);
                                            Navigator.pop(context);
                                          }, child: Text('Remover favorito')),
                                          FlatButton(onPressed: () => Navigator.pop(context), child: Text('Cancelar')),
                                        ],
                                      );
                                    });
                                  },
                              child: Image.network(
                                  catApiStore.favoriteImages[index].image.url),
                            ),
                            staggeredTileBuilder: (int index) =>
                                new StaggeredTile.count(
                                    2, index.isEven ? 2 : 1),
                            mainAxisSpacing: 4.0,
                            crossAxisSpacing: 4.0,
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
