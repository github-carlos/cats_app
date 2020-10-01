import 'package:cat_app/pages/home/widgets/items_list.dart';
import 'package:cat_app/stores/cat_api_store.dart';
import 'package:cat_app/stores/page_view_controller_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final PageViewControllerStore pageViewControllerStore =
      GetIt.instance.get<PageViewControllerStore>();
  final CatApiStore catApiStore = GetIt.instance.get<CatApiStore>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height + 100,
      child: Container(
        child: Observer(
          builder: (_) => PageView(
            controller: pageViewControllerStore.pageController,
            onPageChanged: (int page) {
              pageViewControllerStore.changeCurrentPage(page);
            },
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ItemsList(
                      title: 'Breeds',
                      resource: catApiStore.breeds,
                      resourceName: 'breed'
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ItemsList(
                          title: 'Categories',
                          resource: catApiStore.categories,
                          resourceName: 'category')),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Random Cats',
                          style: TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                        IconButton(icon: Icon(Icons.refresh_sharp, size: 30,), onPressed: () {
                          catApiStore.loadRandomImages(1);
                        })
                      ],
                    ),
                  ),
                  Expanded(
                    child: catApiStore.randomImages != null
                        ? GridView.builder(
                            gridDelegate:
                                new SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemCount: catApiStore.randomImages.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                    catApiStore.randomImages[index].url),
                              );
                            })
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                  ),
                ],
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}


