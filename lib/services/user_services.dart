part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<UserModel>> signIn(
      String userName, String password) async {
    await Future.delayed(Duration(milliseconds: 500));

    return ApiReturnValue(value: mockUser);
  }
}
