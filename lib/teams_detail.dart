import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget team_detail(List listresponse, Color cardcolor) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: listresponse.length,
    itemBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
            color: cardcolor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: team(listresponse, index)),
      );
    },
  );
}

Widget team(List listresponse, int index) {
  return Column(
    children: [
      Text(
        "Home_team : ${listresponse[index]['home_team']}",
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
      Text(
        "Away_team : ${listresponse[index]['away_team']}",
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
      Text(
        "Id : ${listresponse[index]['id'].toString()}",
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
      Text(
        "Market : ${listresponse[index]['market']}",
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
      //Text(listresponse![index]['Competition_name']),
      Text(
        "Prediction : ${listresponse[index]['prediction']}",
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
      Text(
        "Competition_cluster : ${listresponse[index]['competition_cluster']}",
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
      Text(
        "Status : ${listresponse[index]['status']}",
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
      Text(
        "Federation : ${listresponse[index]['federation']}",
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
      Text(
        "Is expired : ${listresponse[index]['is_expired'].toString()}",
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
      Text(
        "Season : ${listresponse[index]['season']}",
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
      Text(
        "Result : ${listresponse[index]['result']}",
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
      Text(
        "Start_date : ${listresponse[index]['start_date']}",
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
      Text(
        "Last_update_at : ${listresponse[index]['last_update_at']}",
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
      Text(
        "Odds : ${listresponse[index]['odds']}",
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
    ],
  );
}
