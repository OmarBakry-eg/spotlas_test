import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:spotlas_test_app/src/models/feed_model.dart';
import 'package:spotlas_test_app/src/view/utils/consts.dart';

class FeedController {
  static List<FeedModel> feedModel = <FeedModel>[];

  static Future<bool> getFeed() async {
    try {
      await EasyLoading.show(status: 'Loading');
      final http.Response response = await http.get(
        Uri.parse(API_URL),
      );
      await EasyLoading.dismiss();
      return _responseResult(response);
    } catch (e) {
      if (kDebugMode) {
        print('$e in getFeed func');
      }
      return false;
    }
  }

  static Future<bool> _responseResult(http.Response response) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      feedModel = feedModelFromJson(response.body);
      return true;
    }
    await EasyLoading.showError("Error While getting data");
    return false;
  }
}
