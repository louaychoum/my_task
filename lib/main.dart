import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:task_app/empty_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Map<String, String>> testList = [
    {
      'name': 'test',
      'detail': 'fadsl;kasjf33',
    },
    {
      'name': 'louay',
      'detail': 'bvjxjj344',
    },
    {
      'name': 'ahmad',
      'detail': 'npppp33344',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Contacts',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                child: Text(
                  'Add New Contact',
                  style: TextStyle(
                    color: Colors.lightBlue,
                  ),
                ),
                onTap: () {},
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(
              15,
            ),
            color: Colors.blueGrey[50],
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: testList.length,
              itemBuilder: (context, index) {
                final testItem = testList[index];
                return Slidable(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Icon(
                        Icons.credit_card,
                      ),
                    ),
                    title: Text(
                      testItem['name'] ?? '',
                    ),
                    subtitle: Text(
                      testItem['detail'] ?? '',
                    ),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EmptyScreen(),
                      ),
                    ),
                  ),
                  actionPane: SlidableBehindActionPane(),
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      foregroundColor: Colors.red,
                      caption: 'Delete',
                      color: Colors.blueGrey[50],
                      icon: Icons.delete,
                      onTap: () {},
                    ),
                    IconSlideAction(
                      caption: 'Edit',
                      color: Colors.blueGrey[50],
                      icon: Icons.edit,
                      onTap: () {},
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
