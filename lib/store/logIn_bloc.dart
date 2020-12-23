import 'dart:async';

import 'package:futter_boilerplate/data/resources/api_provider.dart';

import '../data/resources/storage.dart';
import 'package:http/http.dart';


class LogInBloc {
  final _apiProvider = ApiProvider();

  Future<bool> logIn(String username, String password) async {
    Response _response = await _apiProvider.logIn(username, password);
    if (_response.statusCode == 200) {
      Storage.setApiToken("Your Api Token");
      return true;
    } else
      return false;
  }
}

final logInBloc = LogInBloc();
