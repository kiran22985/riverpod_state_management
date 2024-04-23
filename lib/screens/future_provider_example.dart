import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/models/user.dart';
import 'package:riverpod_state_management/services/get_user.dart';

final apiProvider = Provider<ApiService>((ref) {
  return ApiService();
});
final userDataProvider =
    FutureProvider<List<UserModel>>((ref) => ref.read(apiProvider).getUsers());

class UserPage extends ConsumerStatefulWidget {
  const UserPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserPageState();
}

class _UserPageState extends ConsumerState<UserPage> {
  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userDataProvider);
    return Scaffold(
        body: userData.when(data: (data) {
      return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(data[index].name),
              subtitle: Text(data[index].email),
            );
          });
    }, error: ((error, stackTrace) {
      return Text(error.toString());
    }), loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }));
  }
}
