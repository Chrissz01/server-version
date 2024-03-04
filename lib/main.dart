import 'package:serverversion/pub_card.dart';
import 'package:flutter/material.dart';

import 'models/pubs.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

void main() => runApp( const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  EverisFridayState createState() => EverisFridayState();
}

class EverisFridayState extends State<MyApp> {

  final List<Pubs> _listPubs = <Pubs>[];
  
  late Future<String> futurePubs;
  
  @override
  void initState() {
    super.initState();
    futurePubs = getPubs(_listPubs);
    print("ZPRRA");
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Everis Fridays Pub',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Everis Fridays Pub'),
          backgroundColor: const Color(0xff9aae04),
        ),
        body: Center(
          child: _buildPubs(),
        ),
      ),
    );
  }

  Widget _buildPubs() {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            // ignore: unnecessary_null_comparison
            projectSnap.hasData == null) {
          return Container();
        }
        return ListView.builder(
          itemCount: _listPubs.length,
          itemBuilder: (context, index) {
            return PubCard(_listPubs[index]);
          },
        );
      },
      future: futurePubs,
    );
  }
}

// ignore: no_leading_underscores_for_local_identifiers
Future<String> getPubs(_listPubs) async {
  print("pene");

  final Response response = await http.get(Uri.parse('http://192.168.1.72:1337/api/pubs'));


  
  if (response.statusCode == 200) {
    print("small dick");
    List<dynamic> pubsListRaw = jsonDecode(response.body);
    print(pubsListRaw);
    for (var i = 0; i < pubsListRaw.length; i++) {
      {
        _listPubs.add(Pubs.fromJson(pubsListRaw[i]));
      }
    }

    return "Success!";
  } else {

    throw Exception('Failed to load data');
  }
  
 
}