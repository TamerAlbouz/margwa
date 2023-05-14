import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetMangaCall {
  static Future<ApiCallResponse> call({
    int? offset,
    String? title = '',
    int? limit,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getManga',
      apiUrl:
          'https://api.mangadex.org/manga?includedTagsMode=AND&excludedTagsMode=OR&contentRating%5B%5D=safe&order%5BlatestUploadedChapter%5D=desc&includes%5B%5D=cover_art&',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'limit': limit,
        'offset': offset,
        'title': title,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class GetChaptersCall {
  static Future<ApiCallResponse> call({
    String? id = 'a72123a4-25e4-4b18-82ab-a4d520aa2417',
    int? offset = 20,
    int? limit = 40,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getChapters',
      apiUrl:
          'https://api.mangadex.org/manga/${id}/feed?translatedLanguage%5B%5D=en&contentRating%5B%5D=safe&includeFutureUpdates=0&order%5Bvolume%5D=desc&order%5Bchapter%5D=desc&includeEmptyPages=0&includes%5B%5D=scanlation_group&',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'limit': limit,
        'offset': offset,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class GetChapterPagesCall {
  static Future<ApiCallResponse> call({
    String? chapterId = 'a54c491c-8e4c-4e97-8873-5b79e59da210',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getChapterPages',
      apiUrl: 'https://api.mangadex.org/at-home/server/${chapterId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.chapter.data''',
        true,
      );
  static dynamic url(dynamic response) => getJsonField(
        response,
        r'''$.baseUrl''',
      );
  static dynamic hash(dynamic response) => getJsonField(
        response,
        r'''$.chapter.hash''',
      );
}

class GetSpecificMangaCall {
  static Future<ApiCallResponse> call({
    int? limit = 10,
    List<String>? idsList,
  }) {
    final ids = _serializeList(idsList);

    return ApiManager.instance.makeApiCall(
      callName: 'getSpecificManga',
      apiUrl:
          'https://api.mangadex.org/manga?includedTagsMode=AND&excludedTagsMode=OR&contentRating%5B%5D=safe&order%5BlatestUploadedChapter%5D=desc&includes%5B%5D=cover_art&',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'limit': limit,
        'ids[]': ids,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
