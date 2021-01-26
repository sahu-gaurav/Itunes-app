import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_demo_livestream/constants/strings.dart';
import 'package:news_demo_livestream/models/Info.dart';


class API_Manager {
  Future<Model> getNews() async {
    var client = http.Client();
    var model;

    try {
      var response = await client.get(Strings.url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        model = Model.fromJson(jsonMap);
      }
    } catch (Exception) {
      return model;
    }

    return model;
  }
}
