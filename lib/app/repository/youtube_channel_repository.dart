import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ja_paguei_meus_boletos/app/model/youtube_channels.dart';
import 'package:ja_paguei_meus_boletos/app/service/api/api_client.dart';
import 'package:flutter/services.dart' show rootBundle;

class NewsContainerRepository {
  final ApiClient serviceApi = ApiClient();

  Future<List<YoutubeChannel>> getChannels() async {
    try {
      String data = await rootBundle.loadString('assets/json/Channel.json');
      var jsonResult = json.decode(data);
      return (jsonResult as List)
          .map((item) => YoutubeChannel.fromJson(item))
          .toList();
    } on DioError catch (e) {
      throw (e.message);
    }
  }
}