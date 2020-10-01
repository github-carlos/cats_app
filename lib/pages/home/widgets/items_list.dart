import 'package:cat_app/pages/cats_list/cats_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ItemsList extends StatelessWidget {
  final String title;
  final List<dynamic> resource;
  final String resourceName;

  ItemsList({@required this.title, @required this.resource, @required this.resourceName}) {}
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Observer(
          builder: (_) => Container(
            height: 90,
            width: MediaQuery.of(context).size.width,
            child: resource != null
                ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: resource.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  print('clicou $index');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CatsList(
                            id: resource[index].id.toString(),
                            title: resource[index].name,
                            description: resource[index].description != null ? resource[index].description : null,
                            resourceName: resourceName,
                          )));
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text(
                      resource[index].name,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
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