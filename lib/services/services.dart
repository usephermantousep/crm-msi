import 'dart:convert';
import 'dart:io';

import 'package:crm_msi/model/models.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

part 'outlet_services.dart';
part 'visit_services.dart';
part 'user_services.dart';
part 'noo_services.dart';
part 'plan_visit_services.dart';

String baseUrl = 'http://192.168.1.188:8000/api/';
