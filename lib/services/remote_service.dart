import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

const String _baseURL = 'http://10.0.2.2:8000/';

class Mood {
  Future<List> getAllMoods() async {
    try {
      var uri = Uri.parse("http://10.0.2.2:8000/app/viewsets/mood/");
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var json = response.body;
        return jsonDecode(json);
      } else {
        return Future.error('server error');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}

class ApiService {
  // singleton instance
  String? token;
  int? userID;
  static final ApiService _apiService = ApiService._internal();
  ApiService._internal();
  static ApiService get instance => _apiService;

  final Map<String, String> _headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future<dynamic> post(String url, Map<String, dynamic>? body) async {
    dynamic responseJson;
    print(body);
    //try{
    if (token != null) {
      _headers["Authorization"] = "Bearer " + token!;
    }
    var uri = Uri.parse(_baseURL + url);
    String? strBody;
    if (body != null) {
      strBody = jsonEncode(body);
    }
    final response = await http.post(uri, body: strBody, headers: _headers);
    responseJson = returnResponse(response);
    // } on SocketException {
    //   print('socket exception');
    // }
    return responseJson;
  }

  Future<dynamic> get(String url, {Map<String, dynamic>? parameters}) async {
    dynamic responseJson;

    if (token != null) {
      _headers["Authorization"] = "Bearer " + token!;
    }
    var uri = Uri.parse(_baseURL + url);
    final response = await http.get(uri, headers: _headers);
    if (parameters != null) uri.replace(queryParameters: parameters);
    responseJson = returnResponse(response);

    return responseJson;
  }

  //
  Future<dynamic> put(String url, Map<String, dynamic>? body) async {
    dynamic responseJson;

    if (token != null) {
      _headers["Authorization"] = "Bearer " + token!;
    }
    var uri = Uri.parse(_baseURL + url);
    String? strBody;
    if (body != null) {
      strBody = jsonEncode(body);
    }
    final response = await http.put(uri, body: strBody, headers: _headers);
    responseJson = returnResponse(response);

    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    dynamic responseJson;

    if (token != null) {
      _headers["Authorization"] = "Bearer " + token!;
    }
    var uri = Uri.parse(_baseURL + url);
    final response = await http.delete(uri, headers: _headers);
    responseJson = returnResponse(response);

    return responseJson;
  }

  //
  // Future<dynamic> awsS3PreSignedUpload(XFile xFile) async {
  //   File file = File(xFile.path);
  //   String fileName = xFile.name;
  //   String fileType = fileName.split('.').last;
  //   dynamic responseJson;
  //   try {
  //     if (locator<UserProvider>().currentUserToken != null) {
  //       _headers["Authorization"] =
  //           "Bearer " + locator<UserProvider>().currentUserToken!;
  //     }
  //     // Get pre signed url
  //     dynamic preSignedResponse = await get(ApiUrls.getPreSignedUrl);
  //     if (preSignedResponse != null) {
  //       String awsS3PreSignedUrl = preSignedResponse["data"][0]["signedUrl"];
  //       String awsS3PreSignedKey = preSignedResponse["data"][0]["key"];
  //       // Put file to pre signed url
  //       var uri = Uri.parse(awsS3PreSignedUrl);
  //       var uploadResponse = await http.put(
  //         uri,
  //         body: file.readAsBytesSync(),
  //         headers: {"Content-Type": "image/" + fileType},
  //       );
  //       if (uploadResponse.statusCode == 200) {
  //         String imageUrl = ApiUrls.awsS3BaseUrl + awsS3PreSignedKey;
  //         return imageUrl;
  //       } else {
  //         UiMessages.snackBar(
  //             "Upload Image failed, please try again", AppColors.danger);
  //       }
  //     }
  //     return null;
  //   } on SocketException {
  //     UiMessages.snackBar("No Internet Connection", AppColors.danger);
  //   }
  //   return responseJson;
  // }
  //
  dynamic returnResponse(http.Response response) {
    log(response.body);
    dynamic responseJson = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        return responseJson;
      case 201:
        return responseJson;
      case 400:
      case 401:
      case 404:
        print('ay haga 2');
        return null;
      default:
        print('default');
    }
  }
}
