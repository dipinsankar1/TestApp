import 'dart:convert';
import 'package:testapp/constant.dart';
import 'package:testapp/model/searchmodel.dart';
import 'package:http/http.dart' as http;

class ApiModel {
  Future<List<Event>> fetchEvents(String keyword) async {
    final url = "$baseURL?client_id=$kAPIKey&q=$keyword";
    //final response = await http.get(url);
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["events"];
      return json.map((event) => Event.fromJson(event)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
