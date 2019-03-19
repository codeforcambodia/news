import 'package:http/http.dart' show Client;
import 'dart:async';
import 'dart:convert';
import '../models/item_model.dart';

String url = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider{
  Client client =Client();
  Future<List<int>> fetchTopIds() async {
    final response = await client.get('$url/topstories.json');
    final data = json.decode(response.body);

    return data.cast<int>();
  }
  Future<ItemModel> fetchItem(int id) async{
    final response = await client.get('$url/$id.json');
    final data =json.decode(response.body);
    return ItemModel.fromJson(data);
  }
}