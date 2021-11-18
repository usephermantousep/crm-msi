import 'dart:convert';
import 'dart:io';
import 'package:crm_msi/model/models.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'outlet_services.dart';
part 'visit_services.dart';
part 'user_services.dart';
part 'noo_services.dart';
part 'plan_visit_services.dart';
part 'tm_services.dart';

String baseUrl = 'http://grosir.mediaselularindonesia.com/api/';
String baseFile = 'http://grosir.mediaselularindonesia.com/storage/';
