
import 'dart:convert';

import 'package:futter_boilerplate/data/constants/dummy.dart';
import 'package:futter_boilerplate/data/models/example_model.dart';
import 'package:futter_boilerplate/data/repository/example_repository.dart';
import 'package:futter_boilerplate/data/resources/api_provider.dart';
import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';

class ExampleListBloc {
  final _apiProvider = ApiProvider();

  // ignore: close_sinks
  final _exampleList = PublishSubject<List<ExampleModel>>();

  Stream<List<ExampleModel>> get getExampleList => _exampleList.stream;

  fetchExampleList() async {
    /**
     * this is an example code for use dummy data
     */
    Future.delayed(const Duration(milliseconds: 1000), () {
      List<ExampleModel> dummyData = exampleModelList;
      _exampleList.sink.add(dummyData);
    });
    return;
    /**
     * Example Real Fetch Data From Web Service
     */
    Response _response = await _apiProvider.fetchExampleList();
    if (_response.statusCode == 200) {
      dynamic _body = json.decode(_response.body);
      _exampleList.sink.add(ExampleRepository.parsJsonList(_body['data']));
    } else {
      // TODO What you want
    }
  }
}

final exampleListBloc = ExampleListBloc();
