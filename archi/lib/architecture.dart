import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';

class ArchitectureScreen extends StatefulWidget {
  const ArchitectureScreen({Key? key}) : super(key: key);

  @override
  ArchitectureScreenState createState() => ArchitectureScreenState();
}

class ArchitectureScreenState extends State<ArchitectureScreen> {
  var _posts = <dynamic>[];

  Future<void> _loadPosts() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final responce = await get(url);
    final json = jsonDecode(responce.body) as List<dynamic>;
    _posts += json;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Provider(state: this, child: const _View());
  }
}

class Provider extends InheritedWidget {
  final ArchitectureScreenState state;
  const Provider({
    Key? key,
    required Widget child,
    required this.state,
  }) : super(
          key: key,
          child: child,
        );

  static Provider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>();
  }

  @override
  bool updateShouldNotify(Provider oldWidget) {
    return true;
  }
}

class _View extends StatelessWidget {
  const _View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewState =
        context.dependOnInheritedWidgetOfExactType<Provider>()!.state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('jsonplaceholder'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: viewState._loadPosts,
                child: const Text('Load posts'),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: viewState._posts.length,
                itemBuilder: (context, index) {
                  return _RowWidget(
                    title: viewState._posts[index]['title'] as String,
                    body: viewState._posts[index]['body'] as String,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RowWidget extends StatelessWidget {
  const _RowWidget({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  final String title, body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Text(body),
          const Divider(height: 30),
        ],
      ),
    );
  }
}
