part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<UserModel>> signIn(
      String userName, String pass) async {
    try {
      await Future.delayed(Duration(milliseconds: 500));

      return ApiReturnValue(value: mockUser);
    } catch (err) {
      return ApiReturnValue(message: err.toString());
    }
  }

  static Future<ApiReturnValue<UserModel>> getSingleUser(int id) async {
    try {
      await Future.delayed(Duration(milliseconds: 500));

      return ApiReturnValue(value: mockUser);
    } catch (err) {
      return ApiReturnValue(message: err.toString());
    }
  }
}
