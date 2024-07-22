import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fullstackwithflutter_ui/providers/user_provider.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
              appBar: AppBar(title: const Text("User List"),),
              body: Center(
                child: Column(
                  children: const[
                  Text("test"),
                  UsersListView(),
                  ],
                  ),
                  ),
              ),
          );
  }
}

class UsersListView extends ConsumerWidget {
  const UsersListView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final lstUsers=ref.watch(usersList);


    return lstUsers.when(
                data:(users){
                  return  Expanded(
                  child: ListView.builder(
                    itemCount:users.data.length,
                    itemBuilder: (BuildContext context,int index){
                      return Padding(padding: const EdgeInsets.all(8.0),
                      child: Card(child: ListTile(
                        title: Text(users.data[index].fullName),
                        subtitle: Text(users.data[index].mobileNumber.toString()) ,
                      ),
                      ),
                      );
                    }
                    ),
                );
                },
                error: (err,stack)=>Text('Error $err'),
                loading: ()=>const Center(child: CircularProgressIndicator(),));
  }
}
