import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:delivery_flutter/src/api/enviroment.dart';
import 'package:delivery_flutter/src/models/user_model.dart';
import 'package:delivery_flutter/src/models/response_api.dart';

class UserService {
  final String _url = Enviroment.apiDelivery;
  final String _api = '/api/users';

  BuildContext? context;

  void init(BuildContext context) {
    this.context = context;
  }

  //Header conmun que se pueda reutilizar
  Map<String, String> get _headers => {
        'Content-type': 'application/json',
      };

  //Metodo para construir la URL
  Uri _buildUri(String endpoint) {
    return Uri.http(_url, '$_api/$endpoint');
  }

  //create
  Future<ResponseApi> create(User user) async {
    try {
      Uri url = _buildUri('create');
      String bodyParams = json.encode(user);
      final response =
          await http.post(url, headers: _headers, body: bodyParams);
      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        return ResponseApi.fromJson(data);
      } else {
        return ResponseApi(
          success: false,
          message: 'error; ${response.statusCode}',
          data: '',
        );
      }
    } catch (e) {
      return ResponseApi(
        success: false,
        message: 'Excepcion; $e',
        data: '',
      );
    }
  }
}
