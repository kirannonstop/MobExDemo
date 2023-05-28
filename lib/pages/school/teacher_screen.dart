import 'package:first_mobex_flutter_project/mobx/store/school_store/teacher_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../mobx/models/models.dart';

class TeacherScreen extends StatelessWidget {
  final TeacherStore teacherStore;

  TeacherScreen({super.key, required this.teacherStore}) {
    teacherStore.getThePost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Teachers"),
      ),
      body: setData(),
    );
  }

  setData() {
    final future = teacherStore.postListFuture;
    return Observer(
      builder: (_) {
        switch (future?.status) {
          case FutureStatus.pending:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case FutureStatus.fulfilled:
            final List<Post> userList = future?.result;
            //print(userList);
            return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  final post = userList[index];

                  return ListTile(
                    title: Text(
                      post.title ?? "-",
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      post.body ?? "-",
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ),
                    trailing: Text(
                      post.id.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 15),
                    ),
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
      },
    );
  }

  Future _refresh() {
    return teacherStore.fetchPost();
  }
}
