import 'package:cat_app/stores/cat_api_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get_it/get_it.dart';

class CatsList extends StatefulWidget {
  final String id;
  final String title;
  final String description;
  final String resourceName;

  List<dynamic> cats;

  CatsList(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.resourceName}) {}

  @override
  _CatsListState createState() => _CatsListState();
}

class _CatsListState extends State<CatsList> {
  CatApiStore catApiStore = GetIt.instance.get<CatApiStore>();

  ScrollController scrollController = ScrollController();
  bool showDescription = true;

  _CatsListState() {
    scrollController.addListener(() {
      print(scrollController.offset);
      if (scrollController.offset >= 4) {
        setState(() {
          showDescription = false;
        });
      } else {
        setState(() {
          showDescription = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    catApiStore.getCatListImages(widget.resourceName, widget.id, 1, 10);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    catApiStore.clearCatsListImages();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
          body: catApiStore.catImagesList != null
              ? CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Colors.yellow,
                      leading: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.black,
                        ),
                      ),
                      expandedHeight: widget.description != null ? 150 : 50,
                      floating: false,
                      pinned: true,
                      snap: false,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Center(
                            child: Text(
                          widget.title.toUpperCase(),
                          style: TextStyle(color: Colors.amber),
                        )),
                        titlePadding: EdgeInsets.all(8.0),
                      ),
                      bottom: PreferredSize(
                        child: Center(
                          child: widget.description != null && showDescription
                              ? Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    widget.description,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.0),
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                    SliverStaggeredGrid.countBuilder(
                      itemCount: catApiStore.catImagesList.length,
                      crossAxisCount: 2,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onDoubleTap: () {
                            print('favoritou');
                            catApiStore.saveFavorite(catApiStore.catImagesList[index].id);
                          },
                          child: Image.network(
                              catApiStore.catImagesList[index].url),
                        );
                      },
                      staggeredTileBuilder: (int index) =>
                          new StaggeredTile.fit(2),
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                    )
                  ],
                )
              : Center(child: CircularProgressIndicator())),
    );
  }
}
