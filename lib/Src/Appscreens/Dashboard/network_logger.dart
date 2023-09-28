import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Netwoklog extends StatefulWidget {
  @override
  _NetwoklogState createState() => _NetwoklogState();
}

class _NetwoklogState extends State<Netwoklog> {
  final client = http.Client();

  @override
  void initState() {
    super.initState();
    // NetworkLoggerOverlay.attachTo(context);
  }

  Future<void> _logNetworkRequest(String method, String url,
      Map<String, String> headers, String? body) async {
    // Log the request details
    debugPrint('HTTP Request: $method $url');
    debugPrint('Headers: $headers');
    if (body != null) {
      debugPrint('Body: $body');
    }

    final response = await client.get(Uri.parse(url));

    // Log the response details
    debugPrint('HTTP Response: ${response.statusCode}');
    debugPrint('Headers: ${response.headers}');
    debugPrint('Response Body: ${response.body}');
  }

  void example1() async {
    await _logNetworkRequest(
        'GET',
        'https://foodapp-b31b9-default-rtdb.asia-southeast1.firebasedatabase.app/Product.json',
        {},
        "");
  }

  void example2() async {
    await _logNetworkRequest(
        'GET',
        'https://foodapp-b31b9-default-rtdb.asia-southeast1.firebasedatabase.app/Product.json',
        {},
        "");
  }

  void example3() async {
    await _logNetworkRequest(
        'DELETE', 'https://jsonplaceholder.typicode.com/users', {}, "");
  }

  void example4() async {
    final data = <String, dynamic>{
      'products': 5,
      'foo': 'bar',
      'hello': [
        'world',
        'dunya',
      ]
    };

    final headers = {'Content-Type': 'application/json'};
    final body = json.encode(data);

    await _logNetworkRequest(
        'POST', 'https://jsonplaceholder.typicode.com/users', headers, body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Network Logger'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('GET'),
            subtitle: Text('Food Api'),
            onTap: example1,
          ),
          ListTile(
            title: Text('GET'),
            subtitle: Text('Food Api'),
            onTap: example2,
          ),
          ListTile(
            title: Text('GET'),
            subtitle: Text('Food Api'),
            onTap: example3,
          ),
          ListTile(
            title: Text('PUT'),
            subtitle: Text('Food Api'),
            onTap: example4,
          ),
        ],
      ),
    );
  }
}
