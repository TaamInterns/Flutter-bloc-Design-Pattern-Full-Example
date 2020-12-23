
import 'package:futter_boilerplate/data/models/example_model.dart';

class ExampleRepository {
  static List<ExampleModel> parsJsonList(List<dynamic> entry) {
    List<ExampleModel> _dataList = [];
    if (entry == null) return _dataList;
    for (int i = 0; i < entry.length; i++) {
      _dataList.add(parsJsonModel(entry[i]));
    }
    return _dataList;
  }

  static ExampleModel parsJsonModel(Map<dynamic, dynamic> entry) {
    ExampleModel _data = new ExampleModel();
    if (entry == null) return _data;
    if (entry.containsKey('id')) _data.id = entry['id'];
    if (entry.containsKey('name')) _data.name = entry['name'];
    if (entry.containsKey('price')) _data.price = entry['price'];
    return _data;
  }
}
