import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

Future<List<User>> getUserData() async {
  final response = await http.get(
    Uri.https('jsonplaceholder.typicode.com', 'users'),
  );

  if (response.statusCode == 200) {
    final List data = jsonDecode(response.body) as List;

    return data
        .map((item) => User.fromJson(item as Map<String, dynamic>))
        .toList();
  } else {
    throw Exception('Failed to load users');
  }
}