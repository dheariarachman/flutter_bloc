import 'package:fetch_data/src/blocs/posts_bloc.dart';
import 'package:fetch_data/src/models/post.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    postBloc.fetchListPost();
    super.initState();
  }

  @override
  void dispose() {
    postBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: StreamBuilder(
          stream: postBloc.listPost,
          builder: (context, AsyncSnapshot<List<Post>> post) {
            return post.hasData
                ? buildList(post)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ));
  }

  Widget buildList(AsyncSnapshot<List<Post>> post) {
    if (post.hasError) {
      return Center(
        child: Text(post.error),
      );
    }
    return Container(
      decoration: BoxDecoration(color: Colors.grey[300]),
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: post.data.length,
        padding: const EdgeInsets.only(top: 8.0),
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: FlatButton(
            child: ListTile(
              title: Text(post.data[index].title),
              subtitle: Text(post.data[index].body),
            ),
            onPressed: () {},
          ));
        },
      ),
    );
  }
}
