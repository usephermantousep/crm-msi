part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<UserModel>> signIn(String userName, String pass,
      {http.Client? client}) async {
    try {
      if (client == null) {
        client = http.Client();
      }

      String url = baseUrl + 'user/login';
      Uri uri = Uri.parse(url);
      var response = await client.post(
        uri,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(
          <String, String>{
            'username': userName,
            'password': pass,
            'notif_id': '123123'
          },
        ),
      );

      if (response.statusCode != 200) {
        var data = jsonDecode(response.body);
        String message = data['meta']['message'];
        return ApiReturnValue(message: message);
      }
      var data = jsonDecode(response.body);
      UserModel.token = data['data']['access_token'].toString();

      UserModel value = UserModel.fromJson(data['data']['user']);

      return ApiReturnValue(value: value);
    } catch (err) {
      return ApiReturnValue(message: err.toString());
    }
  }

  static Future<ApiReturnValue<UserModel>> getSingleUser(
      {http.Client? client}) async {
    try {
      if (client == null) {
        client = http.Client();
      }

      String url = baseUrl + 'user';
      Uri uri = Uri.parse(url);

      var response = await client.get(uri, headers: {
        "Content-Type": "application/json",
        'Authorization': "Bearer ${UserModel.token!}",
      });

      if (response.statusCode != 200) {
        var data = jsonDecode(response.body);
        String message = data['message'];
        return ApiReturnValue(message: message);
      }

      var data = jsonDecode(response.body);
      UserModel value = UserModel.fromJson(data['data'][0]);
      return ApiReturnValue(value: value);
    } catch (err) {
      return ApiReturnValue(message: err.toString());
    }
  }
}
