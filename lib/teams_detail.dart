import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget team_detail(List listresponse, Color cardcolor) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: listresponse.length,
    itemBuilder: (BuildContext context, int index) {
      String decide = listresponse[index]['predictions']['result'];
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
            color: cardcolor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: team(listresponse, index, decide)),
      );
    },
  );
}

Widget team(List listresponse, int index, String decide) {
  return Column(
    children: [
      const SizedBox(
        height: 20,
      ),
      Row(
        children: [
          Text(" ${listresponse[index]['homeTeam']}",
              style: const TextStyle(
                  color: decide == "home" ? Colors.green : Colors.red,
                  fontSize: 15)),
          const Text(" Vs ",
              style: TextStyle(color: Colors.white, fontSize: 15)),
          Text(
            " ${listresponse[index]['awayTeam']}",
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
      // Text(
      //   "Result : ${listresponse[index]['predictions']['result']}",
      //   style: const TextStyle(color: Colors.white, fontSize: 15),
      // ),
      Text(
        "Result: ${listresponse[index]['predictions']['result']}",
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
      //Text(listresponse![index]['Competition_name']),
      Text(
        "Score : ${listresponse[index]['predictions']['score'].toString()}",
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
      const SizedBox(
        height: 20,
      ),
      // Text(
      //   "Competition_cluster : ${listresponse[index]['competition_cluster']}",
      //   style: const TextStyle(color: Colors.white, fontSize: 15),
      // ),
      // Text(
      //   "Status : ${listresponse[index]['status']}",
      //   style: const TextStyle(color: Colors.white, fontSize: 15),
      // ),
      // Text(
      //   "Federation : ${listresponse[index]['federation']}",
      //   style: const TextStyle(color: Colors.white, fontSize: 15),
      // ),
      // Text(
      //   "Is expired : ${listresponse[index]['is_expired'].toString()}",
      //   style: const TextStyle(color: Colors.white, fontSize: 15),
      // ),
      // Text(
      //   "Season : ${listresponse[index]['season']}",
      //   style: const TextStyle(color: Colors.white, fontSize: 15),
      // ),
      // Text(
      //   "Result : ${listresponse[index]['result']}",
      //   style: const TextStyle(color: Colors.white, fontSize: 15),
      // ),
      // Text(
      //   "Start_date : ${listresponse[index]['start_date']}",
      //   style: const TextStyle(color: Colors.white, fontSize: 15),
      // ),
      // Text(
      //   "Last_update_at : ${listresponse[index]['last_update_at']}",
      //   style: const TextStyle(color: Colors.white, fontSize: 15),
      // ),
      // Text(
      //   "Odds : ${listresponse[index]['odds']}",
      //   style: const TextStyle(color: Colors.white, fontSize: 15),
      // ),
    ],
  );
}
