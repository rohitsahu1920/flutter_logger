import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'Strings.dart';
import 'package:package_info_plus/package_info_plus.dart';


class SaveLogger {

  static void printValue(String value) {
    if (kDebugMode) {
      print(value);
    }
  }

  static Future<void> eventLog({
    String className = "",
    String methodName = "",
    String url = "",
    String postRequest = "",
    String postResponse = "",
    String appLog = "",
  }) async {
    try {
      final String filePath = await getLogFilePath();
      final File file = File(filePath);
      final String classN = className.isNotEmpty
          ? "[ ${LogConstants.className} $className ] |"
          : "";
      final String methodN = methodName.isNotEmpty
          ? "[ ${LogConstants.methodName} $methodName ] |"
          : "";
      final String urlEnd =
      url.isNotEmpty ? "[ ${LogConstants.apiUrl} $url} ] |" : "";
      final String pRequest = postRequest.isNotEmpty
          ? "[ ${LogConstants.apiRequest} $postRequest ] |"
          : "";
      final String log =
      appLog.isNotEmpty ? "[ ${LogConstants.appLog} $appLog ]" : "";

      String finalLog =
          "${DateTime.now().toLocal()} ${classN.isNotEmpty ? classN : ""} ${methodN.isNotEmpty ? methodN : ""} ${urlEnd.isNotEmpty ? urlEnd : ""} ${pRequest.isNotEmpty ? pRequest : ""} ${postResponse.isNotEmpty ? postResponse : ""} ${log.isNotEmpty ? log : ""} \n";

      file.writeAsStringSync(
        finalLog,
        mode: FileMode.append,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<String> getLogFilePath() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final Directory? directory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationSupportDirectory();
    return '${directory?.path}/${packageInfo.appName}.txt';
  }

  static Future<void> deleteLogFilePath() async {
    final Directory? directory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationSupportDirectory();
    directory?.delete(recursive: true);
  }

  static Future<void> openLogger({required String path}) async{
    OpenFile.open(path);
  }
}
