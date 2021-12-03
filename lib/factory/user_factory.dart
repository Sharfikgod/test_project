import '/model/user.dart';
import '/repo/user_repo.dart';

class UserFactory {
  UserRepo userRepo = UserRepo();

  Future<List<User>> getUsers() async {
    return userRepo.getUsers();
  }
}
