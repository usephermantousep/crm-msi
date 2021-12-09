part of 'services.dart';

class NooService {
  static Future<ApiReturnValue<List<NooModel>>> all(
      {http.Client? client}) async {
    try {
      if (client == null) {
        client = http.Client();
      }

      String url = baseUrl + 'noo/';
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
      print(err);
      return ApiReturnValue(value: [], message: err.toString());
    }
  }

  static Future<ApiReturnValue<bool>> submit(
    List<File> images,
    File video,
    String namaOutlet,
    String namaPemilik,
    String ktpnpwp,
    String alamat,
    String nomerPemilik,
    String nomerPerwakilan,
    String distric,
    String oppo,
    String vivo,
    String samsung,
    String realme,
    String xiaomi,
    String fl,
    String latlong, {
    String? bu,
    String? div,
    String? reg,
    String? clus,
    String? jenis,
    http.MultipartRequest? client,
  }) async {
    try {
      String url = "$baseUrl${(jenis == "NOO") ? 'noo' : 'lead'}";
      Uri uri = Uri.parse(url);
      SharedPreferences pref = await SharedPreferences.getInstance();

      switch (pref.getInt('role')) {
        case 1:
          if (client == null) {
            client = http.MultipartRequest('POST', uri)
              ..headers["Content-Type"] = "application/json"
              ..headers["Authorization"] = "Bearer ${pref.getString('token')}"
              ..fields['nama_outlet'] = namaOutlet.toUpperCase()
              ..fields['nama_pemilik'] = namaPemilik.toUpperCase()
              ..fields['ktpnpwp'] = ktpnpwp
              ..fields['alamat_outlet'] = alamat.toUpperCase()
              ..fields['nomer_pemilik'] = nomerPemilik
              ..fields['nomer_perwakilan'] = nomerPerwakilan
              ..fields['distric'] = distric.toUpperCase()
              ..fields['oppo'] = oppo
              ..fields['vivo'] = vivo
              ..fields['samsung'] = samsung
              ..fields['xiaomi'] = xiaomi
              ..fields['realme'] = realme
              ..fields['fl'] = fl
              ..fields['latlong'] = latlong
              ..fields['bu'] = bu!
              ..fields['div'] = div!
              ..fields['reg'] = reg!
              ..fields['clus'] = clus!;
          }
          break;
        case 2:
          if (client == null) {
            client = http.MultipartRequest('POST', uri)
              ..headers["Content-Type"] = "application/json"
              ..headers["Authorization"] = "Bearer ${pref.getString('token')}"
              ..fields['nama_outlet'] = namaOutlet.toUpperCase()
              ..fields['nama_pemilik'] = namaPemilik.toUpperCase()
              ..fields['ktpnpwp'] = ktpnpwp
              ..fields['alamat_outlet'] = alamat.toUpperCase()
              ..fields['nomer_pemilik'] = nomerPemilik
              ..fields['nomer_perwakilan'] = nomerPerwakilan
              ..fields['distric'] = distric.toUpperCase()
              ..fields['oppo'] = oppo
              ..fields['vivo'] = vivo
              ..fields['samsung'] = samsung
              ..fields['xiaomi'] = xiaomi
              ..fields['realme'] = realme
              ..fields['fl'] = fl
              ..fields['latlong'] = latlong
              ..fields['clus'] = clus!;

            print(clus);
          }
          break;
        default:
          if (client == null) {
            client = http.MultipartRequest('POST', uri)
              ..headers["Content-Type"] = "application/json"
              ..headers["Authorization"] = "Bearer ${pref.getString('token')}"
              ..fields['nama_outlet'] = namaOutlet.toUpperCase()
              ..fields['nama_pemilik'] = namaPemilik.toUpperCase()
              ..fields['ktpnpwp'] = ktpnpwp
              ..fields['alamat_outlet'] = alamat.toUpperCase()
              ..fields['nomer_pemilik'] = nomerPemilik
              ..fields['nomer_perwakilan'] = nomerPerwakilan
              ..fields['distric'] = distric.toUpperCase()
              ..fields['oppo'] = oppo
              ..fields['vivo'] = vivo
              ..fields['samsung'] = samsung
              ..fields['xiaomi'] = xiaomi
              ..fields['realme'] = realme
              ..fields['fl'] = fl
              ..fields['latlong'] = latlong;
          }
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

  static Future<ApiReturnValue<bool>> confirm(
      String id, String limit, String kodeOutlet,
      {http.Client? client}) async {
    try {
      if (client == null) {
        client = http.Client();
      }

      String url = baseUrl + 'noo/confirm';
      Uri uri = Uri.parse(url);
      SharedPreferences pref = await SharedPreferences.getInstance();

      var response = await client.post(uri, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${pref.getString('token')}'
      }, body: {
        'id': id,
        'status': 'CONFIRMED',
        'limit': limit,
        'kode_outlet': kodeOutlet.toUpperCase(),
      });

      if (response.statusCode != 200) {
        var data = jsonDecode(response.body);
        String message = data['meta']['message'];
        return ApiReturnValue(value: false, message: message);
      }
      return ApiReturnValue(value: true, message: 'Behasil update');
    } catch (err) {
      print(err.toString());
      return ApiReturnValue(value: false, message: err.toString());
    }
  }

  static Future<ApiReturnValue<bool>> approved(String id,
      {http.Client? client}) async {
    try {
      if (client == null) {
        client = http.Client();
      }

      String url = baseUrl + 'noo/approved';
      Uri uri = Uri.parse(url);
      SharedPreferences pref = await SharedPreferences.getInstance();

      var response = await client.post(uri, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${pref.getString('token')}'
      }, body: {
        'id': id,
        'status': 'APPROVED'
      });

      print(response.statusCode);

      if (response.statusCode != 200) {
        return ApiReturnValue(value: false, message: "Gagal update status NOO");
      }

      return ApiReturnValue(value: true, message: "Berhasil update status NOO");
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
        'alasan': alasan.toUpperCase(),
        'status': 'REJECTED'
      });

      print(response.statusCode);

      if (response.statusCode != 200) {
        return ApiReturnValue(value: false, message: "Gagal update status NOO");
      }

      return ApiReturnValue(value: true, message: "Berhasil update status NOO");
    } catch (err) {
      return ApiReturnValue(value: false, message: err.toString());
    }
  }

  static Future<ApiReturnValue<List<BadanUsahaModel>>> getBu(
      {http.Client? client}) async {
    try {
      if (client == null) {
        client = http.Client();
      }

      String url = baseUrl + 'noo/getbu';
      Uri uri = Uri.parse(url);
      SharedPreferences pref = await SharedPreferences.getInstance();

      var response = await client.get(uri, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${pref.getString('token')}'
      });

      if (response.statusCode != 200) {
        return ApiReturnValue(value: [], message: "error");
      }

      var data = jsonDecode(response.body);

      List<BadanUsahaModel> value = (data['data'] as Iterable)
          .map((e) => BadanUsahaModel.fromJson(e))
          .toList();

      return ApiReturnValue(value: value);
    } catch (err) {
      return ApiReturnValue(value: [], message: err.toString());
    }
  }

  static Future<ApiReturnValue<List<DivisiModel>>> getDiv(String bu,
      {http.Client? client}) async {
    try {
      if (client == null) {
        client = http.Client();
      }

      String url = baseUrl + 'noo/getdiv?bu=$bu';
      Uri uri = Uri.parse(url);
      SharedPreferences pref = await SharedPreferences.getInstance();

      var response = await client.get(uri, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${pref.getString('token')}'
      });

      if (response.statusCode != 200) {
        return ApiReturnValue(value: [], message: "error");
      }

      var data = jsonDecode(response.body);

      List<DivisiModel> value = (data['data'] as Iterable)
          .map((e) => DivisiModel.fromJson(e))
          .toList();

      return ApiReturnValue(value: value);
    } catch (err) {
      return ApiReturnValue(value: [], message: err.toString());
    }
  }

  static Future<ApiReturnValue<List<RegionModel>>> getReg(String bu, String div,
      {http.Client? client}) async {
    try {
      if (client == null) {
        client = http.Client();
      }

      String url = baseUrl + 'noo/getreg?bu=$bu&div=$div';
      Uri uri = Uri.parse(url);
      SharedPreferences pref = await SharedPreferences.getInstance();

      var response = await client.get(uri, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${pref.getString('token')}'
      });

      if (response.statusCode != 200) {
        return ApiReturnValue(value: [], message: "error");
      }

      var data = jsonDecode(response.body);

      List<RegionModel> value = (data['data'] as Iterable)
          .map((e) => RegionModel.fromJson(e))
          .toList();

      return ApiReturnValue(value: value);
    } catch (err) {
      return ApiReturnValue(value: [], message: err.toString());
    }
  }

  static Future<ApiReturnValue<List<ClusterModel>>> getClus(
      {http.Client? client,
      String? bu,
      String? div,
      String? reg,
      int? role}) async {
    try {
      if (client == null) {
        client = http.Client();
      }

      String url = (role == null)
          ? baseUrl + 'noo/getclus?bu=$bu&div=$div&reg=$reg'
          : baseUrl + 'noo/getclus?role=$role';
      Uri uri = Uri.parse(url);
      SharedPreferences pref = await SharedPreferences.getInstance();

      var response = await client.get(uri, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${pref.getString('token')}'
      });

      if (response.statusCode != 200) {
        return ApiReturnValue(value: [], message: "error");
      }

      var data = jsonDecode(response.body);

      List<ClusterModel> value = (data['data'] as Iterable)
          .map((e) => ClusterModel.fromJson(e))
          .toList();

      return ApiReturnValue(value: value);
    } catch (err) {
      return ApiReturnValue(value: [], message: err.toString());
    }
  }
}
