import 'package:flutter/material.dart';

Widget gameHistoryCard({gameHistoryList}) {
  return ListView.builder(
      itemCount: gameHistoryList.length,
      itemBuilder: (context, index) {
        final game = gameHistoryList[index];
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              game.sport,
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              game.ground,
              style: const TextStyle(fontSize: 22, color: Colors.blue),
            ),
            Text(
              game.address,
              style: const TextStyle(color: Colors.blueGrey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Date: ${game.date.day}-${game.date.month}-${game.date.year}',
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  'Time: ${game.date.hour}:${game.date.minute}',
                  style: const TextStyle(fontSize: 18),
                )
              ],
            ),
            Text(
              'Duration: ${game.durationHour} H : ${game.durationMinute} M',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Players Count: ${game.playerCount}',
              style: const TextStyle(color: Colors.blueGrey),
            )
          ]),
        );
      });
}
