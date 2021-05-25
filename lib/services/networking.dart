import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.urls);
  final String urls;
  Future getData() async {
    print('came into getdata into networkuing');
    var url = Uri.parse(urls);
    print('printing url took ');
    print(url);
    var response = await http.post(url, body: {});
    print(response.statusCode);
    if (response.statusCode == 200) {
      String data = response.body;
      print('going back from getdata');
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      print('going back from getdata');
    }
  }
}
