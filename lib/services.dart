import 'dart:io';
import 'package:grisoft_code_challange/const.dart';
import 'package:grisoft_code_challange/controller/api_model.dart';
import 'package:http/http.dart' as http;

class Services {
  static Future<ApiModel> genereteLink(String link) async {
    try {
      final response = await http.get(Uri.parse(kApiHost + link));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return apiModelFromJson(response.body);
      } else {
        return ApiModel(
          ok: false,
          error: 'Server not responding [${response.statusCode}]',
        );
      }
    } on SocketException {
      return ApiModel(
        ok: false,
        error: 'Socket exception!',
      );
    } catch (e, stacktree) {
      //print(stacktree);
      return ApiModel(
        ok: false,
        error: 'Exception! $e',
      );
    }
  }
}
