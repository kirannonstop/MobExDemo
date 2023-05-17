import 'package:first_mobex_flutter_project/mobx/store/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../mobx/models/models.dart';

class UserList extends StatelessWidget {
  UserStore userStore = UserStore();

  UserList({super.key}) {
    userStore.getTheUsers();
  }

  Future _refresh() {
    return userStore.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    final future = userStore.userListFuture;
    return ReactionBuilder(
      builder: (context) {
        return reaction((_) => userStore.lastComputedUser, (lastComputedUser) {
          print("USER ---> ${lastComputedUser?.email} ");
          // if (lastComputedUser != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("This is snackbar ${lastComputedUser?.email}")));
          //}
        });
      },
      child: Observer(
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
}
