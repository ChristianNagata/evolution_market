
import '../../models/user_model.dart';

abstract class UserDatasource {
  Future<UserModel> getUserData(int id);
}