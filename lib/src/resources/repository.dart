import 'dart:async';
import './news_api_provider.dart';
import './news_db_provider.dart';
import '../models/item_model.dart';

class Repository {
  NewDbProvider dbProvider = new NewDbProvider();
  NewsApiProvider apiProvider = new NewsApiProvider();

  Future<List<int>> fetchTopIds() {
    return apiProvider.fetchTopIds();
  }


  Future<ItemModel> fetchItem(int id) async {
    var items = await dbProvider.fetchItem(id);
    if ( items != null) {
      return items;
    }

    items = await apiProvider.fetchItem(id);
    dbProvider.addItem(items);

  }
}