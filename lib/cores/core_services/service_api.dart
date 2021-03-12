import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:getxtemplate/cores/core_models/model_exception.dart';
import 'package:http/http.dart' as http;
import 'package:safeprint/safeprint.dart';

///enum for method http request
///
enum Method { get, post, put, delete }

///abstract class, template method for class ServiceAPI
///
abstract class ServiceApiAbstract {
  Future hit();
}

class ServiceApi implements ServiceApiAbstract {
  final http.Client? client;
  final Method? method;
  final String endpoint;
  final int timeout;
  final Map<String, dynamic>? body;
  ServiceApi(
      {this.client,
      this.method = Method.get,
      required this.endpoint,
      this.timeout = 60,
      this.body});

  @override
  Future hit() async {
    try {
      String baseUrl = 'https://jsonplaceholder.typicode.com';
      http.Response? res;
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

      http.Client _client = client ?? http.Client();

      switch (method) {
        case Method.get:
          res = await _client
              .get(Uri.parse(baseUrl + '/' + endpoint), headers: headers)
              .timeout(Duration(seconds: timeout));
          break;
        case Method.post:
          var encodedBody = json.encode(body);
          res = await _client
              .post(Uri.parse(baseUrl + '/' + endpoint),
                  body: encodedBody, headers: headers)
              .timeout(Duration(seconds: timeout));
          break;
        case Method.put:
          var encodedBody = json.encode(body);
          res = await _client
              .put(Uri.parse(baseUrl + '/' + endpoint),
                  body: encodedBody, headers: headers)
              .timeout(Duration(seconds: timeout));
          break;
        case Method.delete:
          res = await _client
              .delete(Uri.parse(baseUrl + '/' + endpoint), headers: headers)
              .timeout(Duration(seconds: timeout));
          break;
        default:
      }

      return await ResponseCheck(response: res!).check();
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException catch (_) {
      throw TimeoutException('Time Out');
    } on HandshakeException catch (_) {
      throw HandshakeException('Hand Shake');
    }
  }
}

class ResponseCheck extends ModelException {
  http.Response response;

  ResponseCheck({required this.response});

  check() async {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(json.encode(response.body.toString()));
        SafePrint.safeLog(responseJson);
        return responseJson;
      case 201:
        var responseJson = json.decode(json.encode(response.body.toString()));
        SafePrint.safeLog(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 403:
        throw ForbiddenException(response.body.toString());
      case 404:
        throw NotFoundException(response.body.toString());
      case 500:
        throw InternalServerException(response.body.toString());
      case 502:
        throw BadGatewayException(response.body.toString());
      case 503:
        throw ServiceUnvailableException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
