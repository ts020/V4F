import 'package:catalog/chart/painters.catalog.dart';
import 'package:flutter/material.dart';

class Catalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShRectPainterCatalog();
  }
}

class CatalogList extends StatelessWidget {
  final List<CatalogClass> items;
  CatalogList(this.items);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text(
            items[index].title,
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GestureDetector(
                          child: items[index] as Widget,
//                      onDoubleTap: () => Navigator.pop(context),
                        )));
          }),
      itemCount: items.length,
    );
  }
}

class CatalogCard extends StatelessWidget {
  final Widget child;
  final Widget option;
  final String title;
  const CatalogCard({this.child, this.title, this.option});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 16,
      margin: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ListTile(
            title: Text(
              title ?? child.runtimeType.toString(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: child,
          ),
          SizedBox.fromSize(size: Size(0, 16))
        ],
      ),
    );
  }
}

mixin CatalogClass {
  String get title {
    return runtimeType.toString();
  }
}

class CatalogScaffold extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final Widget child;
  final Key _key;
  const CatalogScaffold({
    @required this.title,
    this.children,
    this.child,
    Key key,
  })  : assert(!(children != null && child != null)),
        assert(!(children == null && child == null)),
        _key = key;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      key: _key,
      body: child ??
          ListView(
            padding: const EdgeInsets.all(16),
            children: children,
          ),
    );
  }
}

class CatalogSingleCardScaffold extends StatelessWidget {
  final String title;
  final Widget child;
  CatalogSingleCardScaffold({@required this.title, @required this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(title)), body: child);
  }
}
