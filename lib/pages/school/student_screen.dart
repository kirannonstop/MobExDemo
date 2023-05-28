import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../mobx/models/models.dart';
import '../../mobx/store/school_store/student_store.dart';

class StudentScreen extends StatelessWidget {
  final StudentStore studentStore;

  StudentScreen({super.key, required this.studentStore}) {
    studentStore.getTheUsers();
  }

  @override
  Widget build(BuildContext context) {
    final future = studentStore.userListFuture;
    return Scaffold(
      appBar: AppBar(
        title: Text("Students"),
      ),
      body: Observer(
        builder: (_) {
          switch (future?.status) {
            case FutureStatus.pending:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case FutureStatus.fulfilled:
              final List<User> userList = future?.result;
              //print(userList);
              return RefreshIndicator(
                onRefresh: _refresh,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    final user = userList[index];

                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar ?? ""),
                        radius: 25,
                      ),
                      title: Text(
                        user.name ?? "-",
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        user.email ?? "-",
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400),
                      ),
                      trailing: Text(
                        user.followers.toString(),
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
      ),
    );
  }

  Future _refresh() {
    return studentStore.fetchUsers();
  }
}
