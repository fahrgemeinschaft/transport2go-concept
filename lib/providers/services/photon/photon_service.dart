import 'package:dio/browser_imp.dart';
import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:frank_martin/providers/model/photon/feature.dart';
import 'package:frank_martin/providers/model/photon/photon_data.dart';

class PhotonService {
  static String PhotonURL = "";

  static Future<List<Feature>> get(String query) async {
    Dio httpManager = Dio();

    BaseOptions options = BaseOptions(responseType: ResponseType.json);

    if(kIsWeb) {
      httpManager = DioForBrowser(options);
    } else {
      httpManager = Dio(options);
    }
    httpManager.transformer = FlutterTransformer();

    httpManager.interceptors.add(
        DioCacheManager(
            CacheConfig(
              defaultMaxAge: Duration(minutes: 5),
              defaultMaxStale: Duration(days: 1),
              baseUrl: PhotonURL,
            )
        ).interceptor
    );

    var rawResponse = await httpManager.get(
      PhotonURL + "/api",
      queryParameters: {
        "q": query,
        "limit": 5,
        "lon": 10,
        "lat": 52,
        "bbox": "-9.086,35.981,25.467,58.801",
        "location_bias_scale": 2,
        "lang": "de"
      },
    );

    return PhotonData.fromJson(rawResponse.data).features;
  }
}
