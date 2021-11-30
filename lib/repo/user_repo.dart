import 'package:dio/dio.dart';
import '/helper/something_wrong_exception.dart';
import '/model/user/user.dart';
import '/model/user/user_dto.dart';

class UserRepo {
  Future<List<User>> getUsers() async {
    var dio = Dio();
    try {
      var response = await dio.get("http://jsonplaceholder.typicode.com/users");

      return response.data!
          .map<User>(
            (snapshot) => UserDTO.fromJson(snapshot).toUser(),
          )
          .toList();
    } catch (e) {
      throw SomethingWrongException();
    }
  }
}
