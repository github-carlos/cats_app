import 'package:cat_app/models/Breed.dart';
import 'package:cat_app/services/cats_api.dart';
import 'package:cat_app/stores/cat_api_store.dart';
import 'package:cat_app/stores/page_view_controller_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

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
    return Expanded(
      child: Container(
        child: Observer(
          builder: (_) => PageView(
            controller: pageViewControllerStore.pageController,
            onPageChanged: (int page) {
              pageViewControllerStore.changeCurrentPage(page);
            },
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ItemsList(
                      title: 'Breeds',
                      resource: catApiStore.breeds,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ItemsList(
                          title: 'Categories', resource: catApiStore.categories)),
                  Expanded(
                    child: catApiStore.randomImages != null ? GridView.builder(
                        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemCount: catApiStore.randomImages.length,
                        itemBuilder: (context, index) {
                          return Image.network(catApiStore.randomImages[index].url);
                        }) : Center(
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

class ItemsList extends StatelessWidget {
  final String title;
  final List<dynamic> resource;

  ItemsList({@required this.title, @required this.resource}) {}
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Observer(
          builder: (_) => Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: resource != null
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: resource.length,
                    itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.all(10),
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(resource[index].name),
                      ),
                    ),
                  )
                : Center(child: CircularProgressIndicator()),
          ),
        )
      ],
    );
  }
}
