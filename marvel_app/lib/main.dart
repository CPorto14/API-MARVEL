import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, dynamic> _characterData = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCharacterData();
  }

  Future<void> _fetchCharacterData() async {
    // Set up API request URL
    final baseUrl = 'https://gateway.marvel.com/v1/public/characters';
    final apiKey = '3dc609c85447e4e09621817160184c7b';
    final privateKey = '1a5237e19c9bbbb71108148c8b84e7697125e8ef';
    final ts = DateTime.now().millisecondsSinceEpoch.toString();
    final preHash = ts + privateKey + apiKey;
    final hash = md5.convert(utf8.encode(preHash)).toString();

    final url =
        '$baseUrl?name=Hulk&ts=$ts&apikey=$apiKey&hash=$hash&orderBy=name';

    // Make API request
    final response = await http.get(Uri.parse(url));
    final responseData = json.decode(response.body);
    final results = responseData['data']['results'];

    if (results.isNotEmpty) {
      setState(() {
        _characterData = results[0];
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personaje elegijo Hulk'),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(
                      '${_characterData['thumbnail']['path']}.${_characterData['thumbnail']['extension']}',
                      height: 200,
                      width: 200,
                    ),
                    SizedBox(height: 20),
                    Text(
                      _characterData['name'],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      _characterData['description'],
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text('Comics: ${_characterData['comics']['available']}'),
                    SizedBox(height: 10),
                    Text('Series: ${_characterData['series']['available']}'),
                    SizedBox(height: 10),
                    Text('Stories: ${_characterData['stories']['available']}'),
                    SizedBox(height: 10),
                    Text('Events: ${_characterData['events']['available']}'),
                    SizedBox(height: 20),
                    Text(' 3 primeras series:'),
                    SizedBox(height: 10),
                    for (var i = 0; i < 3; i++)
                      Text('- ${_characterData['series']['items'][i]['name']}'),
                  ],
                ),
              ),
      ),
    );
  }
}
