import 'package:news/src/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test('FetchTopIds returns a list of ids', () async {
    final newApi = NewsApiProvider();
    newApi.client =  MockClient((request) async {
      return Response(json.encode([1,2,3,4]),200);
    });

    final ids = await newApi.fetchTopIds();
    expect(ids, [1,2,3,4]);

  }); 

  test('FetchItem returns a list of items', () async {
    final newApi =NewsApiProvider();
    final item = {'id': 123};
    newApi.client = MockClient((request) async {
      return Response(json.encode(item), 200);
    });

    final item2 = await newApi.fetchItem(321);

    expect(item2.id, 123);

  });
}