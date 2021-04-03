import 'package:flutter/material.dart';

import 'utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReorderableListViewのサンプル',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final platformName = Utils.getPlatformName();
    return Scaffold(
      appBar: AppBar(
        title: Text('${platformName}で動作しています'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('buildDefaultDragHandles：ON'),
            Expanded(child: _ReorderableListView(5, true),),
            Text('buildDefaultDragHandles：OFF'),
            Expanded(child: _ReorderableListView(5, false),),
          ],
        ),
      ),
    );
  }

  Widget _ReorderableListView(int listCount, bool buildDefaultDragHandles) {

    // リストを作成する
    final list = <int>[];
    for (int i = 0; i < listCount ; i++) {
      list.add(i + 1);
    }

    return ReorderableListView(
      buildDefaultDragHandles: buildDefaultDragHandles,
      children: list.map(
            (int number) {
              return Card(
                elevation: 2.0,
                key: Key('${number}'),
                child: ListTile(
                  leading: Icon(Icons.people),
                  title: Text('${number}'),
                ),
              );
              },
      ).toList(),
      onReorder: (oldIndex, newIndex) => {
          // 本サンプルでは実装しない
      },
    );
  }
}
