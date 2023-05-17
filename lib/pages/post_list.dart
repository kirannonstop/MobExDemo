import 'package:first_mobex_flutter_project/mobx/models/models.dart';
import 'package:first_mobex_flutter_project/mobx/store/post_store.dart';
import 'package:first_mobex_flutter_project/network/api_service_abstract_class_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

class PostList extends StatelessWidget {
  PostStore postStore = PostStore(ApiServiceAbstractClassImpl(http.Client()));

  PostList({super.key}) {
    postStore.getThePost();
  }

  Future _refresh() {
    return postStore.fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    final future = postStore.postListFuture;
    return Observer(builder: (_) {
      switch (future?.status) {
        case FutureStatus.pending:
          return const Center(
            child: CircularProgressIndicator(),
          );

        case FutureStatus.fulfilled:
          List<Post> postList = future?.result;
          print(postList);
          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: postList.length,
              itemBuilder: (context, index) {
                final post = postList[index];
                return ExpansionTile(
                  title: Text(
                    post.title ?? "-",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  children: <Widget>[Text(post.body ?? "-")],
                );
              },
            ),
          );
        case FutureStatus.rejected:
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Failed to load items.',
                  style: TextStyle(color: Colors.red),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: _refresh,
                  child: const Text('Tap to retry'),
                )
              ],
            ),
          );
        default:
          return Container();
      }
    });
  }
}
