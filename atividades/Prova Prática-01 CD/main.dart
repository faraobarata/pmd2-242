import 'item.dart';
import 'item_repo.dart';

void main() async {
  final itemRepository = ItemRepository();

  try {
    List<Item> items = await itemRepository.fetchItems();
    for (var item in items) {
      print('ID: ${item.id}, Name: ${item.name}, Description: ${item.description}');
    }
  } catch (e) {
    print('Erro ao buscar itens: $e');
  }
}
