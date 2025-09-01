import 'package:api_homework/quoteapi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Apiservices {
  // Add your API service methods here

  Future<QuoteApi> request(String option) async {
    String apiUrl;
    if (option != Null) {
      apiUrl = 'https://api.adviceslip.com/advice/$option';
    } else{
      apiUrl = 'https://api.adviceslip.com/advice';
    }
    try {
      return await http
          .get(Uri.parse(apiUrl))
          .then((value) {
            if (value.statusCode == 200) {
              // If the server returns an OK response, parse the JSON
              return processResponse(value.body);
            } else {
              // If the server did not return a 200 OK response, throw an exception
              throw Exception('Failed to load event data');
            }
          })
          .catchError((error) {
            // Handle any errors that occur during the request
            print('Request error: $error');
            throw Exception('Failed to request event api');
          });
    } catch (e) {
      // Handle any exceptions that occur during the request
      throw Exception('Failed to get event: $e');
    }
  }

  QuoteApi processResponse(String responseBody) {
    return QuoteApi.fromJson(jsonDecode(responseBody));
  }
}
