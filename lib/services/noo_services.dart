part of 'services.dart';

class NooService extends GetConnect {
  static Future<ApiReturnValue<List<NooModel>>> all(String role,
      {http.Client? client}) async {
    try {
      if (client == null) {
        client = http.Client();
      }

      String url = role == 'SALES' ? baseUrl + 'noo/' : baseUrl + 'noo/all';
      Uri uri = Uri.parse(url);

      SharedPreferences pref = await SharedPreferences.getInstance();

      var response = await client.get(uri, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${pref.getString('token')}'
      });

      if (response.statusCode != 200) {
        var data = jsonDecode(response.body);
        String message = data['meta']['message'];
        return ApiReturnValue(value: [], message: message);
      }

      var data = jsonDecode(response.body);
      List<NooModel> value =
          (data['data'] as Iterable).map((e) => NooModel.fromJson(e)).toList();
      return ApiReturnValue(value: value);
    } catch (err) {
      return ApiReturnValue(value: [], message: err.toString());
    }
  }

  static Future<ApiReturnValue<bool>> submit(
    List<File> images,
    File video, {
    String? namaOutlet,
    String? namaPemilik,
    String? ktpnpwp,
    String? alamat,
    String? nomerPemilik,
    String? nomerPerwakilan,
    String? cluster,
    String? kota,
    String? oppo,
    String? vivo,
    String? samsung,
    String? realme,
    String? xiaomi,
    String? fl,
    String? latlong,
    http.MultipartRequest? client,
  }) async {
    try {
      String url = baseUrl + 'noo';
      Uri uri = Uri.parse(url);
      SharedPreferences pref = await SharedPreferences.getInstance();
      if (client == null) {
        client = http.MultipartRequest('POST', uri)
          ..headers["Content-Type"] = "application/json"
          ..headers["Authorization"] = "Bearer ${pref.getString('token')}"
          ..fields['nama_outlet'] = namaOutlet!
          ..fields['nama_pemilik'] = namaPemilik!
          ..fields['ktpnpwp'] = ktpnpwp!
          ..fields['alamat_outlet'] = alamat!
          ..fields['nomer_pemilik'] = nomerPemilik!
          ..fields['nomer_perwakilan'] = nomerPerwakilan!
          ..fields['cluster'] = cluster!
          ..fields['kota'] = kota!
          ..fields['oppo'] = oppo!
          ..fields['vivo'] = vivo!
          ..fields['samsung'] = samsung!
          ..fields['xiaomi'] = xiaomi!
          ..fields['realme'] = realme!
          ..fields['fl'] = fl!
          ..fields['latlong'] = latlong!;
      }

      for (int i = 0; i < images.length; i++) {
        String fileName = images[i].path.split('/').last;
        var stream = new http.ByteStream(images[i].openRead());

        var length = await images[i].length();

        var multiPartImage = new http.MultipartFile('photo$i', stream, length,
            filename: fileName);

        client.files.add(multiPartImage);
      }
      var multiPartFileVideo =
          await http.MultipartFile.fromPath('video', video.path);
      client.files.add(multiPartFileVideo);

      var response = await client.send();

      if (response.statusCode != 200) {
        return ApiReturnValue(value: false, message: 'Gagal registrasi Noo');
      }

      return ApiReturnValue(
          value: true, message: 'berhasil menambahkan NOO baru');
    } catch (err) {
      return ApiReturnValue(value: false, message: 'Ada kesalahan server');
    }
  }

  static Future<ApiReturnValue<bool>> confirm(String id,
      {String? limit, http.Client? client}) async {
    try {
      if (client == null) {
        client = http.Client();
      }

      String url = baseUrl + 'noo/confirm';
      Uri uri = Uri.parse(url);
      var response;
      SharedPreferences pref = await SharedPreferences.getInstance();

      if (limit != null) {
        response = await client.post(uri, headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${pref.getString('token')}'
        }, body: {
          'id': id,
          'status': 'CONFIRMED',
          'limit': limit,
        });
      } else {
        response = await client.post(uri, headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${pref.getString('token')}'
        }, body: {
          'id': id,
          'status': 'APPROVED',
        });
      }

      if (response.statusCode != 200) {
        var data = jsonDecode(response.body);
        String message = data['meta']['message'];
        return ApiReturnValue(value: false, message: message);
      }
      return ApiReturnValue(value: true, message: 'Behasil update');
    } catch (err) {
      return ApiReturnValue(value: false, message: err.toString());
    }
  }

  static Future<ApiReturnValue<bool>> reject(String id, String alasan,
      {http.Client? client}) async {
    try {
      if (client == null) {
        client = http.Client();
      }

      String url = baseUrl + 'noo/reject';
      Uri uri = Uri.parse(url);
      SharedPreferences pref = await SharedPreferences.getInstance();


      var response = await client.post(uri, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${pref.getString('token')}'
      }, body: {
        'id': id,
        'alasan': alasan,
        'status': 'REJECTED'
      });

      if (response.statusCode != 200) {
        return ApiReturnValue(value: false, message: "Gagal update status NOO");
      }

      return ApiReturnValue(value: true, message: "Berhasil update status NOO");
    } catch (err) {
      return ApiReturnValue(value: false, message: err.toString());
    }
  }
}
