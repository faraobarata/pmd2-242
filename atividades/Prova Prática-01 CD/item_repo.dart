import 'dart:convert';
import 'package:http/http.dart' as http;
import 'item.dart';

class ItemRepository {
  final String apiUrl = 'https://api.thedogapi.com/v1/breeds';

  Future<List<Item>> fetchItems() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Item> items = body.map((dynamic item) => Item.fromJson(item)).toList();
      return items;
    } else {
      throw Exception('Erro ao carregar dados da API');
    }
  }
}
