part of 'services.dart';

class VisitServices {
  // static Future<ApiReturnValue<VisitModel>> checkIn(
  //     int outletId,
  //     int userId,
  //     DateTime tanggalVisit,
  //     String latlong,
  //     DateTime checkInTime,
  //     File pictureFile,
  //     {http.MultipartRequest? request}) async {
  //   String url = baseUrl + 'visit';
  //   Uri uri = Uri.parse(url);
  //   if (request == null) {
  //     request = http.MultipartRequest('POST', uri);
  //   }

  //   var multiPartFile =
  //       await http.MultipartFile.fromPath('picure_visit_in', pictureFile.path);

  //   request
  //     ..fields['user_id'] = userId.toString()
  //     ..fields['outlet_id'] = outletId.toString()
  //     ..fields['tanggal_visit'] = tanggalVisit.toString()
  //     ..fields['latlong_in'] = latlong
  //     ..fields['check_in_time'] = checkInTime.toString()
  //     ..files.add(multiPartFile);

  //   var response = await request.send();

  //   if (response.statusCode != 200) {
  //     var data = response.
  //       return ApiReturnValue(message: )
  //   }
  // }
  static Future<ApiReturnValue<List<VisitModel>>> getAll(int userId) async {
    await Future.delayed(Duration(milliseconds: 500));

    return ApiReturnValue(value: mockVisit);
  }
}
