import 'dart:convert';
import 'package:http/http.dart' as http;

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
