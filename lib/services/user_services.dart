part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<UserModel>> signIn(String userName, String pass,
      {http.Client? client}) async {
    try {
      if (client == null) {
        client = http.Client();
      }

      final status = await OneSignal.shared.getDeviceState();
      final String? osUserID = status?.userId;

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
            'notif_id': osUserID!,
          },
        ),
      );

      if (response.statusCode != 200) {
        var data = jsonDecode(response.body);
        String message = data['meta']['message'];
        return ApiReturnValue(message: message);
      }
      var data = jsonDecode(response.body);

      UserModel value = UserModel.fromJson(data['data']['user']);

      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setInt(
        'role',
        value.roles!.id!,
      );
      pref.setInt(
        'region',
        value.region!.id!,
      );
      pref.setInt(
        'cluster',
        value.cluster!.id!,
      );
      pref.setInt(
        'badanusaha',
        value.badanUsaha!.id!,
      );
      pref.setInt(
        'divisi',
        value.divisi!.id!,
      );
      pref.setString(
        'token',
        data['data']['access_token'].toString(),
      );

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
      SharedPreferences pref = await SharedPreferences.getInstance();

      var response = await client.get(uri, headers: {
        "Content-Type": "application/json",
        'Authorization': "Bearer ${pref.getString('token')}",
      });

      if (response.statusCode != 200) {
        var data = jsonDecode(response.body);
        String message = data['message'];
        return ApiReturnValue(message: message);
      }

      var data = jsonDecode(response.body);
      UserModel value = UserModel.fromJson(data['data']['user']);
      return ApiReturnValue(value: value);
    } catch (err) {
      return ApiReturnValue(message: err.toString());
    }
  }

  static Future<ApiReturnValue<bool>> check(String? token,
      {http.Client? client}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    try {
      if (client == null) {
        client = http.Client();
      }

      String url = baseUrl + 'user';
      Uri uri = Uri.parse(url);

      var response = await client.get(uri, headers: {
        "Content-Type": "application/json",
        'Authorization': "Bearer ${token}",
      });

      if (response.statusCode != 200) {
        var data = jsonDecode(response.body);
        String message = data['meta']['message'];
        return ApiReturnValue(value: false, message: message);
      }

      int? region = pref.getInt('region');
      int? cluster = pref.getInt('cluster');
      int? role = pref.getInt('role');
      int? divisi = pref.getInt('divisi');
      int? badanUsaha = pref.getInt('badanusaha');

      var data = jsonDecode(response.body);

      UserModel user = UserModel.fromJson(data['data']['user']);

      int regionApi = user.region!.id!;
      int clusterApi = user.cluster!.id!;
      int roleApi = user.roles!.id!;
      int divisiApi = user.divisi!.id!;
      int badanUsahaApi = user.badanUsaha!.id!;

      if (region != regionApi ||
          cluster != clusterApi ||
          role != roleApi ||
          divisi != divisiApi ||
          badanUsaha != badanUsahaApi) {
        pref.clear();
        return ApiReturnValue(value: false);
      }

      return ApiReturnValue(value: true);
    } catch (err) {
      return ApiReturnValue(value: false, message: err.toString());
    }
  }

  static Future<ApiReturnValue<bool>> logout({http.Client? client}) async {
    try {
      if (client == null) {
        client = http.Client();
      }

      String url = baseUrl + 'logout';
      Uri uri = Uri.parse(url);
      SharedPreferences pref = await SharedPreferences.getInstance();

      var response = await client.post(uri, headers: {
        "Content-Type": "application/json",
        'Authorization': "Bearer ${pref.getString('token')}",
      });

      if (response.statusCode != 200) {
        var data = jsonDecode(response.body);
        String message = data['message'];
        return ApiReturnValue(value: false, message: message);
      }

      await pref.clear();
      return ApiReturnValue(value: true);
    } catch (err) {
      return ApiReturnValue(value: false, message: err.toString());
    }
  }
}
