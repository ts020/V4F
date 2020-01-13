import 'package:flutter/material.dart';

import 'catalog/Catalog.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Simple Material App",
      home: Scaffold(
        body: Container(
          child: Catalog(),
        ),
      )
    )
//    Catalog(),
  );
}
