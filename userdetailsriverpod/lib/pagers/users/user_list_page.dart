import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:userdetailsriverpod/pages/users/users_providers.dart';

// import 'user_detail_page.dart';
import '../../pages/users/user_detail_page.dart';
// import 'users_providers.dart';

class UserListPage extends ConsumerWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userList = ref.watch(userListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: userList.when(
        data: (users) {
          return ListView.separated(
            itemCount: users.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              final user = users[index];

              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return UserDetailPage(userId: user.id);
                      },
                    ),
                  );
                },
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(user.id.toString()),
                  ),
                  title: Text(user.name),
                ),
              );
            },
          );
        },
        error: (e, st) {
          return Center(
            child: Text(
              e.toString(),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.red,
              ),
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}