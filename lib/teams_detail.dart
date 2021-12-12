import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget team_detail(List listresponse, Color cardcolor) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: listresponse.length,
    itemBuilder: (BuildContext context, int index) {
      String team1 =
          listresponse[index]['predictions']['score'].toString().split("-")[0];
      String team2 =
          listresponse[index]['predictions']['score'].toString().split("-")[1];
      int team1score = int.parse(team1);
      int team2score = int.parse(team2);
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          color: cardcolor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              team(listresponse, index, team1score, team2score),
              Text(
                " ${listresponse[index]['predictions']['result']}",
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget team(List listresponse, int index, int team1score, int team2score) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: [
          const Icon(
            Icons.sports_football,
            color: Colors.white,
            size: 50,
          ),
          Text(
            " ${listresponse[index]['homeTeam']}",
            style: const TextStyle(color: Colors.white, fontSize: 17),
          ),
        ],
      ),
      Text(
          " ${listresponse[index]['predictions']['score'].toString().split("-")[0]}",
          style: team1score > team2score
              ? const TextStyle(color: Colors.green, fontSize: 20)
              : const TextStyle(color: Colors.red, fontSize: 20)),
      const Text(" VS ", style: TextStyle(color: Colors.white, fontSize: 12)),
      Text(
          " ${listresponse[index]['predictions']['score'].toString().split("-")[1]}",
          style: team1score < team2score
              ? const TextStyle(color: Colors.green, fontSize: 20)
              : const TextStyle(color: Colors.red, fontSize: 20)),
      Column(
        children: [
          const Icon(
            Icons.sports_football,
            color: Colors.white,
            size: 50,
          ),
          Text(
            " ${listresponse[index]['awayTeam']}",
            style: const TextStyle(color: Colors.white, fontSize: 17),
          ),
        ],
      ),
    ],
  );
}
// Widget team(List listresponse, int index, int team1score, int team2score) {
//   return Column(
//     children: [
//       const SizedBox(
//         height: 20,
//       ),
//       const Icon(Icons.sports_football),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             " ${listresponse[index]['homeTeam']}",
//             style: const TextStyle(color: Colors.white, fontSize: 15),
//           ),
//           Text(
//               " ${listresponse[index]['predictions']['score'].toString().split("-")[0]}",
//               style: team1score > team2score
//                   ? const TextStyle(color: Colors.green, fontSize: 20)
//                   : const TextStyle(color: Colors.red, fontSize: 20)),
//           const Text(" VS ",
//               style: TextStyle(color: Colors.white, fontSize: 12)),
//           Text(
//               " ${listresponse[index]['predictions']['score'].toString().split("-")[1]}",
//               style: team1score < team2score
//                   ? const TextStyle(color: Colors.green, fontSize: 20)
//                   : const TextStyle(color: Colors.red, fontSize: 20)),
//           Text(
//             " ${listresponse[index]['awayTeam']}",
//             style: const TextStyle(color: Colors.white, fontSize: 15),
//           ),
//         ],
//       ),
//       // Text(
//       //   "Result : ${listresponse[index]['predictions']['result']}",
//       //   style: const TextStyle(color: Colors.white, fontSize: 15),
//       // ),
//       Text(
//         "Result: ${listresponse[index]['predictions']['result']}",
//         style: const TextStyle(color: Colors.white, fontSize: 15),
//       ),
//       //Text(listresponse![index]['Competition_name']),

//       const SizedBox(
//         height: 20,
//       ),
//       // Text(
//       //   "Competition_cluster : ${listresponse[index]['competition_cluster']}",
//       //   style: const TextStyle(color: Colors.white, fontSize: 15),
//       // ),
//       // Text(
//       //   "Status : ${listresponse[index]['status']}",
//       //   style: const TextStyle(color: Colors.white, fontSize: 15),
//       // ),
//       // Text(
//       //   "Federation : ${listresponse[index]['federation']}",
//       //   style: const TextStyle(color: Colors.white, fontSize: 15),
//       // ),
//       // Text(
//       //   "Is expired : ${listresponse[index]['is_expired'].toString()}",
//       //   style: const TextStyle(color: Colors.white, fontSize: 15),
//       // ),
//       // Text(
//       //   "Season : ${listresponse[index]['season']}",
//       //   style: const TextStyle(color: Colors.white, fontSize: 15),
//       // ),
//       // Text(
//       //   "Result : ${listresponse[index]['result']}",
//       //   style: const TextStyle(color: Colors.white, fontSize: 15),
//       // ),
//       // Text(
//       //   "Start_date : ${listresponse[index]['start_date']}",
//       //   style: const TextStyle(color: Colors.white, fontSize: 15),
//       // ),
//       // Text(
//       //   "Last_update_at : ${listresponse[index]['last_update_at']}",
//       //   style: const TextStyle(color: Colors.white, fontSize: 15),
//       // ),
//       // Text(
//       //   "Odds : ${listresponse[index]['odds']}",
//       //   style: const TextStyle(color: Colors.white, fontSize: 15),
//       // ),
//     ],
//   );
// }
