
import 'package:fullstackwithflutter_ui/models/user.dart';
import 'package:riverpod/riverpod.dart';
import 'package:fullstackwithflutter_ui/repositories/user_repository.dart';

final UserRepositoryProvider = Provider<IUserRepository>((ref)=>UserRepository());

final usersList=FutureProvider.autoDispose<UserResponse>((ref) async{
  
  final repository=ref.watch(UserRepositoryProvider);

  return repository.fetchUsersList();
});