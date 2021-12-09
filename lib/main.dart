import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List? mapresponse;
  List? listresponse;
  String? stringresponse;

  Future fetchdata() async {
    http.Response response;
    response = await http.get(
        Uri.parse(
            "https://football-prediction-api.p.rapidapi.com/api/v2/predictions"),
        headers: {
          'x-rapidapi-host': 'football-prediction-api.p.rapidapi.com',
          'x-rapidapi-key': 'd83ac41cb1msh02d38254c7d5f4cp18e066jsne1c62a888b55'
        });
    if (response.statusCode == 200) {
      setState(() {
        mapresponse = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    fetchdata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Football Prediction"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: [
          mapresponse == null
              ? Container(
                  child: const Text("NULL"),
                )
              : ListView.builder(
                  itemCount: mapresponse == null ? 0 : mapresponse?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: [
                          Text(mapresponse![1][index]),
                        ],
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
