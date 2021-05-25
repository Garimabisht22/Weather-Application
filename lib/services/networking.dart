import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.urls);
  final String urls;
  Future getData() async {
    var url = Uri.parse(urls);
    var response = await http.post(url, body: {});
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
