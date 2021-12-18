import 'dart:io';
import 'package:crm_msi/helpers/compress_video.dart';
import 'package:crm_msi/ui/screen/screen.dart';
import 'package:crm_msi/ui/widgets/progressDialogWidget.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image/image.dart' as Img;
import 'package:crm_msi/model/models.dart';
import 'package:crm_msi/services/services.dart';
import 'package:crm_msi/shared/share.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supercharged/supercharged.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:trust_location/trust_location.dart';
import 'package:video_player/video_player.dart';
import 'package:video_compress/video_compress.dart';

part 'app_controller.dart';
part 'home_page_controller.dart';
part 'login_controller.dart';
part 'ci_co_controller.dart';
part 'main_page_controller.dart';
part 'list_noo_controller.dart';
part 'profile_controller.dart';
part 'plan_visit_controller.dart';
part 'register_noo_controller.dart';
part 'detail_noo_controller.dart';
part 'update_foto_controller.dart';
part 'lead_list_controller.dart';
