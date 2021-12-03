import 'package:dio/dio.dart';
import '/helper/something_wrong_exception.dart';
import '/model/user.dart';
import '/repo/dto/user/user_dto.dart';

class UserRepo {
  var dio = Dio();

  Future<List<User>> getUsers() async {
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
